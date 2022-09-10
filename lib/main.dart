import 'package:flame/game.dart';

import 'package:flutter/material.dart';

import 'controller/map/map_controller.dart';
import 'controller/player/player_controller.dart';
import 'presentation/view_model/game_screen.dart';
import 'presentation/views/main.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return MaterialApp(home: Test());
    return MaterialApp(home: Test());
  }
}

class Test extends StatelessWidget {
  PlayerController playerController = PlayerController();
  GameScreenModel gameScreenModel = GameScreenModel();
  MapController mapController = MapController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("title"),
      ),
      body: Center(
        child: TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  /// Get map
                  mapController.load(0);

                  /// Get player
                  playerController.create(
                      "name", "character/player2.png", Vector2(32, 32));
                  playerController.getDtail();

                  /// view
                  return GameWidget(game: MainScreen(gameScreenModel));
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
