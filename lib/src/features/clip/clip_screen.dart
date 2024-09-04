import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class ClipScreen extends StatefulWidget {
  const ClipScreen({super.key, required this.url});

  final String url;

  @override
  State<ClipScreen> createState() => _ClipScreenState();
}

class _ClipScreenState extends State<ClipScreen> {
  InAppWebViewSettings settings = InAppWebViewSettings(
    useHybridComposition: false,
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InAppWebView(
        initialUrlRequest: URLRequest(url: WebUri(widget.url)),
        initialSettings: settings,
      ),
    );
  }
}
