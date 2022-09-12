import 'package:frame_demo/data/repositories/map_transition.dart';
import 'package:frame_demo/domain/entity/model/map.dart';
import 'package:frame_demo/domain/repositories/map_transition.dart';
import 'package:frame_demo/domain/usecases/map_transition.dart/map_transition_output.dart';
import 'package:frame_demo/domain/usecases/map_transition.dart/map_transition_usecase.dart';

import '../../../presentation/preseter/map_transition_presenter.dart';
import 'map_transition_input.dart';

class MapTransitionInteractor implements MapTransitionUseCase {
  MapTransitionPresenter mapTransitionPresenter = MapTransitionPresenter();

  @override
  handle(MapTransitionInputData inputData) {
    MapTransitionRepository mapTransitionRepository =
        MapTransitionRepositoryImpl();

    MapModel map = mapTransitionRepository.getDestinationMap(inputData.objName);
    MapTransitionOutputData mapTransitionOutputData =
        MapTransitionOutputData(map);
    mapTransitionPresenter.output(mapTransitionOutputData);
  }
}
