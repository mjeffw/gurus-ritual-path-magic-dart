class Level {
  const Level(this.name);

  factory Level.fromString(String name) {
    return _values[name];
  }

  static const greater = Level('Greater');
  static const lesser = Level('Lesser');

  static Map<String, Level> _values = {
    greater.name: greater,
    lesser.name: lesser,
  };

  final String name;

  @override
  String toString() => name;
}
