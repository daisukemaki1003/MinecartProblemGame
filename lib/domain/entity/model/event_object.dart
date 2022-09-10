import 'package:flame/extensions.dart';

class EventObject {
  /// フラグ
  bool _flag;

  /// 位置
  final Vector2 _position;

  /// サイズ
  final Vector2 _objectSize;

  EventObject(this._flag, this._position, this._objectSize);

  Vector2 get position => _position;
  Vector2 get objectSize => _objectSize;
  bool get flag => _flag;

  /// フラグ書き換え
  rewriteFlag() => _flag = !_flag;
}
