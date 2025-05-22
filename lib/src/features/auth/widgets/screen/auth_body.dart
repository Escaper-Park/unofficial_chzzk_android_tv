part of '../../auth_screen.dart';

class _AuthBody extends StatefulHookConsumerWidget {
  /// Naver login WebView with the virtual keyboard section.
  const _AuthBody({
    required this.headerText,
    required this.inputField,
  });

  final Widget headerText;
  final Widget inputField;

  @override
  ConsumerState<_AuthBody> createState() => _AuthBodyState();
}

class _AuthBodyState extends ConsumerState<_AuthBody>
    with AuthEvent, AuthState {
  InAppWebViewController? _controller;
  late InAppWebViewSettings _settings;

  @override
  void initState() {
    super.initState();
    _init();
  }

  @override
  Widget build(BuildContext context) {
    final webViewKey = useMemoized(GlobalKey.new, const []);

    return Row(
      children: [
        // left side: inputs
        Expanded(
          child: Column(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    widget.headerText,
                    const SizedBox(height: 10.0),
                    widget.inputField,
                  ],
                ),
              ),
              _virtualKeyboardLayout(),
            ],
          ),
        ),
        // right side: webview
        SizedBox(
          width: Dimensions.naverLoginWebviewWidth,
          child: _inAppWebView(context, webViewKey),
        ),
      ],
    );
  }

  // write it this file to use initialized controller.
  Widget _virtualKeyboardLayout() {
    return VirtualKeyboardLayout(
      routeName: AppRoute.auth.routeName,
      enterKeyName: '입력',
      onEnterPressed: (String inputText) {
        onKeyboardEnterPressed(
          ref,
          controller: _controller,
          inputText: inputText,
        );
      },
    );
  }

  // write it this file to initialize webview controller.
  Widget _inAppWebView(BuildContext context, GlobalKey webViewKey) {
    return InAppWebView(
      key: webViewKey,
      initialSettings: _settings,
      initialUrlRequest: URLRequest(url: WebUri(BaseUrl.naverLogin)),
      onWebViewCreated: (controller) {
        _controller = controller;
      },
      onLoadStop: (controller, url) async {
        await toggleIpSecureSwitch(_controller!);
        await toggleKeepLogin(_controller!);

        final loginStep = getLoginStep(ref);

        if (context.mounted) {
          await checkLoginStateAndGoToHomeScreen(
            ref,
            context: context,
            controller: controller,
            loginStep: loginStep,
          );
        }
      },
    );
  }

  void _init() {
    _settings = InAppWebViewSettings(
      useHybridComposition: false,
      mediaPlaybackRequiresUserGesture: false,
      allowsInlineMediaPlayback: false,
      allowBackgroundAudioPlaying: false,
      allowsPictureInPictureMediaPlayback: false,
      allowsAirPlayForMediaPlayback: false,
      javaScriptEnabled: true,
      cacheEnabled: false,
      userAgent: UserAgent.userAgent,
    );
  }
}
