import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../app.dart';
import '../di/app_dependencies.dart';
import 'app_image_cache_policy.dart';

Future<void> bootstrap() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureAppImageCache();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);
  await SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

  final dependencies = await createAppDependencies();
  runApp(ChzzkTvApp(dependencies: dependencies));
  unawaited(dependencies.startAuthSessionRestore());
}
