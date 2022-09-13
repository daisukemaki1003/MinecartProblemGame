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

  // /// マップ
  // MyMapComponent? _map;
  // MyMapComponent? get map => _map;
  // setMap(MyMapComponent map) => _map = map;

  // /// マップ
  // MyPlayerSprite? _player;
  // MyPlayerSprite? get player => _player;
  // setPlayer(MyPlayerSprite player) => _player = player;

  // /// コントローラー
  // MyJoystickController? controller;

  // /// イベント
  // MyEventObject? _eventObj;
  // MyEventObject? get eventObj => _eventObj;
  // setEventObj(MyEventObject eventObj) => _eventObj = eventObj;

  @override
  Future<void>? onLoad() async {
    // /// マップ
    // if (_map != null) {
    //   await add(_map!);

    //   /// イベント
    //   if (_eventObj != null) await add(_eventObj!);
    // }

    // /// プレイヤー
    // if (_player != null) {
    //   await add(_player!);

    //   /// カメラ
    //   camera.followComponent(_player!);

    //   /// コントローラー
    //   controller = MyJoystickController(_player!,
    //       knobRadius: 30.0,
    //       knobPaint: BasicPalette.white.withAlpha(200).paint(),
    //       backgroundRadius: 100.0,
    //       backgroundPaint: BasicPalette.white.withAlpha(100).paint(),
    //       margin: const EdgeInsets.only(left: 40.0, bottom: 40.0));
    //   await add(controller!);
    // }
    return super.onLoad();
  }

  @override
  void onGameResize(Vector2 canvasSize) {
    print("object");
    super.onGameResize(canvasSize);
  }
}
