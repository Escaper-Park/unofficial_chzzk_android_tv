import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class WebViewWithDpadPointer extends StatefulHookWidget {
  const WebViewWithDpadPointer({
    super.key,
    required this.initialUrl,
    this.onLoadStop,
  });

  final String initialUrl;
  final Function(InAppWebViewController controller, WebUri? webUri)? onLoadStop;

  @override
  State<WebViewWithDpadPointer> createState() => _WebViewWithDpadPointerState();
}

class _WebViewWithDpadPointerState extends State<WebViewWithDpadPointer> {
  late InAppWebViewController _webViewController;

  @override
  Widget build(BuildContext context) {
    // WebView Settings
    final GlobalKey webViewKey = useMemoized(GlobalKey.new, const []);
    final InAppWebViewSettings settings = InAppWebViewSettings(
      useHybridComposition: true, // For Android
      javaScriptEnabled: true,
      javaScriptCanOpenWindowsAutomatically: true,
      thirdPartyCookiesEnabled: true,
      cacheEnabled: true,
    );

    // Focus
    final focusNode = useFocusNode();

    // Dpad pointer position
    const int posInterval = 15;
    final posX = useState<int>(450);
    final posY = useState<int>(400);

    // Show scrollbar
    final showTopScrollBar = useState<bool>(false);
    final showBottomScrollBar = useState<bool>(false);

    final double maxHeight = MediaQuery.of(context).size.height;
    final double maxWidth = MediaQuery.of(context).size.width;

    dynamic onKey(RawKeyEvent key) {
      // Move dpad pointer position
      if (key.runtimeType.toString() == 'RawKeyDownEvent') {
        RawKeyEventDataAndroid data = key.data as RawKeyEventDataAndroid;
        int dpadKeyValue = data.keyCode;

        switch (dpadKeyValue) {
          case 19: // up
            posY.value -= posInterval;
            if (posY.value < 0) posY.value = 0;
          case 20: // down
            posY.value += posInterval;
            if (posY.value > maxHeight) posY.value = maxHeight.toInt();
          case 21: // left
            posX.value -= posInterval;
            if (posX.value < 0) posX.value = 0;
          case 22: // right
            posX.value += posInterval;
            if (posX.value > maxWidth) posX.value = maxWidth.toInt();
          case 23: // click
            String script = """
var posX = ${posX.value};
var posY = ${posY.value};
var cb = document.elementFromPoint(posX, posY);
cb.click();
cb.focus();
""";
            _webViewController.evaluateJavascript(source: script);
          default:
            break;
        }
      }

      // Show Scrolls
      if (posY.value < posInterval) {
        showTopScrollBar.value = true;
        _webViewController.scrollBy(x: 0, y: -posInterval);
      } else if (posY.value > maxHeight - posInterval) {
        showBottomScrollBar.value = true;
        _webViewController.scrollBy(x: 0, y: posInterval);
      } else {
        showTopScrollBar.value = false;
        showBottomScrollBar.value = false;
      }
    }

    return Stack(
      children: [
        RawKeyboardListener(
          autofocus: true,
          focusNode: focusNode,
          onKey: onKey,
          child: InAppWebView(
            key: webViewKey,
            initialUrlRequest: URLRequest(url: WebUri(widget.initialUrl)),
            initialSettings: settings,
            onWebViewCreated: (controller) {
              _webViewController = controller;
            },
            onLoadStop: widget.onLoadStop,
          ),
        ),
        DpadCursorPointer(
          posX: posX.value,
          posY: posY.value,
        ),
      ],
    );
  }
}

class DpadCursorPointer extends StatelessWidget {
  const DpadCursorPointer({
    super.key,
    required this.posX,
    required this.posY,
    this.size = 20.0,
  });

  final int posX;
  final int posY;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: posX.toDouble(),
      top: posY.toDouble(),
      child: Icon(
        size: size,
        Icons.circle,
        color: Colors.grey.withOpacity(0.85),
      ),
    );
  }
}
