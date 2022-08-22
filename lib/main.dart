import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:flutter/material.dart';
import 'package:frame_demo/views/screen/city_screen.dart';

import 'model/flag.dart';

import 'views/screen/lake_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GameWidget(game: HomeScreen());
  }
}

class HomeScreen extends FlameGame
    with DoubleTapDetector, HasTappables, HasDraggables, HasCollisionDetection {
  FlagModel flag = FlagModel(testFlag: false);
  CityScreen city = CityScreen(FlagModel());
  LakeScreen lake = LakeScreen(FlagModel());

  @override
  Future<void>? onLoad() async {
    city = CityScreen(flag);
    await add(city);
    // lake = LakeScreen(flag);
    // await add(lake);
  }

  @override
  void update(double dt) {
    super.update(dt);
    // スクリーンフラグ
    if (flag.testFlag && lake.isMounted) {
      remove(lake);
      city = CityScreen(flag);
      add(city);
    } else if (!flag.testFlag && city.isMounted) {
      remove(city);
      lake = LakeScreen(flag);
      add(lake);
    }
  }
}
