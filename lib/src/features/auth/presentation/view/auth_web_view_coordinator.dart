import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../auth_screen_design.dart';
import '../bloc/auth_screen_bloc.dart';
import 'auth_web_view_flow.dart';

final class AuthWebViewCoordinator {
  AuthWebViewCoordinator(
    this._controller,
    this._flow,
    this._bloc,
    this._isMounted,
  );

  final WebViewController _controller;
  final AuthWebViewFlow _flow;
  final AuthScreenBloc _bloc;
  final bool Function() _isMounted;

  var _loginCompleted = false;
  Future<void>? _configureFuture;
  Future<void>? _captureFuture;

  Future<void> configure() {
    return _configureFuture ??= _configure();
  }

  Future<void> _configure() async {
    await _controller.setJavaScriptMode(JavaScriptMode.unrestricted);
    await _controller.setBackgroundColor(Colors.transparent);
    await _controller.enableZoom(false);
    await _controller.setNavigationDelegate(
      NavigationDelegate(
        onPageStarted: (_) {
          _addEvent(
            const AuthScreenEvent.webViewLoadingChanged(isLoading: true),
          );
        },
        onPageFinished: (url) {
          unawaited(_handlePageFinished(url));
        },
        onUrlChange: (change) {
          final url = change.url;
          if (url != null) {
            unawaited(_tryCompleteLogin(url));
          }
        },
        onWebResourceError: (error) {
          if (error.isForMainFrame != true) {
            return;
          }
          _addEvent(
            const AuthScreenEvent.failureReported(
              AuthScreenStatus.loginPageLoadFailure,
            ),
          );
        },
      ),
    );
    if (!_isMounted()) {
      return;
    }

    await _controller.loadRequest(authNaverLoginUri);
  }

  Future<void> reloadLoginPage() async {
    try {
      await configure();
      if (!_isMounted()) {
        return;
      }
      await _flow.reloadLoginPage(controller: _controller);
    } catch (_) {
      _addEvent(
        const AuthScreenEvent.failureReported(
          AuthScreenStatus.webViewControlFailure,
        ),
      );
    }
  }

  Future<void> submitLogin(AuthScreenState state) async {
    _addEvent(const AuthScreenEvent.loginSubmissionStarted());

    try {
      await configure();
      if (!_isMounted()) {
        return;
      }
      final didSubmit = await _flow.injectCredentials(
        controller: _controller,
        id: state.naverId,
        password: state.password,
        captcha: state.captcha,
        captchaRequired: state.isCaptchaRequired,
      );
      if (!_isMounted()) {
        return;
      }

      if (!didSubmit) {
        _addEvent(
          const AuthScreenEvent.failureReported(
            AuthScreenStatus.prepareLoginFailure,
          ),
        );
        return;
      }

      await Future<void>.delayed(const Duration(milliseconds: 900));
      if (!_isMounted()) {
        return;
      }
      await _tryCaptureLoginSession();
      if (_isMounted()) {
        await _syncPageState();
      }
    } catch (_) {
      _addEvent(
        const AuthScreenEvent.failureReported(
          AuthScreenStatus.webViewControlFailure,
        ),
      );
    }
  }

  Future<void> _handlePageFinished(String url) async {
    if (!_isMounted()) {
      return;
    }

    _addEvent(
      const AuthScreenEvent.webViewLoadingChanged(isLoading: false),
    );

    if (_flow.isNaverLoginPageUrl(url)) {
      await _flow.ensureKeepLoginReady(controller: _controller);
    }
    await _tryCompleteLogin(url);
    if (_isMounted()) {
      await _syncPageState();
    }
  }

  Future<void> _syncPageState() async {
    final pageState = await _flow.readPageState(
      controller: _controller,
    );
    if (!_isMounted() || pageState == null) {
      return;
    }

    if (_bloc.state.isCaptchaRequired != pageState.captchaRequired) {
      _bloc.add(
        AuthScreenEvent.captchaRequirementChanged(
          isRequired: pageState.captchaRequired,
        ),
      );
    }
    await _flow.syncCaptchaImageOverlay(
      controller: _controller,
      visible: pageState.captchaRequired,
      height: AuthScreenDesign.captchaOverlayHeight,
    );
    if (pageState.captchaRequired) {
      await _flow.scrollToCaptcha(controller: _controller);
    }
  }

  Future<void> _tryCompleteLogin(String url) async {
    if (!_isMounted() ||
        _loginCompleted ||
        !_flow.shouldCaptureLoginForUrl(url)) {
      return;
    }

    await _tryCaptureLoginSession();
  }

  Future<void> _tryCaptureLoginSession() async {
    if (_loginCompleted) {
      return;
    }

    final pendingCapture = _captureFuture;
    if (pendingCapture != null) {
      await pendingCapture;
      return;
    }

    final captureFuture = _captureLoginSession();
    _captureFuture = captureFuture;
    try {
      await captureFuture;
    } finally {
      if (identical(_captureFuture, captureFuture)) {
        _captureFuture = null;
      }
    }
  }

  Future<void> _captureLoginSession() async {
    if (_loginCompleted) {
      return;
    }

    _addEvent(const AuthScreenEvent.sessionCaptureStarted());
    final result = await _flow.captureLoginSession();
    if (!_isMounted()) {
      return;
    }

    switch (result) {
      case AuthSessionCaptureResult.pending:
        _addEvent(const AuthScreenEvent.sessionCapturePending());
      case AuthSessionCaptureResult.completed:
        _loginCompleted = true;
        _addEvent(const AuthScreenEvent.loginCompleted());
    }
  }

  void _addEvent(AuthScreenEvent event) {
    if (!_isMounted()) {
      return;
    }

    _bloc.add(event);
  }
}
