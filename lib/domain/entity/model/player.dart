import 'package:flame/extensions.dart';

class Player {
  /// プレイヤーネーム
  final String _name;

  /// イメージパス
  final String _imagePath;

  /// 現在位置
  Vector2 _position;

  Player(this._imagePath, this._name, this._position);

  String get name => _name;
  String get imagePath => _imagePath;
  Vector2 get position => _position;

  /// 現在位置の変更
  void move(Vector2 position) => _position = position;
}
