import 'package:frame_demo/domain/usecases/map/map_input_data.dart';
import 'package:frame_demo/presentation/preseter/map/map_load_presenter.dart';

import 'map_output_data.dart';
import 'map_usecase.dart';

class MapInteractor implements MapUseCase {
  @override
  String testMapPath = "myRoom.tmx";

  MapLoadPresenter mapLoadPresenter = MapLoadPresenter();

  @override
  load(MapLoadInputData inputData) {
    print("map load");

    /// inputData.eventId
    /// イベントID に応じたマップパスを返す
    /// data.load(inputData.eventId).mapPath;

    MapLoadOutputData mapLoadOutputData = MapLoadOutputData(testMapPath);
    mapLoadPresenter.output(mapLoadOutputData);
  }
}
