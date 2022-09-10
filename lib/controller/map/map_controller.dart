import 'package:frame_demo/domain/usecases/map/map_input_data.dart';

import '../../domain/usecases/map/map_interactor.dart';
import '../../domain/usecases/map/map_usecase.dart';

class MapController {
  MapUseCase mapUseCase = MapInteractor();

  load(int eventId) {
    MapLoadInputData mapLoadInputData;
    mapLoadInputData = MapLoadInputData(eventId);
    mapUseCase.load(mapLoadInputData);
  }
}
