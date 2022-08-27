import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame_tiled/flame_tiled.dart';
import 'package:frame_demo/model/flag.dart';
import 'package:tiled/tiled.dart';
import 'package:flame/palette.dart';

import 'map_respawn.dart';
import 'map_wall.dart';

class MapChip extends PositionComponent with HasGameRef, CollisionCallbacks {
  // マップパス
  String mapPath = "";
  // 1フレームのスプライトサイズ
  Vector2 spriteSize;
  // マップタイル
  TiledComponent? mapComponent;
  // 壁
  MapWall? wall;
  // リスポーンオブジェクト
  MapRespawnObject? respawnObject;
  // リスポーンポイント
  MapRespawnPoint? respawnPoint;

  FlagModel flag;

  MapChip(this.mapPath, this.spriteSize, this.flag);

  @override
  Future<void>? onLoad() async {
    // マップタイル
    mapComponent = await TiledComponent.load(mapPath, spriteSize);
    add(mapComponent!);
    // 壁
    wall = MapWall(mapComponent!, spriteSize);
    // add(wall!);
    // リスポーンオブジェクト
    respawnObject = MapRespawnObject(mapComponent!, flag);
    // add(respawnObject!);

    // リスポーン
    respawnPoint = MapRespawnPoint(mapComponent!);
    // add(respawnPoint!);

    await super.onLoad();
  }

  /// 更新処理
  @override
  void update(double dt) {
    super.update(dt);
  }
}
