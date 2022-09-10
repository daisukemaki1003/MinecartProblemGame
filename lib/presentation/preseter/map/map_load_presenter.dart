import 'package:flame/components.dart';
import 'package:frame_demo/presentation/view_model/map_model.dart';

import '../../../domain/usecases/map/map_output_data.dart';
import '../../view_model/game_screen.dart';

class MapLoadPresenter {
  void output(MapLoadOutputData outputData) {
    print(outputData);
    print(outputData.mapPath);
    MapModel map = MapModel(outputData.mapPath);
    GameScreenModel gameScreenModel = GameScreenModel();
    // gameScreenModel.addComponent(mapModel);
    gameScreenModel.setMap(map);
  }
}
