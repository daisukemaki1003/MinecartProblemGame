import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame/sprite.dart';
import 'package:flutter/material.dart';
import 'package:flame/input.dart';
import 'package:flame/palette.dart';

<<<<<<< Updated upstream
=======
import '../common_system.dart';
import '../gloabal.dart';
>>>>>>> Stashed changes
import '../widget/joystick_controller.dart';
import '../widget/map_chip.dart';

class GameMainScreen extends StatefulWidget {
  GameMainScreen({Key? key}) : super(key: key);

  @override
  State<GameMainScreen> createState() => _GameMainScreenState();
}

class _GameMainScreenState extends State<GameMainScreen> {
  @override
  Widget build(BuildContext context) {
    return GameWidget(game: MyGameMain());
  }
}

class MyGameMain extends FlameGame
    with DoubleTapDetector, HasTappables, HasDraggables {
  double x_pos = 0.0;
  double x_count = 0.0;
  double velocity = 0.0;

  MySprite? playerSprite;
  MyJoystickController? myJoystickController;

  // マップ
  MapChip? mapChip;

  MyGameMain() : super();

  @override
  Future<void>? onLoad() async {
<<<<<<< Updated upstream
    playerSprite = MySprite("character/sample011.png", Vector2(32.0, 32.0));
    add(playerSprite!);
    playerSprite!.GetPos(Vector2(100, 100));
=======
    // プレイヤー初期化
    playerSprite = MySprite("character/sample011.png", mySpriteSize);
    add(playerSprite!);
    playerSprite!.SetPos(Vector2(100, 100));

    // プレイヤー初期化
    otherSprite = MySprite("character/player2.png", mySpriteSize);
    add(otherSprite!);
    otherSprite!.SetPos(Vector2(200, 100));
>>>>>>> Stashed changes

    // コントーローラー
    myJoystickController = MyJoystickController(
        knobRadius: 30.0,
        knobPaint: BasicPalette.white.withAlpha(200).paint(),
        backgroundRadius: 100.0,
        backgroundPaint: BasicPalette.white.withAlpha(100).paint(),
        margin: const EdgeInsets.only(left: 40.0, bottom: 40.0));
    add(myJoystickController!);

    // マップ
    mapChip = MapChip("", "test.tmx", mySpriteSize);
    add(mapChip!);

    await super.onLoad();
  }

  @override
  void update(double dt) {
    super.update(dt);
    if (myJoystickController!.delta.isZero() != true) {
      playerSprite!.SetMove(myJoystickController!.delta / 10.0);
    }
  }
}

class MySprite extends SpriteAnimationComponent with HasGameRef {
  // 画像パス
  String imagePath = "";
  // モーションの切り替えタイミング
  double animationSpeed = 0.15;
  // 1フレームのスプライトサイズ
  Vector2 spriteSize = Vector2(32, 32);

  // スプライト本体
  SpriteSheet? playerSprite;
  // 下向きモーション（画像差分）
  SpriteAnimation? downSpriteAnimation;
  // 左向きモーション（画像差分）
  SpriteAnimation? leftSpriteAnimation;
  // 右向きモーション（画像差分）
  SpriteAnimation? rightSpriteAnimation;
  // 上向きモーション（画像差分）
  SpriteAnimation? upSpriteAnimation;

  MySprite(this.imagePath, this.spriteSize, {this.animationSpeed = 0.15});

  @override
  Future<void>? onLoad() async {
    playerSprite = SpriteSheet(
        image: await gameRef.images.load(imagePath), srcSize: spriteSize);

    downSpriteAnimation =
        playerSprite!.createAnimation(row: 0, stepTime: animationSpeed, to: 3);
    leftSpriteAnimation =
        playerSprite!.createAnimation(row: 1, stepTime: animationSpeed, to: 3);
    rightSpriteAnimation =
        playerSprite!.createAnimation(row: 2, stepTime: animationSpeed, to: 3);
    upSpriteAnimation =
        playerSprite!.createAnimation(row: 3, stepTime: animationSpeed, to: 3);
    animation = downSpriteAnimation;
    size = spriteSize;

    print("Load image : $imagePath");
  }

  /// 座標を変更する
  /// [pos] Vector2型の座標
  void GetPos(Vector2 pos) {
    position = pos;
  }

  /// 移動させる
  /// [verocity] 移動向き
  void SetMove(Vector2 v) {
    position += v;
    if (v.x.abs() > v.y.abs()) {
      if (v.x > 0.0) {
        // 右に進んでいる
        animation = rightSpriteAnimation;
      } else if (v.x < 0.0) {
        // 左に進んでいる
        animation = leftSpriteAnimation;
      }
    } else {
      if (v.y < 0.0) {
        // 上に進んでいる
        animation = upSpriteAnimation;
      } else if (v.y > 0.0) {
        // 下に進んでいる
        animation = downSpriteAnimation;
      }
    }
  }
}
