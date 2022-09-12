import 'package:flame/game.dart';
import 'package:flame/input.dart';

import '../view_model/game_screen.dart';

class GameScreen extends FlameGame
    with DoubleTapDetector, HasTappables, HasDraggables, HasCollisionDetection {
  GameScreen(this.gameScreenModel);
  final GameScreenModel gameScreenModel;

  @override
  Future<void>? onLoad() async {
    print("Add map");
    await add(gameScreenModel.map);
    print("Add player");
    await add(gameScreenModel.player);
    camera.followComponent(gameScreenModel.player);
    print("Add event");
    await add(gameScreenModel.createEvent());
    await addAll(gameScreenModel.components);
    await super.onLoad();
  }
}
