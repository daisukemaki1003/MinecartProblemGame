import 'dart:ffi';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame/sprite.dart';
import 'package:flutter/material.dart';
import 'package:flame/input.dart';
import 'package:flame/palette.dart';

import '../../constant/config.dart';
import '../../gloabal.dart';

class PlayerSprite extends SpriteAnimationComponent
    with HasGameRef, CollisionCallbacks {
  // 画像パス
  String imagePath = "";
  // モーションの切り替えタイミング
  double animationSpeed = 0.15;
  // 1フレームのスプライトサイズ
  Vector2 spriteSize;

  // スプライト本体
  late SpriteSheet playerSprite;

  // 下向きモーション（画像差分）
  late SpriteAnimation downSpriteAnimation;
  // 左向きモーション（画像差分）
  late SpriteAnimation leftSpriteAnimation;
  // 右向きモーション（画像差分）
  late SpriteAnimation rightSpriteAnimation;
  // 上向きモーション（画像差分）
  late SpriteAnimation upSpriteAnimation;

  /// 移動速度
  /// 32の約数
  int movingDistance = 4;

  /// 移動距離
  Vector2 dis = Vector2.zero();

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
    add(hitBox);
    if (!isRelease) {
      hitBox.renderShape = true;
      hitBox.paint = BasicPalette.green.withAlpha(100).paint();
    }

    await super.onLoad();
  }

  /// 更新処理
  @override
  void update(double dt) {
    super.update(dt);

    /// 移動
    move();
  }

  /// 座標を変更する
  /// [pos] Vector2型の座標
  void SetPos(Vector2 pos) {
    position = pos;
  }

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
    Vector2 distance_buf = Vector2.zero();

    switch (direction) {
      case DirectionOfTravel.up: // 上
        animation = upSpriteAnimation;
        distance_buf = Vector2(0, -32);
        break;
      case DirectionOfTravel.right: // 右
        animation = rightSpriteAnimation;
        distance_buf = Vector2(32, 0);
        break;
      case DirectionOfTravel.down: // 下
        animation = downSpriteAnimation;
        distance_buf = Vector2(0, 32);
        break;
      case DirectionOfTravel.left: // 左
        animation = leftSpriteAnimation;
        distance_buf = Vector2(-32, 0);
        break;
      default:
        return;
    }

    /// 移動距離をバッファーに格納
    if (dis == Vector2.zero()) dis = distance_buf;
  }

  /// 当たり判定コールバック
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollision(intersectionPoints, other);
    isCollisionHit = false;
    Vector2 dis = ((other.position) - (position)).normalized();
    intersectionPoints.forEach((pos) {
      Vector2 overlapDistance = Vector2.zero();
      if (dis.x.abs() < dis.y.abs()) {
        if ((position.y + spriteSize.y) > other.position.y &&
            position.y < other.position.y) {
          // 上
          overlapDistance.y = (pos.y - other.position.y);
        } else if (position.y < (other.position.y + other.size.y) &&
            position.y > other.position.y) {
          // 下
          overlapDistance.y = (position.y - pos.y);
        }
      } else if (dis.x.abs() > dis.y.abs()) {
        if ((position.x + spriteSize.x) > other.position.x &&
            position.x < other.position.x) {
          // 左
          overlapDistance.x = (pos.x - other.position.x);
        } else if (position.x < (other.position.x + other.size.x) &&
            position.x > other.position.x) {
          // 右
          overlapDistance.x = (position.x - pos.x);
        }
      }
      position -= overlapDistance;
    });
  }
}
