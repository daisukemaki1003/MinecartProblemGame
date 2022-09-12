import 'package:flame/game.dart';

import 'package:flutter/material.dart';

import 'controller/event/event.dart';
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
    return MaterialApp(home: MainScreen());
  }
}

class MainScreen extends StatelessWidget {
  PlayerController playerController = PlayerController();
  MapController mapController = MapController();
  EventController eventController = EventController();

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
                  /// Get map
                  mapController.load(0);

                  /// Create event
                  eventController.load(0);

                  /// Get player
                  playerController.create(
                      "name", "character/player2.png", Vector2(32, 32));
                  playerController.getDtail();

                  /// view
                  return GameWidget(game: GameScreen(GameScreenModel()));
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
