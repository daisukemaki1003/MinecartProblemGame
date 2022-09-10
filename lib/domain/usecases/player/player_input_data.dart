import 'package:flame/extensions.dart';

class PlayerAddInputData {
  final String _name;
  final String _imagePath;
  final Vector2 _position;

  PlayerAddInputData(this._name, this._imagePath, this._position);

  String get name => _name;
  String get imagePath => _imagePath;
  Vector2 get position => _position;
}

class PlayerGetDetailInputData {}

class PlayerMoveInputData {
  final Vector2 _position;

  PlayerMoveInputData(this._position);

  Vector2 get position => _position;
}
