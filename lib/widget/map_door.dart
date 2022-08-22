import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame_tiled/flame_tiled.dart';
import 'package:tiled/tiled.dart';
import 'package:flame/palette.dart';

import '../gloabal.dart';

class MapDoor extends PositionComponent with HasGameRef, CollisionCallbacks {
  // マップタイル
  TiledComponent mapComponent;

  MapDoor(this.mapComponent);

  @override
  Future<void>? onLoad() async {
    final objGroup = mapComponent.tileMap.getLayer<ObjectGroup>('door_event');
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
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollision(intersectionPoints, other);
    print("object");
  }
}
