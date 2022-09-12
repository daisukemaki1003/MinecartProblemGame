import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame_tiled/flame_tiled.dart';

class MapModel extends PositionComponent with HasGameRef, CollisionCallbacks {
  /// マップパス
  final String _mapPath;

  /// マップタイル
  late TiledComponent _tiledComponent;
  TiledComponent get tiledComponent => _tiledComponent;

  MapModel(this._mapPath);

  @override
  Future<void>? onLoad() async {
    /// マップタイル
    _tiledComponent = await TiledComponent.load(_mapPath, Vector2(32, 32));
    await add(_tiledComponent);

    // /// イベント
    // for (var event in _eventObjModel.events) {
    //   final objectGroup =
    //       tiledComponent.tileMap.getLayer<ObjectGroup>(event.name);
    //   print(objectGroup!.name);
    // }

    await super.onLoad();
  }
}
