import 'package:frame_demo/domain/usecases/core/usecase.dart';
import 'package:frame_demo/domain/usecases/game_load/game_load_output.dart';

import 'game_load_input.dart';

abstract class GameLoadUseCase
    implements UseCase<GameLoadInputData, GameLoadOutputData> {
  @override
  GameLoadOutputData handle(GameLoadInputData inputData);
}
