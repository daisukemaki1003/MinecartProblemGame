import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame_tiled/flame_tiled.dart';

class MyMapComponent extends PositionComponent
    with HasGameRef, CollisionCallbacks {
  final String _imagePath;
  late TiledComponent _tiledComponent;
  TiledComponent get tiledComponent => _tiledComponent;

  MyMapComponent(this._imagePath);

  @override
  Future<void>? onLoad() async {
    /// マップタイル
    _tiledComponent = await TiledComponent.load(_imagePath, Vector2(32, 32));
    await add(_tiledComponent);
  }
}
