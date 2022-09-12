import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:flame/palette.dart';
import 'package:flutter/material.dart';
import 'package:frame_demo/presentation/widgets/event_object.dart';

import '../widgets/joystick.dart';
import '../widgets/map.dart';
import '../widgets/player.dart';

class GameScreen extends FlameGame
    with DoubleTapDetector, HasTappables, HasDraggables, HasCollisionDetection {
  static final GameScreen _instance = GameScreen._internal();
  GameScreen._internal();
  factory GameScreen() {
    return _instance;
  }

  /// マップ
  late MyMapComponent _map;
  MyMapComponent get map => _map;
  setMap(MyMapComponent map) => _map = map;

  /// マップ
  late MyPlayerSprite _player;
  MyPlayerSprite get player => _player;
  setPlayer(MyPlayerSprite player) => _player = player;

  /// コントローラー
  late MyJoystickController myJoystickController;

  /// イベント
  late MyEventObject _eventObj;
  MyEventObject get eventObj => _eventObj;
  setEventObj(MyEventObject eventObj) => _eventObj = eventObj;

  // double wait = 0;

  @override
  Future<void>? onLoad() async {
    await add(_map);
    await add(_eventObj);
    await add(_player);
    camera.followComponent(_player);

    myJoystickController = MyJoystickController(_player,
        knobRadius: 30.0,
        knobPaint: BasicPalette.white.withAlpha(200).paint(),
        backgroundRadius: 100.0,
        backgroundPaint: BasicPalette.white.withAlpha(100).paint(),
        margin: const EdgeInsets.only(left: 40.0, bottom: 40.0));
    await add(myJoystickController);
    return super.onLoad();
  }

  // @override
  // void update(double dt) {
  //   wait += dt;

  //   if (wait > 5) {
  //     removeAll(children);
  //   }
  //   if (wait > 10) {
  //     print("load");
  //     GameLoadController gameLoadController = GameLoadController();
  //     gameLoadController.handle();
  //     add(_map);
  //     add(_player);
  //     wait = 0;
  //   }

  //   super.update(dt);
  // }
}
