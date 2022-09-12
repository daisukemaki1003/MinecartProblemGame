import 'package:frame_demo/presentation/pages/main_page.dart';
import 'package:frame_demo/presentation/widgets/event_object.dart';

import '../../domain/usecases/game_load/game_load_output.dart';
import '../widgets/map.dart';
import '../widgets/player.dart';

class GameLoadPresenter {
  void output(GameLoadOutputData outputData) {
    MyPlayerSprite player =
        MyPlayerSprite(outputData.player.imagePath, outputData.player.position);
    MyMapComponent map = MyMapComponent(outputData.map.imagePath);

    MyEventObject eventObj = MyEventObject(outputData.map.events, map);

    GameScreen gameScreen = GameScreen();
    gameScreen.setMap(map);
    gameScreen.setPlayer(player);
    gameScreen.setEventObj(eventObj);
  }
}
