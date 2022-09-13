import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame_tiled/flame_tiled.dart';
import 'package:frame_demo/domain/i_preseter/map_transition_presenter.dart';
import 'package:frame_demo/presentation/preseter/map_transition_presenter.dart';
import 'package:tiled/tiled.dart';

import '../../domain/entity/model/event.dart';

class MyEvent extends PositionComponent with HasGameRef, CollisionCallbacks {
  final EventModel _eventModel;
  final TiledComponent _tiledComponent;

  MyEvent(this._tiledComponent, this._eventModel);

  String objName = "";
  MapTransitionPresenter mapTransitionController = MapTransitionPresenterImpl();

  @override
  Future<void>? onLoad() async {
    final objGroup =
        _tiledComponent.tileMap.getLayer<ObjectGroup>(_eventModel.name);
    if (objGroup != null) {
      for (var obj in objGroup.objects) {
        objName = obj.name;
        // ヒットボックス
        RectangleHitbox rectangleHitbox = RectangleHitbox(
          position: Vector2(obj.x, obj.y),
          size: Vector2(1, 1),
          // size: Vector2(obj.width, obj.height),
        );
        await add(rectangleHitbox);
      }
    }
    return super.onLoad();
  }

  /// 当たり判定コールバック
  @override
  void onCollisionStart(
      Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollisionStart(intersectionPoints, other);

    print("フラグ書き換え");

    print(objName);
    mapTransitionController.handle(objName);
  }
}
