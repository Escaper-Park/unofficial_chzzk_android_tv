package com.escaperbgp.unofficial_chzzk_android_tv

import android.content.pm.PackageManager
import android.os.Build
import android.os.Bundle
import android.util.Log
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.embedding.engine.renderer.FlutterRenderer

class MainActivity : FlutterActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        // Flutter 3.44 uses an ImageReader-backed SurfaceProducer on API 29+.
        // Some TV decoder paths do not interoperate with it correctly: Amlogic
        // devices can drop external-texture frames, while Google TV Streamer
        // (kirkwood) can leave a green buffer and draw a resolution-switched
        // frame at only part of the texture. This pinned-engine workaround is
        // valid only while the manifest explicitly keeps Impeller disabled.
        val workaroundReason = glSurfaceProducerWorkaroundReason()
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.Q &&
            workaroundReason != null &&
            isImpellerExplicitlyDisabled()
        ) {
            FlutterRenderer.debugForceSurfaceProducerGlTextures = true
            Log.i(
                TAG,
                "Using GL SurfaceTexture SurfaceProducer for $workaroundReason",
            )
        }
        super.onCreate(savedInstanceState)
    }

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        AuthCookieChannel.register(flutterEngine)
    }

    @Suppress("DEPRECATION")
    private fun isImpellerExplicitlyDisabled(): Boolean {
        return try {
            val appInfo = packageManager.getApplicationInfo(
                packageName,
                PackageManager.GET_META_DATA,
            )
            val metadata = appInfo.metaData ?: return false
            metadata.containsKey(ENABLE_IMPELLER_METADATA) &&
                !metadata.getBoolean(ENABLE_IMPELLER_METADATA)
        } catch (_: PackageManager.NameNotFoundException) {
            false
        }
    }

    private fun isAmlogicDevice(): Boolean {
        val identifiers = mutableListOf(
            Build.HARDWARE,
            Build.BOARD,
            Build.DEVICE,
        )
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.S) {
            identifiers += Build.SOC_MANUFACTURER
            identifiers += Build.SOC_MODEL
        }

        return identifiers.any { value ->
            val normalized = value.orEmpty().trim().lowercase()
            normalized.contains("amlogic") || normalized.contains("meson")
        }
    }

    private fun glSurfaceProducerWorkaroundReason(): String? {
        return when {
            isAmlogicDevice() -> "Amlogic TV"
            isGoogleTvStreamer() -> "Google TV Streamer"
            else -> null
        }
    }

    private fun isGoogleTvStreamer(): Boolean {
        val googleBuild = sequenceOf(
            Build.BRAND,
            Build.MANUFACTURER,
        ).any { value ->
            value.orEmpty().trim().equals(GOOGLE_BRAND, ignoreCase = true)
        } || Build.FINGERPRINT.orEmpty().startsWith(
            "$GOOGLE_BRAND/",
            ignoreCase = true,
        )
        if (!googleBuild) {
            return false
        }

        return Build.DEVICE.orEmpty().trim().equals(
            GOOGLE_TV_STREAMER_DEVICE,
            ignoreCase = true,
        ) || Build.MODEL.orEmpty().trim().equals(
            GOOGLE_TV_STREAMER_MODEL,
            ignoreCase = true,
        )
    }

    private companion object {
        const val TAG = "ChzzkMainActivity"
        const val ENABLE_IMPELLER_METADATA =
            "io.flutter.embedding.android.EnableImpeller"
        const val GOOGLE_BRAND = "google"
        const val GOOGLE_TV_STREAMER_DEVICE = "kirkwood"
        const val GOOGLE_TV_STREAMER_MODEL = "Google TV Streamer"
    }
}
