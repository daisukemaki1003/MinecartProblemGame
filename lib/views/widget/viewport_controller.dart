import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:flutter/material.dart';
import 'package:frame_demo/views/widget/player_sprite.dart';

class ViewPortController {
  Camera camera;
  ViewPortController(this.camera);

  // 追跡対象を設定
  void tracked(PositionComponent player) {
    camera.snapTo(player.position - (camera.gameSize / 2));
  }

  // 追跡
  void setTrackedTarget(PositionComponent player) {
    camera.followComponent(player);
  }

  // 追跡範囲を設定
  void setTrackingRange(int x, int y) {
    print(x * 32);
    print(y * 32);
  }

  void test() {
    print(camera.position);
  }
}
