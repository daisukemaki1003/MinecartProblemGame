import 'package:flame/palette.dart';
import 'package:flutter/material.dart';

import '../../../domain/usecases/game_load/game_load_output.dart';
import '../../../domain/usecases/map_transition.dart/map_transition_output.dart';
import '../../pages/main_page.dart';
import '../../widgets/events.dart';
import '../../widgets/joystick.dart';
import '../../widgets/map.dart';
import '../../widgets/player.dart';

class TransformToMyGameModel {
  MyGameModel transformGameLoadOutputData(GameLoadOutputData outputData) {
    MyPlayerSprite player =
        MyPlayerSprite(outputData.player.imagePath, outputData.player.position);
    MyMapComponent map = MyMapComponent(outputData.map.imagePath);
    MyEvents events = MyEvents(outputData.map.events, map);
    MyJoystickController controller = MyJoystickController(player,
        knobRadius: 30.0,
        knobPaint: BasicPalette.white.withAlpha(200).paint(),
        backgroundRadius: 100.0,
        backgroundPaint: BasicPalette.white.withAlpha(100).paint(),
        margin: const EdgeInsets.only(left: 40.0, bottom: 40.0));

    return MyGameModel(
        map: map, player: player, events: events, controller: controller);
  }

  MyGameModel transformMapTransitionOutputData(
      MapTransitionOutputData outputData) {
    MyPlayerSprite player =
        MyPlayerSprite(outputData.player.imagePath, outputData.player.position);

    MyMapComponent map = MyMapComponent(outputData.map.imagePath);
    MyEvents events = MyEvents(outputData.map.events, map);
    MyJoystickController controller = MyJoystickController(player,
        knobRadius: 30.0,
        knobPaint: BasicPalette.white.withAlpha(200).paint(),
        backgroundRadius: 100.0,
        backgroundPaint: BasicPalette.white.withAlpha(100).paint(),
        margin: const EdgeInsets.only(left: 40.0, bottom: 40.0));

    return MyGameModel(
        map: map, player: player, events: events, controller: controller);
  }
}
