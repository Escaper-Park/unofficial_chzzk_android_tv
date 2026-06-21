import 'package:flutter/material.dart';

class SettingsPositionIcon extends StatelessWidget {
  const SettingsPositionIcon({
    super.key,
    required this.icon,
    this.alignment = Alignment.center,
    this.size = 32,
    this.iconSize,
  });

  final IconData icon;
  final Alignment alignment;
  final double size;
  final double? iconSize;

  @override
  Widget build(BuildContext context) {
    final effectiveIconSize = iconSize ?? size * 0.5;

    return SizedBox.square(
      dimension: size,
      child: Align(
        alignment: alignment,
        child: Icon(icon, size: effectiveIconSize),
      ),
    );
  }
}
