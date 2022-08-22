import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame_tiled/flame_tiled.dart';
import 'package:tiled/tiled.dart';
import 'package:flame/palette.dart';

import '../gloabal.dart';
import 'map_door.dart';
import 'map_wall.dart';

class MapChip extends PositionComponent with HasGameRef, CollisionCallbacks {
  // マップパス
  String mapPath = "";
  // 1フレームのスプライトサイズ
  Vector2 spriteSize = Vector2(32.0, 32.0);

  // マップタイル
  TiledComponent? mapComponent;

  // 壁
  MapWall? mapWall;

// ドア
  MapDoor? mapDoor;

  MapChip(this.mapPath, this.spriteSize);

  @override
  Future<void>? onLoad() async {
    // マップタイル
    mapComponent = await TiledComponent.load(mapPath, spriteSize);
    await add(mapComponent!);

    // 壁
    mapWall = MapWall(mapComponent!, spriteSize);
    add(mapWall!);

    // ドア
    mapDoor = MapDoor(mapComponent!);
    add(mapDoor!);

    await super.onLoad();
  }

  /// 更新処理
  @override
  void update(double dt) {
    super.update(dt);
  }
}
