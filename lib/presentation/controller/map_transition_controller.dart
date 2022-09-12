import 'package:frame_demo/domain/entity/const/obj_name.dart';

import '../../domain/usecases/map_transition.dart/map_transition_input.dart';
import '../../domain/usecases/map_transition.dart/map_transition_interactor.dart';
import '../../domain/usecases/map_transition.dart/map_transition_usecase.dart';

class MapTransitionController {
  MapTransitionUseCase mapTransitionUseCase = MapTransitionInteractor();

  void handle(String objName) {
    MapTransitionInputData mapTransitionInputData;
    mapTransitionInputData = MapTransitionInputData(objName);
    mapTransitionUseCase.handle(mapTransitionInputData);
  }
}
