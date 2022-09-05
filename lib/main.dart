import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:flutter/material.dart';

import 'model/flag.dart';

import 'views/screen/city.dart';
import 'views/screen/my_room.dart';

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
  /// フラグ
  FlagModel flag = FlagModel(testFlag: false);

  /// マップ
  /// 商店街
  CityScreen? city;

  /// 自室
  MyRoom? myRoom;

  @override
  Future<void>? onLoad() async {
    city = CityScreen(flag);
    await add(city!);
    myRoom = MyRoom(flag);
    // await add(myRoom!);
  }

  @override
  void update(double dt) {
    super.update(dt);
    // スクリーンフラグ
    // if (flag.testFlag && myRoom!.isMounted) {
    //   remove(myRoom!);
    //   city = CityScreen(flag);
    //   add(city!);
    // } else if (!flag.testFlag && city!.isMounted) {
    //   remove(city!);
    //   myRoom = MyRoom(flag);
    //   add(myRoom!);
    // }
  }
}
