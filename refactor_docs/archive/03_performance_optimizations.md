# 성능 최적화 개선사항

## 1. 이미지 로딩 최적화

### 현재 문제점
- 이미지 캐싱 전략이 일관되지 않음
- TV 해상도에 맞지 않는 이미지 로딩으로 메모리 낭비
- 리스트 스크롤 시 이미지 로딩으로 인한 버벅임

### 개선 방안

#### A. 이미지 캐시 전략 개선
```dart
class OptimizedCachedNetworkImage extends StatelessWidget {
  final String imageUrl;
  final double? width;
  final double? height;
  final BoxFit fit;
  
  const OptimizedCachedNetworkImage({
    super.key,
    required this.imageUrl,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
  });
  
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      width: width,
      height: height,
      fit: fit,
      memCacheWidth: width?.cacheSize(context),
      memCacheHeight: height?.cacheSize(context),
      maxWidthDiskCache: (width ?? 500) * 2, // TV용 고해상도 대응
      maxHeightDiskCache: (height ?? 500) * 2,
      placeholder: (context, url) => _buildPlaceholder(),
      errorWidget: (context, url, error) => _buildErrorWidget(),
      fadeInDuration: const Duration(milliseconds: 200),
      fadeOutDuration: const Duration(milliseconds: 100),
    );
  }
}
```

#### B. 이미지 프리로딩
```dart
class ImagePreloader {
  static final _cache = <String, ImageProvider>{};
  
  static Future<void> preloadImages(List<String> urls, BuildContext context) async {
    final futures = urls.take(10).map((url) async { // 처음 10개만 미리 로드
      if (!_cache.containsKey(url)) {
        final provider = CachedNetworkImageProvider(url);
        _cache[url] = provider;
        await precacheImage(provider, context);
      }
    });
    
    await Future.wait(futures);
  }
}
```

## 2. 리스트 렌더링 최적화

### 현재 문제점
- 긴 리스트에서 모든 아이템을 한 번에 렌더링
- FocusNode 생성이 비효율적
- 스크롤 성능 저하

### 개선 방안

#### A. Lazy Loading 개선
```dart
class OptimizedGridView<T> extends HookWidget {
  final List<T> items;
  final Widget Function(T item, int index) itemBuilder;
  final int crossAxisCount;
  
  const OptimizedGridView({
    super.key,
    required this.items,
    required this.itemBuilder,
    required this.crossAxisCount,
  });
  
  @override
  Widget build(BuildContext context) {
    final scrollController = useScrollController();
    final visibleRange = useState<(int, int)>((0, 20));
    
    useEffect(() {
      void updateVisibleRange() {
        final scrollOffset = scrollController.offset;
        final viewportHeight = scrollController.position.viewportDimension;
        const itemHeight = 200.0;
        
        final startIndex = math.max(0, (scrollOffset / itemHeight).floor() - 5);
        final endIndex = math.min(
          items.length,
          ((scrollOffset + viewportHeight) / itemHeight).ceil() + 5,
        );
        
        visibleRange.value = (startIndex, endIndex);
      }
      
      scrollController.addListener(updateVisibleRange);
      return () => scrollController.removeListener(updateVisibleRange);
    }, [scrollController]);
    
    return GridView.builder(
      controller: scrollController,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
      ),
      itemCount: items.length,
      itemBuilder: (context, index) {
        final (start, end) = visibleRange.value;
        if (index < start || index >= end) {
          return const SizedBox(); // 빈 공간으로 처리
        }
        
        return itemBuilder(items[index], index);
      },
    );
  }
}
```

#### B. 효율적인 FocusNode 관리
```dart
class FocusNodePool {
  static final _pool = <FocusNode>[];
  static final _inUse = <FocusNode>{};
  
  static FocusNode acquire() {
    if (_pool.isNotEmpty) {
      final node = _pool.removeLast();
      _inUse.add(node);
      return node;
    }
    
    final node = FocusNode();
    _inUse.add(node);
    return node;
  }
  
  static void release(FocusNode node) {
    if (_inUse.remove(node)) {
      _pool.add(node);
    }
  }
  
  static void dispose() {
    for (final node in [..._pool, ..._inUse]) {
      node.dispose();
    }
    _pool.clear();
    _inUse.clear();
  }
}
```

## 3. 메모리 관리 최적화

### 현재 문제점
- VideoPlayerController 생명주기 관리 미흡
- Provider dispose 타이밍 최적화 필요
- 메모리 누수 가능성

### 개선 방안

#### A. 자동 메모리 정리
```dart
@riverpod
class MemoryManager extends _$MemoryManager {
  Timer? _cleanupTimer;
  
  @override
  void build() {
    _startPeriodicCleanup();
  }
  
  void _startPeriodicCleanup() {
    _cleanupTimer?.cancel();
    _cleanupTimer = Timer.periodic(
      const Duration(minutes: 5),
      (_) => _performCleanup(),
    );
  }
  
  void _performCleanup() {
    // 이미지 캐시 정리
    imageCache.clear();
    imageCache.clearLiveImages();
    
    // FocusNode 풀 정리
    FocusNodePool.cleanupUnused();
    
    // 사용하지 않는 Provider 정리
    ref.container.refresh(unusedProvidersProvider);
  }
  
  @override
  void dispose() {
    _cleanupTimer?.cancel();
    super.dispose();
  }
}
```

#### B. VideoPlayer 메모리 최적화
```dart
class VideoPlayerManager {
  static final Map<String, VideoPlayerController> _controllers = {};
  static Timer? _cleanupTimer;
  
  static VideoPlayerController getOrCreate(String url) {
    _startCleanupTimer();
    
    if (_controllers.containsKey(url)) {
      return _controllers[url]!;
    }
    
    final controller = VideoPlayerController.network(url);
    _controllers[url] = controller;
    
    return controller;
  }
  
  static void _startCleanupTimer() {
    _cleanupTimer?.cancel();
    _cleanupTimer = Timer(const Duration(minutes: 2), _cleanupUnusedControllers);
  }
  
  static void _cleanupUnusedControllers() {
    final toRemove = <String>[];
    
    for (final entry in _controllers.entries) {
      if (!entry.value.value.isInitialized || 
          !entry.value.value.isPlaying) {
        entry.value.dispose();
        toRemove.add(entry.key);
      }
    }
    
    for (final key in toRemove) {
      _controllers.remove(key);
    }
  }
}
```

## 4. 네트워크 최적화

### 현재 문제점
- 동시 API 요청 제한 없음
- 중복 요청 방지 미흡
- 페이지네이션 최적화 부족

### 개선 방안

#### A. 요청 중복 제거
```dart
class RequestDeduplicator {
  static final _activeRequests = <String, Future<dynamic>>{};
  
  static Future<T> deduplicate<T>(
    String key,
    Future<T> Function() request,
  ) async {
    if (_activeRequests.containsKey(key)) {
      return await _activeRequests[key] as T;
    }
    
    final future = request();
    _activeRequests[key] = future;
    
    try {
      final result = await future;
      return result;
    } finally {
      _activeRequests.remove(key);
    }
  }
}

// Repository에서 사용
class OptimizedLiveRepository {
  Future<LiveResponse?> getLiveResponse({
    required int size,
    required String sortType,
  }) async {
    final key = 'live_${size}_$sortType';
    
    return RequestDeduplicator.deduplicate(
      key,
      () => _repository.getLiveResponse(size: size, sortType: sortType),
    );
  }
}
```

#### B. 스마트 페이지네이션
```dart
class PaginationController<T> {
  final List<T> _items = [];
  final int _pageSize;
  bool _isLoading = false;
  bool _hasMoreData = true;
  
  PaginationController({required int pageSize}) : _pageSize = pageSize;
  
  List<T> get items => List.unmodifiable(_items);
  bool get isLoading => _isLoading;
  bool get hasMoreData => _hasMoreData;
  
  Future<void> loadNextPage(Future<List<T>> Function(int offset) fetcher) async {
    if (_isLoading || !_hasMoreData) return;
    
    _isLoading = true;
    
    try {
      final newItems = await fetcher(_items.length);
      
      if (newItems.length < _pageSize) {
        _hasMoreData = false;
      }
      
      _items.addAll(newItems);
    } finally {
      _isLoading = false;
    }
  }
  
  void reset() {
    _items.clear();
    _hasMoreData = true;
    _isLoading = false;
  }
}
```

## 5. UI 렌더링 최적화

### 현재 문제점
- 불필요한 위젯 rebuild 발생
- BuildContext 과도한 사용
- 복잡한 위젯 트리

### 개선 방안

#### A. 위젯 분리 및 const 사용
```dart
// Before
class ComplexWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(color: Colors.blue, child: Text('Header')),
        ExpensiveWidget(data: someData),
        Container(color: Colors.red, child: Text('Footer')),
      ],
    );
  }
}

// After
class OptimizedComplexWidget extends StatelessWidget {
  const OptimizedComplexWidget({super.key});
  
  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        _HeaderWidget(),
        _ExpensiveWidget(),
        _FooterWidget(),
      ],
    );
  }
}

class _HeaderWidget extends StatelessWidget {
  const _HeaderWidget();
  
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: const Text('Header'),
    );
  }
}
```

#### B. Consumer 위치 최적화
```dart
// Before - 전체 위젯이 rebuild됨
class BadExample extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider);
    
    return Column(
      children: [
        const ExpensiveStaticWidget(),
        Text(user?.name ?? 'Unknown'),
        const AnotherExpensiveWidget(),
      ],
    );
  }
}

// After - 필요한 부분만 rebuild
class GoodExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        ExpensiveStaticWidget(),
        _UserNameWidget(),
        AnotherExpensiveWidget(),
      ],
    );
  }
}

class _UserNameWidget extends ConsumerWidget {
  const _UserNameWidget();
  
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider);
    return Text(user?.name ?? 'Unknown');
  }
}
```

## 6. 비동기 처리 최적화

### 현재 문제점
- Future 체이닝이 복잡함
- 불필요한 await 사용
- Isolate 활용 부족

### 개선 방안

#### A. 병렬 처리 개선
```dart
// Before - 순차 처리
Future<UserProfile> loadUserProfile(String userId) async {
  final user = await userRepository.getUser(userId);
  final followers = await followRepository.getFollowers(userId);
  final videos = await videoRepository.getUserVideos(userId);
  
  return UserProfile(user: user, followers: followers, videos: videos);
}

// After - 병렬 처리
Future<UserProfile> loadUserProfileOptimized(String userId) async {
  final results = await Future.wait([
    userRepository.getUser(userId),
    followRepository.getFollowers(userId),
    videoRepository.getUserVideos(userId),
  ]);
  
  return UserProfile(
    user: results[0] as User,
    followers: results[1] as List<Follower>,
    videos: results[2] as List<Video>,
  );
}
```

#### B. 백그라운드 작업 Isolate 활용
```dart
class BackgroundProcessor {
  static Future<List<ParsedData>> parseDataInBackground(
    List<RawData> rawData,
  ) async {
    return compute(_parseData, rawData);
  }
  
  static List<ParsedData> _parseData(List<RawData> rawData) {
    // 무거운 파싱 작업
    return rawData.map((data) => ParsedData.fromRaw(data)).toList();
  }
}
``` 