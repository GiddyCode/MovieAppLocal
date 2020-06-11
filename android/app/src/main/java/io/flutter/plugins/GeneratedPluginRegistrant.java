package io.flutter.plugins;

import androidx.annotation.Keep;
import androidx.annotation.NonNull;

import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.embedding.engine.plugins.shim.ShimPluginRegistry;

/**
 * Generated file. Do not edit.
 * This file is generated by the Flutter tool based on the
 * plugins that support the Android platform.
 */
@Keep
public final class GeneratedPluginRegistrant {
  public static void registerWith(@NonNull FlutterEngine flutterEngine) {
    ShimPluginRegistry shimPluginRegistry = new ShimPluginRegistry(flutterEngine);
      eu.sndr.fluttermdnsplugin.FlutterMdnsPlugin.registerWith(shimPluginRegistry.registrarFor("eu.sndr.fluttermdnsplugin.FlutterMdnsPlugin"));
    flutterEngine.getPlugins().add(new io.flutter.plugins.camera.CameraPlugin());
      io.flutter.plugins.firebase.cloudfirestore.CloudFirestorePlugin.registerWith(shimPluginRegistry.registrarFor("io.flutter.plugins.firebase.cloudfirestore.CloudFirestorePlugin"));
    flutterEngine.getPlugins().add(new io.flutter.plugins.firebaseadmob.FirebaseAdMobPlugin());
    flutterEngine.getPlugins().add(new io.flutter.plugins.firebaseanalytics.FirebaseAnalyticsPlugin());
      io.flutter.plugins.firebaseauth.FirebaseAuthPlugin.registerWith(shimPluginRegistry.registrarFor("io.flutter.plugins.firebaseauth.FirebaseAuthPlugin"));
    flutterEngine.getPlugins().add(new io.flutter.plugins.firebase.core.FirebaseCorePlugin());
    flutterEngine.getPlugins().add(new io.flutter.plugins.firebasemessaging.FirebaseMessagingPlugin());
    flutterEngine.getPlugins().add(new io.flutter.plugins.firebasemlvision.FirebaseMlVisionPlugin());
    flutterEngine.getPlugins().add(new io.flutter.plugins.firebase.storage.FirebaseStoragePlugin());
    flutterEngine.getPlugins().add(new com.example.flutter_braintree.FlutterBraintreePlugin());
    flutterEngine.getPlugins().add(new vn.hunghd.flutterdownloader.FlutterDownloaderPlugin());
    flutterEngine.getPlugins().add(new com.pichillilorenzo.flutter_inappwebview.InAppWebViewFlutterPlugin());
      io.flutter.plugins.flutter_plugin_android_lifecycle.FlutterAndroidLifecyclePlugin.registerWith(shimPluginRegistry.registrarFor("io.flutter.plugins.flutter_plugin_android_lifecycle.FlutterAndroidLifecyclePlugin"));
      io.flutter.plugins.googlesignin.GoogleSignInPlugin.registerWith(shimPluginRegistry.registrarFor("io.flutter.plugins.googlesignin.GoogleSignInPlugin"));
    flutterEngine.getPlugins().add(new io.flutter.plugins.imagepicker.ImagePickerPlugin());
    flutterEngine.getPlugins().add(new io.flutter.plugins.packageinfo.PackageInfoPlugin());
    flutterEngine.getPlugins().add(new io.flutter.plugins.pathprovider.PathProviderPlugin());
      com.baseflow.permissionhandler.PermissionHandlerPlugin.registerWith(shimPluginRegistry.registrarFor("com.baseflow.permissionhandler.PermissionHandlerPlugin"));
      com.zt.shareextend.ShareExtendPlugin.registerWith(shimPluginRegistry.registrarFor("com.zt.shareextend.ShareExtendPlugin"));
    flutterEngine.getPlugins().add(new io.flutter.plugins.sharedpreferences.SharedPreferencesPlugin());
    flutterEngine.getPlugins().add(new com.tekartik.sqflite.SqflitePlugin());
    flutterEngine.getPlugins().add(new io.flutter.plugins.urllauncher.UrlLauncherPlugin());
    flutterEngine.getPlugins().add(new io.flutter.plugins.videoplayer.VideoPlayerPlugin());
    flutterEngine.getPlugins().add(new creativecreatorormaybenot.wakelock.WakelockPlugin());
  }
}
