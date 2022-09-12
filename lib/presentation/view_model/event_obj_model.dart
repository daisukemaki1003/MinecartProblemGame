import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/palette.dart';
import 'package:flame_tiled/flame_tiled.dart';
import 'package:frame_demo/domain/entity/model/event.dart';
import 'package:tiled/tiled.dart';

import '../../app/env/config/debug.dart';

class EventObjModel extends PositionComponent
    with HasGameRef, CollisionCallbacks {
  final List<Event> _events;
  final TiledComponent _tiledComponent;

  EventObjModel(this._tiledComponent, this._events);

  @override
  Future<void>? onLoad() async {
// リスポーンオブジェクト
    final objGroup =
        _tiledComponent.tileMap.getLayer<ObjectGroup>(_events.first.name);
    for (var obj in objGroup!.objects) {
      // ヒットボックス
      RectangleHitbox rectangleHitbox = RectangleHitbox(
        position: Vector2(obj.x, obj.y),
        size: Vector2(obj.width, obj.height),
      );
      add(rectangleHitbox);
      // デバッグモード
      if (isDebug) {
        rectangleHitbox.renderShape = true;
        rectangleHitbox.paint = BasicPalette.red.withAlpha(100).paint();
      }
    }
    await super.onLoad();
  }

  /// 当たり判定コールバック
  @override
  void onCollisionStart(
      Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollision(intersectionPoints, other);
    print("フラグ書き換え");
  }
}
