import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:frame_demo/presentation/preseter/game_load_presenter.dart';
import 'package:frame_demo/presentation/preseter/map_transition_presenter.dart';

import 'domain/i_preseter/game_load_presenter.dart';
import 'domain/i_preseter/map_transition_presenter.dart';

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
  GameLoadPresenter gameLoadPresenter = GameLoadPresenterImpl();
  MapTransitionPresenter mapTransitionPresenter = MapTransitionPresenterImpl();

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
                  gameLoadPresenter.handle();
                  // mapTransitionPresenter.handle("room_to_city");

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
  }
}
