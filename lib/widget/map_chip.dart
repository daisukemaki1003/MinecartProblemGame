import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame/sprite.dart';
import 'package:flame_tiled/flame_tiled.dart';
import 'package:flutter/material.dart';
import 'package:flame/input.dart';
import 'package:flame/palette.dart';

import '../common_system.dart';
import '../widget/joystick_controller.dart';

class MapChip extends SpriteAnimationComponent
    with HasGameRef, CollisionCallbacks {
  // 画像パス
  String mapPath = "";
  String imagePath = "";
  Vector2 spriteSize = Vector2(32.0, 32.0);

  TiledComponent? mapChip;

  MapChip(this.mapPath, this.imagePath, this.spriteSize);

  @override
  Future<void>? onLoad() async {
    mapChip = await TiledComponent.load(imagePath, spriteSize);
    add(mapChip!);
  }

  /// 更新処理
  @override
  void update(double dt) {
    super.update(dt);
  }
}
