import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:frame_demo/presentation/widgets/event.dart';
import 'package:frame_demo/presentation/widgets/map.dart';

import '../../domain/entity/model/event.dart';

class MyEvents extends PositionComponent with HasGameRef, CollisionCallbacks {
  final MyMapComponent _myMapComponent;
  final List<EventModel> _eventModelList;

  MyEvents(this._eventModelList, this._myMapComponent);

  @override
  Future<void>? onLoad() async {
    for (var event in _eventModelList) {
      await add(MyEvent(_myMapComponent.tiledComponent, event));
    }
    await super.onLoad();
  }
}
