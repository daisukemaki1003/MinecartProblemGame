import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame/sprite.dart';
import 'package:flutter/material.dart';
import 'package:flame/input.dart';
import 'package:flame/palette.dart';

import '../gloabal.dart';

class PlayerSprite extends SpriteAnimationComponent
    with HasGameRef, CollisionCallbacks {
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

  // 移動速度
  Vector2 verocity = Vector2.zero();

  // 当たり判定
  late RectangleHitbox hitBox;
  // 何かにあたっているかどうか
  bool isCollisionHit = false;

  PlayerSprite(this.imagePath, this.spriteSize, {this.animationSpeed = 0.15});

  @override
  Future<void>? onLoad() async {
    // スプライト画像
    playerSprite = SpriteSheet(
        image: await gameRef.images.load(imagePath), srcSize: spriteSize);

    // モーション
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

    // 当たり判定
    hitBox = RectangleHitbox(
      position: Vector2.zero(),
      size: spriteSize,
    );
    if (!isRelease) {
      hitBox.renderShape = true;
      hitBox.paint = BasicPalette.green.withAlpha(100).paint();
    }
    add(hitBox);

    print("Load image : $imagePath");
    await super.onLoad();
  }

  /// 更新処理
  @override
  void update(double dt) {
    super.update(dt);
    // 移動
    if (isCollisionHit == false) {
      position += verocity;
    }
    verocity = Vector2.zero();
    isCollisionHit = false;
  }

  /// 座標を変更する
  /// [pos] Vector2型の座標
  void SetPos(Vector2 pos) {
    position = pos;
  }

  /// 移動させる
  void SetMove(Vector2 v) {
    verocity = v;

    if (v.x.abs() > v.y.abs()) {
      if (v.x > 0.0) {
        animation = rightSpriteAnimation;
      } else if (v.x < 0.0) {
        animation = leftSpriteAnimation;
      }
    } else {
      if (v.y < 0.0) {
        animation = upSpriteAnimation;
      } else if (v.y > 0.0) {
        animation = downSpriteAnimation;
      }
    }
  }

  /// 当たり判定コールバック
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollision(intersectionPoints, other);
    isCollisionHit = true;
    // print(other);
    Vector2 dis = ((other.position) - (position)).normalized();
    position -= dis;
  }
}
