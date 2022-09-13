import 'dart:ffi';

import 'package:frame_demo/domain/usecases/game_load/game_load_input.dart';
import 'package:frame_demo/presentation/pages/main_page.dart';
import 'package:frame_demo/presentation/widgets/event_object.dart';

import '../../domain/i_preseter/game_load_presenter.dart';
import '../../domain/usecases/game_load/game_load_interactor.dart';
import '../../domain/usecases/game_load/game_load_output.dart';
import '../../domain/usecases/game_load/game_load_usecase.dart';
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
    gameScreen.setMap(map);
    gameScreen.setPlayer(player);
    gameScreen.setEventObj(eventObj);
  }
}
