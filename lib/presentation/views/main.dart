import 'package:flame/game.dart';
import 'package:flame/input.dart';

import '../view_model/game_screen.dart';

class MainScreen extends FlameGame
    with DoubleTapDetector, HasTappables, HasDraggables, HasCollisionDetection {
  MainScreen(this.gameScreenModel);
  final GameScreenModel gameScreenModel;

  @override
  Future<void>? onLoad() async {
    add(gameScreenModel.map);
    add(gameScreenModel.player);
    camera.followComponent(gameScreenModel.player);
    await addAll(gameScreenModel.components);
    await super.onLoad();
  }
}
