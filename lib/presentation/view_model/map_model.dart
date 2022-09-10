import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame_tiled/flame_tiled.dart';

class MapModel extends PositionComponent with HasGameRef, CollisionCallbacks {
  // マップパス
  final String _mapPath;
  // // 1フレームのスプライトサイズ
  // final Vector2 _spriteSize;
  // マップタイル
  late TiledComponent mapComponent;

  MapModel(this._mapPath);

  @override
  Future<void>? onLoad() async {
    // マップタイル
    mapComponent = await TiledComponent.load(_mapPath, Vector2(32, 32));
    await add(mapComponent);
    await super.onLoad();
  }

  // /// 更新処理
  // @override
  // void update(double dt) {
  //   super.update(dt);
  // }
}
