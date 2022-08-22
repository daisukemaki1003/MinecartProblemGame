import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame_tiled/flame_tiled.dart';
import 'package:frame_demo/model/flag.dart';
import 'package:tiled/tiled.dart';
import 'package:flame/palette.dart';

import '../../gloabal.dart';

class MapRespawnObject extends PositionComponent
    with HasGameRef, CollisionCallbacks {
  // マップタイル
  TiledComponent mapComponent;
  FlagModel flag;

  MapRespawnObject(this.mapComponent, this.flag);

  @override
  Future<void>? onLoad() async {
    // リスポーンオブジェクト
    final objGroup = mapComponent.tileMap.getLayer<ObjectGroup>(respoawnObj);
    for (var obj in objGroup!.objects) {
      // ヒットボックス
      RectangleHitbox rectangleHitbox = RectangleHitbox(
        position: Vector2(obj.x, obj.y),
        size: Vector2(obj.width, obj.height),
      );
      add(rectangleHitbox);
      // デバッグモード
      if (!isRelease) {
        rectangleHitbox.renderShape = true;
        rectangleHitbox.paint = BasicPalette.red.withAlpha(100).paint();
      }
    }
    await super.onLoad();
  }

  /// 当たり判定コールバック
  void onCollisionStart(
      Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollision(intersectionPoints, other);
    print("フラグ書き換え");
    flag.testFlag = !flag.testFlag;
  }
}

class MapRespawnPoint extends PositionComponent
    with HasGameRef, CollisionCallbacks {
  // マップタイル
  TiledComponent mapComponent;
  // リスポーン
  Vector2? point;

  MapRespawnPoint(this.mapComponent);

  @override
  Future<void>? onLoad() async {
    // リスポーン
    final objGroup = mapComponent.tileMap.getLayer<ObjectGroup>(respoawnPoint);
    point = Vector2(objGroup!.objects[0].x, objGroup.objects[0].y);
  }
}
