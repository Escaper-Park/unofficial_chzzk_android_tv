package com.escaperbgp.unofficial_chzzk_android_tv

import android.webkit.CookieManager
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

object AuthCookieChannel {
    private const val CHANNEL_NAME = "unofficial_chzzk_android_tv/auth_cookies"
    private const val METHOD_GET_COOKIE_HEADER = "getCookieHeader"

    fun register(flutterEngine: FlutterEngine) {
        MethodChannel(
            flutterEngine.dartExecutor.binaryMessenger,
            CHANNEL_NAME,
        ).setMethodCallHandler { call, result ->
            when (call.method) {
                METHOD_GET_COOKIE_HEADER -> {
                    val url = call.argument<String>("url")
                    if (url.isNullOrBlank()) {
                        result.error("bad_args", "url is required", null)
                        return@setMethodCallHandler
                    }

                    result.success(CookieManager.getInstance().getCookie(url))
                }

                else -> result.notImplemented()
            }
        }
    }
}
