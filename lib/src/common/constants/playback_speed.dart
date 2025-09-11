class PlaybackSpeed {
  static const List<double> values = [
    0.5, 0.75, 1.0, 1.25, 1.5, 1.75, 2.0, 2.25, 2.5, 4.0, 8.0
  ];

  static List<String> get texts =>
      values.map((value) => '${value}x').toList();
}