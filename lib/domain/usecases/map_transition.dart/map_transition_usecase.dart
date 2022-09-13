import 'package:frame_demo/domain/usecases/core/usecase.dart';

import 'map_transition_input.dart';
import 'map_transition_output.dart';

abstract class MapTransitionUseCase
    implements UseCase<MapTransitionInputData, MapTransitionOutputData> {
  @override
  handle(MapTransitionInputData inputData);
}
