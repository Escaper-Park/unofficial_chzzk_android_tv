# UI/UX 개선사항

## 1. 포커스 관리 개선

### 현재 문제점
- FocusScope 관리가 복잡하고 일관성이 없음
- TV 리모컨 네비게이션 시 예상과 다른 포커스 이동
- 포커스 상태 시각적 피드백 부족

### 개선 방안

#### A. 통합 포커스 관리 시스템
```dart
class FocusManager {
  static final Map<String, FocusNode> _namedNodes = {};
  static final List<FocusNode> _history = [];
  
  static FocusNode getOrCreate(String name) {
    if (!_namedNodes.containsKey(name)) {
      _namedNodes[name] = FocusNode(debugLabel: name);
    }
    return _namedNodes[name]!;
  }
  
  static void requestFocus(String name) {
    final node = getOrCreate(name);
    if (!node.hasFocus) {
      _history.add(node);
      node.requestFocus();
    }
  }
  
  static void goBack() {
    if (_history.length > 1) {
      _history.removeLast();
      _history.last.requestFocus();
    }
  }
  
  static void resetHistory() {
    _history.clear();
  }
}
```

#### B. 개선된 포커스 네비게이션
```dart
class SmartFocusWidget extends StatelessWidget {
  final Widget child;
  final String? upTarget;
  final String? downTarget;
  final String? leftTarget;
  final String? rightTarget;
  final VoidCallback? onSelect;
  
  const SmartFocusWidget({
    super.key,
    required this.child,
    this.upTarget,
    this.downTarget,
    this.leftTarget,
    this.rightTarget,
    this.onSelect,
  });
  
  @override
  Widget build(BuildContext context) {
    return Focus(
      onKeyEvent: (node, event) {
        if (event is KeyDownEvent) {
          switch (event.logicalKey) {
            case LogicalKeyboardKey.arrowUp:
              if (upTarget != null) {
                FocusManager.requestFocus(upTarget!);
                return KeyEventResult.handled;
              }
              break;
            case LogicalKeyboardKey.arrowDown:
              if (downTarget != null) {
                FocusManager.requestFocus(downTarget!);
                return KeyEventResult.handled;
              }
              break;
            // ... 다른 방향키 처리
          }
        }
        return KeyEventResult.ignored;
      },
      child: child,
    );
  }
}
```

## 2. 접근성 개선

### 현재 문제점
- 스크린 리더 지원 부족
- 시각 장애인을 위한 대체 텍스트 부족
- 고대비 모드 지원 미흡

### 개선 방안

#### A. 접근성 라벨 및 힌트 추가
```dart
class AccessibleVideoCard extends StatelessWidget {
  final Video video;
  final VoidCallback onTap;
  
  const AccessibleVideoCard({
    super.key,
    required this.video,
    required this.onTap,
  });
  
  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: '비디오: ${video.title}',
      hint: '재생하려면 선택하세요',
      value: '길이: ${video.duration}, 조회수: ${video.viewCount}',
      button: true,
      onTap: onTap,
      child: Card(
        child: Column(
          children: [
            Semantics(
              excludeSemantics: true,
              child: Image.network(video.thumbnailUrl),
            ),
            Text(video.title),
            Text('${video.duration} • ${video.viewCount}회'),
          ],
        ),
      ),
    );
  }
}
```

#### B. 고대비 테마 지원
```dart
class AccessibilityTheme {
  static ThemeData highContrastTheme = ThemeData(
    brightness: Brightness.dark,
    colorScheme: const ColorScheme.dark(
      primary: Colors.yellow,
      secondary: Colors.cyan,
      surface: Colors.black,
      onSurface: Colors.white,
      error: Colors.red,
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ),
    ),
  );
  
  static bool get isHighContrastEnabled {
    return MediaQuery.of(context).accessibleNavigation;
  }
}
```

## 3. 반응형 디자인 개선

### 현재 문제점
- 다양한 TV 화면 비율 대응 부족
- 텍스트 크기 조정 옵션 부족
- 콘텐츠 밀도 조정 불가

### 개선 방안

#### A. 적응형 레이아웃
```dart
class ResponsiveGridView extends StatelessWidget {
  final List<Widget> children;
  
  const ResponsiveGridView({
    super.key,
    required this.children,
  });
  
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    
    final crossAxisCount = switch (screenWidth) {
      < 1280 => 2,  // HD
      < 1920 => 3,  // FHD
      < 3840 => 4,  // QHD
      _ => 5,       // 4K+
    };
    
    final spacing = switch (screenWidth) {
      < 1280 => 8.0,
      < 1920 => 12.0,
      _ => 16.0,
    };
    
    return GridView.count(
      crossAxisCount: crossAxisCount,
      crossAxisSpacing: spacing,
      mainAxisSpacing: spacing,
      children: children,
    );
  }
}
```

#### B. 텍스트 스케일링
```dart
class ScalableText extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final TextScaleType scaleType;
  
  const ScalableText(
    this.text, {
    super.key,
    this.style,
    this.scaleType = TextScaleType.body,
  });
  
  @override
  Widget build(BuildContext context) {
    final settings = context.watch(textScaleSettingsProvider);
    final baseSize = switch (scaleType) {
      TextScaleType.headline => 24.0,
      TextScaleType.title => 18.0,
      TextScaleType.body => 14.0,
      TextScaleType.caption => 12.0,
    };
    
    final scaledSize = baseSize * settings.textScale;
    
    return Text(
      text,
      style: (style ?? const TextStyle()).copyWith(
        fontSize: scaledSize,
      ),
    );
  }
}
```

## 4. 애니메이션 및 전환 효과 개선

### 현재 문제점
- 화면 전환 시 갑작스러운 변화
- 로딩 상태 시각적 피드백 부족
- 포커스 이동 시 부드럽지 않은 전환

### 개선 방안

#### A. 부드러운 페이지 전환
```dart
class SmoothPageTransition extends StatelessWidget {
  final Widget child;
  
  const SmoothPageTransition({
    super.key,
    required this.child,
  });
  
  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      transitionBuilder: (child, animation) {
        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(1.0, 0.0),
            end: Offset.zero,
          ).animate(CurvedAnimation(
            parent: animation,
            curve: Curves.easeOutCubic,
          )),
          child: child,
        );
      },
      child: child,
    );
  }
}
```

#### B. 로딩 상태 개선
```dart
class SmartLoadingIndicator extends StatelessWidget {
  final String? message;
  final bool showProgress;
  final double? progress;
  
  const SmartLoadingIndicator({
    super.key,
    this.message,
    this.showProgress = false,
    this.progress,
  });
  
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (showProgress && progress != null)
            CircularProgressIndicator(
              value: progress,
              strokeWidth: 3,
            )
          else
            const CircularProgressIndicator(strokeWidth: 3),
          
          if (message != null) ...[
            const SizedBox(height: 16),
            ScalableText(
              message!,
              style: const TextStyle(color: AppColors.whiteColor),
              scaleType: TextScaleType.body,
            ),
          ],
        ],
      ),
    );
  }
}
```

## 5. 사용자 경험 개선

### 현재 문제점
- 뒤로가기 동작이 일관성이 없음
- 설정 변경 시 즉시 적용되지 않음
- 사용자 선호도 저장 및 복원 미흡

### 개선 방안

#### A. 일관된 네비게이션 패턴
```dart
class NavigationManager {
  static final _routeStack = <String>[];
  
  static void pushRoute(String route) {
    _routeStack.add(route);
  }
  
  static void popRoute() {
    if (_routeStack.isNotEmpty) {
      _routeStack.removeLast();
    }
  }
  
  static String? get currentRoute => 
    _routeStack.isNotEmpty ? _routeStack.last : null;
  
  static bool get canPop => _routeStack.length > 1;
  
  static void handleBackButton(BuildContext context) {
    if (canPop) {
      popRoute();
      Navigator.of(context).pop();
    } else {
      // 앱 종료 확인 다이얼로그
      _showExitDialog(context);
    }
  }
}
```

#### B. 실시간 설정 적용
```dart
@riverpod
class SettingsController extends _$SettingsController {
  @override
  AppSettings build() {
    return AppSettings.load();
  }
  
  void updateSetting<T>(String key, T value) {
    final newSettings = state.copyWith(key: value);
    state = newSettings;
    
    // 즉시 저장
    newSettings.save();
    
    // 관련 Provider들에게 알림
    _notifySettingChange(key, value);
  }
  
  void _notifySettingChange<T>(String key, T value) {
    switch (key) {
      case 'textScale':
        ref.invalidate(textScaleSettingsProvider);
        break;
      case 'theme':
        ref.invalidate(themeProvider);
        break;
      case 'chatSettings':
        ref.invalidate(chatSettingsProvider);
        break;
    }
  }
}
```

## 6. 상태 피드백 개선

### 현재 문제점
- 사용자 액션에 대한 즉각적인 피드백 부족
- 에러 상태 표시가 일관성이 없음
- 성공 액션에 대한 확인 메시지 부족

### 개선 방안

#### A. 토스트 메시지 시스템
```dart
class ToastManager {
  static void showSuccess(BuildContext context, String message) {
    _showToast(
      context,
      message,
      backgroundColor: AppColors.chzzkColor,
      icon: Icons.check_circle,
    );
  }
  
  static void showError(BuildContext context, String message) {
    _showToast(
      context,
      message,
      backgroundColor: AppColors.redColor,
      icon: Icons.error,
    );
  }
  
  static void showInfo(BuildContext context, String message) {
    _showToast(
      context,
      message,
      backgroundColor: AppColors.greyContainerColor,
      icon: Icons.info,
    );
  }
  
  static void _showToast(
    BuildContext context,
    String message, {
    required Color backgroundColor,
    required IconData icon,
  }) {
    final overlay = Overlay.of(context);
    late OverlayEntry entry;
    
    entry = OverlayEntry(
      builder: (context) => ToastWidget(
        message: message,
        backgroundColor: backgroundColor,
        icon: icon,
        onDismiss: () => entry.remove(),
      ),
    );
    
    overlay.insert(entry);
  }
}
```

#### B. 로딩 상태 관리
```dart
@riverpod
class LoadingStateController extends _$LoadingStateController {
  @override
  Map<String, bool> build() => {};
  
  void setLoading(String key, bool isLoading) {
    state = {...state, key: isLoading};
  }
  
  bool isLoading(String key) => state[key] ?? false;
  
  Future<T> withLoading<T>(String key, Future<T> future) async {
    setLoading(key, true);
    try {
      return await future;
    } finally {
      setLoading(key, false);
    }
  }
}
```

## 7. 키보드 단축키 지원

### 현재 문제점
- TV 리모컨 외의 입력 방법 부족
- 고급 사용자를 위한 단축키 없음

### 개선 방안

#### A. 단축키 시스템
```dart
class KeyboardShortcuts extends StatelessWidget {
  final Widget child;
  
  const KeyboardShortcuts({super.key, required this.child});
  
  @override
  Widget build(BuildContext context) {
    return Shortcuts(
      shortcuts: {
        LogicalKeySet(LogicalKeyboardKey.space): PlayPauseIntent(),
        LogicalKeySet(LogicalKeyboardKey.escape): BackIntent(),
        LogicalKeySet(LogicalKeyboardKey.keyS): SearchIntent(),
        LogicalKeySet(LogicalKeyboardKey.keyH): HomeIntent(),
        LogicalKeySet(LogicalKeyboardKey.keyF): FullscreenIntent(),
      },
      child: Actions(
        actions: {
          PlayPauseIntent: PlayPauseAction(),
          BackIntent: BackAction(),
          SearchIntent: SearchAction(),
          HomeIntent: HomeAction(),
          FullscreenIntent: FullscreenAction(),
        },
        child: child,
      ),
    );
  }
}
``` 