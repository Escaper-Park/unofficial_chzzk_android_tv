import 'package:flutter/material.dart';

final class LiveOverlayPrimaryLinks {
  LiveOverlayPrimaryLinks();

  final play = LayerLink();
  final multiviewSettings = LayerLink();
  final chatMode = LayerLink();
  final screenMode = LayerLink();
  final viewMode = LayerLink();
  final favorite = LayerLink();
  final settings = LayerLink();
}

final class LiveOverlaySettingsLinks {
  LiveOverlaySettingsLinks();

  final chat = LayerLink();
  final resolution = LayerLink();
  final sound = LayerLink();
  final group = LayerLink();
}

final class LiveOverlayMultiviewSettingsLinks {
  LiveOverlayMultiviewSettingsLinks();

  final defaults = LayerLink();
  final broadcast = LayerLink();
  final resolution = LayerLink();
  final sound = LayerLink();
  final info = LayerLink();
}

final class LiveOverlayMultiviewDefaultSettingsLinks {
  LiveOverlayMultiviewDefaultSettingsLinks();

  final chatPositionX = LayerLink();
  final chatPositionY = LayerLink();
  final pipPositionX = LayerLink();
  final pipPositionY = LayerLink();
  final pipSize = LayerLink();

  List<LayerLink> get all => [
    chatPositionX,
    chatPositionY,
    pipPositionX,
    pipPositionY,
    pipSize,
  ];
}
