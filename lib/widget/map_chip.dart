import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame_tiled/flame_tiled.dart';
import 'package:tiled/tiled.dart';
import 'package:flame/palette.dart';

import '../gloabal.dart';
import 'map_wall.dart';

class MapChip extends PositionComponent with HasGameRef, CollisionCallbacks {
  // マップパス
  String mapPath = "";
  // 1フレームのスプライトサイズ
  Vector2 spriteSize = Vector2(32.0, 32.0);

  // マップタイル
  TiledComponent? mapTiled;

  // 壁
  MapWall? mapWall;

  MapChip(this.mapPath, this.spriteSize);

  @override
  Future<void>? onLoad() async {
    // マップタイル
    mapTiled = await TiledComponent.load(mapPath, spriteSize);
    await add(mapTiled!);

    // 壁
    mapWall = MapWall(mapTiled!, spriteSize);
    add(mapWall!);

    // ドア

    await super.onLoad();
  }

  /// 更新処理
  @override
  void update(double dt) {
    super.update(dt);
  }
}
