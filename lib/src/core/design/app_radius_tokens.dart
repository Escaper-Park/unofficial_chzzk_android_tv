import 'package:flutter/material.dart';

enum TvRadius {
  xs(2),
  sm(4),
  md(8),
  lg(12),
  xl(16),
  round(40);

  const TvRadius(this.value);

  final double value;

  BorderRadius get borderRadius {
    return BorderRadius.all(Radius.circular(value));
  }
}
