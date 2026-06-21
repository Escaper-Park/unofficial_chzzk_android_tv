import java.util.Properties

plugins {
    id("com.android.application")
    // The Flutter Gradle Plugin must be applied after the Android and Kotlin Gradle plugins.
    id("dev.flutter.flutter-gradle-plugin")
}

val releaseKeystoreProperties = Properties()
val releaseKeystorePropertiesFile = rootProject.file("key.properties")
if (releaseKeystorePropertiesFile.isFile) {
    releaseKeystorePropertiesFile.inputStream().use(releaseKeystoreProperties::load)
}

fun releaseSigningProperty(name: String): String? {
    val propertyName = "CHZZK_TV_$name"
    return providers.gradleProperty(propertyName).orNull?.takeIf(String::isNotBlank)
        ?: providers.environmentVariable(propertyName).orNull?.takeIf(String::isNotBlank)
        ?: releaseKeystoreProperties.getProperty(name)?.takeIf(String::isNotBlank)
}

val releaseStoreFile = releaseSigningProperty("STORE_FILE")
val releaseStorePassword = releaseSigningProperty("STORE_PASSWORD")
val releaseKeyAlias = releaseSigningProperty("KEY_ALIAS")
val releaseKeyPassword = releaseSigningProperty("KEY_PASSWORD")
val hasReleaseSigning =
    releaseStoreFile != null &&
        releaseStorePassword != null &&
        releaseKeyAlias != null &&
        releaseKeyPassword != null

android {
    namespace = "com.escaperbgp.unofficial_chzzk_android_tv"
    compileSdk = flutter.compileSdkVersion
    ndkVersion = flutter.ndkVersion

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
    }

    defaultConfig {
        applicationId = "com.escaperbgp.unofficial_chzzk_android_tv"
        // You can update the following values to match your application needs.
        // For more information, see: https://flutter.dev/to/review-gradle-config.
        minSdk = flutter.minSdkVersion
        targetSdk = flutter.targetSdkVersion
        versionCode = flutter.versionCode
        versionName = flutter.versionName
        manifestPlaceholders["appLabel"] = "UnOfficial Chzzk for Android TV"
    }

    signingConfigs {
        create("release") {
            if (hasReleaseSigning) {
                storeFile = file(releaseStoreFile!!)
                storePassword = releaseStorePassword
                keyAlias = releaseKeyAlias
                keyPassword = releaseKeyPassword
            }
        }
    }

    buildTypes {
        release {
            if (hasReleaseSigning) {
                signingConfig = signingConfigs.getByName("release")
            }
        }
    }
}

kotlin {
    compilerOptions {
        jvmTarget = org.jetbrains.kotlin.gradle.dsl.JvmTarget.JVM_17
    }
}

flutter {
    source = "../.."
}
