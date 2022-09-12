import 'package:flame/game.dart';

import 'package:flutter/material.dart';
import 'package:frame_demo/presentation/controller/map_transition_controller.dart';

import 'presentation/controller/game_load_controller.dart';
import 'presentation/pages/main_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: MainScreen());
  }
}

class MainScreen extends StatelessWidget {
  GameLoadController gameLoadController = GameLoadController();
  MapTransitionController mapTransitionController = MapTransitionController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("title"),
      ),
      body: Center(
        child: TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  gameLoadController.handle();
                  mapTransitionController.handle("room_to_city");

                  /// view
                  return GameWidget(game: GameScreen());
                },
              ),
            );
          },
          child: const Text("push"),
        ),
      ),
    );
    // return GameWidget(game: MainScreen());
  }
}
