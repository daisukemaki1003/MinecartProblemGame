import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flame/input.dart';
import 'package:flame/palette.dart';

import '../../gloabal.dart';
import '../../model/flag.dart';
import '../widget/joystick_controller.dart';
import '../widget/map_chip.dart';
import '../widget/player_sprite.dart';
import '../widget/viewport_controller.dart';

class MyRoom extends FlameGame
    with DoubleTapDetector, HasTappables, HasDraggables, HasCollisionDetection {
  // プレイヤー
  PlayerSprite? playerSprite;
  // コントローラー
  MyJoystickController? myJoystickController;
  // マップ
  MapChip? mapChip;
  // フラグ
  FlagModel flag;
  // カメラ
  ViewPortController? viewPortController;

  MyRoom(this.flag);

  @override
  Future<void>? onLoad() async {
    // マップ
    mapChip = MapChip("myRoom.tmx", mySpriteSize, flag);
    await add(mapChip!); // 非同期処理にしないとエラー

    // // プレイヤー初期化
    playerSprite = PlayerSprite("character/sample011.png", mySpriteSize);
    add(playerSprite!);

    // playerSprite!.SetPos(Vector2(390.0, 844.0));
    playerSprite!.SetPos(mapChip!.respawnPoint!.point!);

    // カメラの追尾対象を設定
    // camera.followComponent(playerSprite!);
    // camera.followVector2(Vector2(100, 500));
    viewPortController = ViewPortController(camera);
    viewPortController!.setTrackedTarget(playerSprite!);

    // コントーローラー
    myJoystickController = MyJoystickController(
        knobRadius: 30.0,
        knobPaint: BasicPalette.white.withAlpha(200).paint(),
        backgroundRadius: 100.0,
        backgroundPaint: BasicPalette.white.withAlpha(100).paint(),
        margin: const EdgeInsets.only(left: 40.0, bottom: 40.0));
    await add(myJoystickController!);

    await super.onLoad();
  }

  @override
  void update(double dt) async {
    super.update(dt);
    // リスポーン
    if (flag.testFlag) {
      playerSprite!.SetPos(mapChip!.respawnPoint!.point!);
      flag.testFlag = false;
    }
    playerSprite!.SetMove((myJoystickController!.GetValue() * 10.0));
  }
}
