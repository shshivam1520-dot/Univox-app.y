class SpeedService {
  double _speed = 1.0;

  double get speed => _speed;

  void setSpeed(double value) {
    if (value >= 0.5 && value <= 3.0) {
      _speed = value;
    }
  }

  String status() => "Current speed: $_speed x";
}
