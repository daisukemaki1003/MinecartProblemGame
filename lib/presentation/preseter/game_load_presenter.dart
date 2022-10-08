import 'dart:ffi';

import 'package:flame/palette.dart';
import 'package:flutter/material.dart';
import 'package:frame_demo/domain/usecases/game_load/game_load_input.dart';
import 'package:frame_demo/presentation/pages/main_page.dart';
import 'package:frame_demo/presentation/widgets/event_object.dart';

import '../../domain/i_presenter/game_load_presenter.dart';
import '../../domain/usecases/game_load/game_load_interactor.dart';
import '../../domain/usecases/game_load/game_load_output.dart';
import '../../domain/usecases/game_load/game_load_usecase.dart';
import '../widgets/joystick.dart';
import '../widgets/map.dart';
import '../widgets/player.dart';

class GameLoadPresenterImpl implements GameLoadPresenter {
  GameLoadUseCase gameLoadUseCase = GameLoadInteractor();

  @override
  void handle() {
    GameLoadInputData inputData = GameLoadInputData();
    GameLoadOutputData outputData = gameLoadUseCase.handle(inputData);

    MyPlayerSprite player =
        MyPlayerSprite(outputData.player.imagePath, outputData.player.position);
    MyMapComponent map = MyMapComponent(outputData.map.imagePath);

    MyEventObject eventObj = MyEventObject(outputData.map.events, map);

    GameScreen gameScreen = GameScreen();
    gameScreen.add(map);
    gameScreen.add(eventObj);
    gameScreen.add(player);
    gameScreen.camera.followComponent(player);

    gameScreen.add(MyJoystickController(player,
        knobRadius: 30.0,
        knobPaint: BasicPalette.white.withAlpha(200).paint(),
        backgroundRadius: 100.0,
        backgroundPaint: BasicPalette.white.withAlpha(100).paint(),
        margin: const EdgeInsets.only(left: 40.0, bottom: 40.0)));

    // gameScreen.setMap(map);
    // gameScreen.setPlayer(player);
    // gameScreen.setEventObj(eventObj);
  }
}
