import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:flame/palette.dart';
import 'package:flutter/material.dart';

import '../../../domain/usecases/player/player_output_data.dart';
import '../../view_model/game_screen.dart';
import '../../view_model/player_model.dart';
import '../../view_model/joystick.dart';

class PlayerGetDetailPresenter {
  void output(PlayerGetDetailOutputData outputData) {
    GameScreenModel gameScreenModel = GameScreenModel();

    /// player
    PlayerModel player = PlayerModel(
        imagePath: outputData.player.imagePath,
        spriteSize: Vector2(32, 32),
        animationSpeed: 4);
    gameScreenModel.setPlayer(player);
    // gameScreenModel.addComponent(playerModel);

    /// controller
    JoystickController joystickController = JoystickController(player,
        knobRadius: 30.0,
        knobPaint: BasicPalette.white.withAlpha(200).paint(),
        backgroundRadius: 100.0,
        backgroundPaint: BasicPalette.white.withAlpha(100).paint(),
        margin: const EdgeInsets.only(left: 40.0, bottom: 40.0));
    gameScreenModel.addComponent(joystickController);
  }
}
