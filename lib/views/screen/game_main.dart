import 'package:flame/collisions.dart';
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

class GameMainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GameWidget(game: MyGameMain());
  }
}

class MyGameMain extends FlameGame
    with DoubleTapDetector, HasTappables, HasDraggables, HasCollisionDetection {
  // プレイヤー
  PlayerSprite? playerSprite;

  // コントローラー
  MyJoystickController? myJoystickController;

  // マップ
  MapChip? mapChip;

  // フラグ
  FlagModel flag = FlagModel();

  MyGameMain() : super();

  @override
  Future<void>? onLoad() async {
    add(ScreenHitbox());

    // マップ
    mapChip = MapChip("test.tmx", mySpriteSize, flag);
    add(mapChip!);

    // プレイヤー初期化
    playerSprite = PlayerSprite("character/sample011.png", mySpriteSize);
    add(playerSprite!);
    playerSprite!.SetPos(Vector2(500, 300));

    // カメラの追尾対象を設定
    camera.followComponent(playerSprite!);

    // コントーローラー
    myJoystickController = MyJoystickController(
        knobRadius: 30.0,
        knobPaint: BasicPalette.white.withAlpha(200).paint(),
        backgroundRadius: 100.0,
        backgroundPaint: BasicPalette.white.withAlpha(100).paint(),
        margin: const EdgeInsets.only(left: 40.0, bottom: 40.0));
    add(myJoystickController!);

    await super.onLoad();
  }

  @override
  void update(double dt) {
    super.update(dt);
    // リスポーン
    if (flag.testFlag) {
      playerSprite!.SetPos(mapChip!.respawnPoint!.point!);
      flag.testFlag = false;
    }
    playerSprite!.SetMove((myJoystickController!.GetValue() * 10.0));
  }
}
