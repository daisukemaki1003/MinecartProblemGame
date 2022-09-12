import 'package:flame/extensions.dart';
import 'package:frame_demo/domain/entity/model/event.dart';
import 'package:frame_demo/domain/entity/model/map.dart';
import 'package:frame_demo/domain/entity/model/player.dart';
import '../../../data/event.dart';
import '../../../presentation/preseter/game_load_presenter.dart';
import 'game_load_input.dart';
import 'game_load_output.dart';
import 'game_load_usecase.dart';

class GameLoadInteractor implements GameLoadUseCase {
  GameLoadPresenter gameLoadPresenter = GameLoadPresenter();

  @override
  handle(GameLoadInputData inputData) {
    /// DataSourcesから表示データを取得
    BaseData baseData = BaseData();

    List<EventModel> eventObjList = [];
    for (var objName in baseData.objectNameList) {
      eventObjList.add(EventModel(false, objName));
    }
    MapModel map = MapModel(baseData.mapPath, eventObjList);
    PlayerModel player = PlayerModel(
        baseData.playerPath, baseData.name, Vector2(baseData.x, baseData.y));

    GameLoadOutputData gameLoadOutputData = GameLoadOutputData(map, player);
    gameLoadPresenter.output(gameLoadOutputData);
  }
}
