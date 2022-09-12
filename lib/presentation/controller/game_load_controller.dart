import '../../domain/usecases/game_load/game_load_input.dart';
import '../../domain/usecases/game_load/game_load_interactor.dart';
import '../../domain/usecases/game_load/game_load_usecase.dart';

class GameLoadController {
  GameLoadUseCase gameLoadUseCase = GameLoadInteractor();

  void handle() {
    gameLoadUseCase.handle(GameLoadInputData());
  }
}
