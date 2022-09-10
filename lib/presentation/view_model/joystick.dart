import 'package:flame/components.dart';

import 'package:flutter/material.dart';

import '../../domain/entity/enum/direction_of_travel.dart';
import 'player_model.dart';

/// ジョイスティック操作管理
class JoystickController extends JoystickComponent {
  double backgroundRadius = 100.0;
  final PlayerModel operationTarget;

  /// コンストラクタ
  /// [knobRadius] スティックの大きさ
  /// [knobPaint] スティックの色
  /// [backgroundRadius] スティック背景の大きさ
  /// [backgroundPaint] スティック背景の色
  /// [margin] 画面端からのマージン
  JoystickController(this.operationTarget,
      {double knobRadius = 30.0,
      Paint? knobPaint,
      backgroundRadius = 100.0,
      Paint? backgroundPaint,
      EdgeInsets? margin})
      : super(
          background:
              CircleComponent(radius: backgroundRadius, paint: backgroundPaint),
          knob: CircleComponent(radius: knobRadius, paint: knobPaint),
          margin: margin,
        );

  /// 傾きを0～１の値で出力する
  Vector2 GetValue() {
    Vector2 value = Vector2.zero();
    if (delta.x != 0.0) {
      value.x = delta.x / backgroundRadius;
    }
    if (delta.y != 0.0) {
      value.y = delta.y / backgroundRadius;
    }
    return value;
  }

  /// 進行方向を取得
  DirectionOfTravel getDirection() {
    // 移動してない
    if (delta.x == 0.0 && delta.y == 0.0) {
      return DirectionOfTravel.none;
    }
    // 移動
    if (delta.x.abs() < delta.y.abs()) {
      if (delta.y < 0) {
        return DirectionOfTravel.up;
      } else {
        return DirectionOfTravel.down;
      }
    } else {
      if (delta.x < 0) {
        return DirectionOfTravel.left;
      } else {
        return DirectionOfTravel.right;
      }
    }
  }

  @override
  void update(double dt) {
    operationTarget.motion(getDirection());
    
    super.update(dt);
  }
}
