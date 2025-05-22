import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class ClipPlayerScreen extends StatelessWidget {
  const ClipPlayerScreen({super.key, required this.clipEmbedUrl});

  final String clipEmbedUrl;

  @override
  Widget build(BuildContext context) {
    final InAppWebViewSettings settings = InAppWebViewSettings(
      useHybridComposition: false,
      javaScriptCanOpenWindowsAutomatically: true,
      javaScriptEnabled: true,
      thirdPartyCookiesEnabled: true,
      useShouldOverrideUrlLoading: true,
      mediaPlaybackRequiresUserGesture: false,
      iframeAllowFullscreen: true,
      iframeAllow: "autoplay; clipboard-write; web-share",
      cacheEnabled: true,
      userAgent:
          'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.3',
    );

    return InAppWebView(
      initialUrlRequest: URLRequest(url: WebUri(clipEmbedUrl)),
      initialSettings: settings,
    );
  }
}
