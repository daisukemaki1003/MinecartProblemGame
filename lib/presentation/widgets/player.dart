import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/sprite.dart';

import '../../domain/entity/enum/direction_of_travel.dart';

class MyPlayerSprite extends SpriteAnimationComponent
    with HasGameRef, CollisionCallbacks {
  final String _imagePath;
  final Vector2 _position;

  MyPlayerSprite(this._imagePath, this._position);

  Vector2 spriteSize = Vector2(32, 32);

  /// モーションの切り替えタイミング
  double animationSpeed = 0.15;

  /// 移動速度
  /// 32の約数
  int movingDistance = 4;

  /// スプライト本体
  late SpriteSheet playerSprite;

  // 下向きモーション（画像差分）
  late SpriteAnimation downSpriteAnimation;
  // 左向きモーション（画像差分）
  late SpriteAnimation leftSpriteAnimation;
  // 右向きモーション（画像差分）
  late SpriteAnimation rightSpriteAnimation;
  // 上向きモーション（画像差分）
  late SpriteAnimation upSpriteAnimation;

  /// 衝突判定
  late RectangleHitbox hitBox;

  /// 移動距離
  Vector2 dis = Vector2.zero();

  @override
  Future<void>? onLoad() async {
    // スプライト画像
    playerSprite = SpriteSheet(
        image: await gameRef.images.load(_imagePath), srcSize: spriteSize);

    /// ポジション
    position = _position;

    // モーション
    downSpriteAnimation =
        playerSprite.createAnimation(row: 0, stepTime: animationSpeed, to: 3);
    leftSpriteAnimation =
        playerSprite.createAnimation(row: 1, stepTime: animationSpeed, to: 3);
    rightSpriteAnimation =
        playerSprite.createAnimation(row: 2, stepTime: animationSpeed, to: 3);
    upSpriteAnimation =
        playerSprite.createAnimation(row: 3, stepTime: animationSpeed, to: 3);
    animation = downSpriteAnimation;
    size = spriteSize;

    // 当たり判定
    hitBox = RectangleHitbox(
      position: Vector2.zero(),
      size: spriteSize,
    );
    await add(hitBox);

    await super.onLoad();
  }

  @override
  void update(double dt) {
    super.update(dt);
    move();
  }

  /// 移動
  void move() {
    if (dis != Vector2.zero()) {
      if (dis.x != 0) {
        /// X軸移動
        if (dis.x > 0) {
          // 右
          position.x += movingDistance;
          dis.x -= movingDistance;
        } else {
          // 左
          position.x -= movingDistance;
          dis.x += movingDistance;
        }
      } else {
        /// Y軸移動
        if (dis.y > 0) {
          // 上
          position.y += movingDistance;
          dis.y -= movingDistance;
        } else {
          // 下
          position.y -= movingDistance;
          dis.y += movingDistance;
        }
      }
    }
  }

  /// 移動一マスずつ + モーション
  void motion(DirectionOfTravel direction) {
    Vector2 distanceBuf = Vector2.zero();

    switch (direction) {
      case DirectionOfTravel.up: // 上
        animation = upSpriteAnimation;
        distanceBuf = Vector2(0, -32);
        break;
      case DirectionOfTravel.right: // 右
        animation = rightSpriteAnimation;
        distanceBuf = Vector2(32, 0);
        break;
      case DirectionOfTravel.down: // 下
        animation = downSpriteAnimation;
        distanceBuf = Vector2(0, 32);
        break;
      case DirectionOfTravel.left: // 左
        animation = leftSpriteAnimation;
        distanceBuf = Vector2(-32, 0);
        break;
      default:
        return;
    }

    /// 移動距離をバッファーに格納
    if (dis == Vector2.zero()) dis = distanceBuf;
  }
}
