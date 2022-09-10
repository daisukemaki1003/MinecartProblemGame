import 'package:flame/components.dart';
import '../../domain/usecases/player/player_input_data.dart';
import '../../domain/usecases/player/player_interactor.dart';
import '../../domain/usecases/player/player_usecase.dart';

class PlayerController {
  PlayerUseCase playerUseCase = PlayerInteractor();

  void create(String name, String imagePath, Vector2 position) {
    PlayerAddInputData inputData;
    inputData = PlayerAddInputData(name, imagePath, position);
    playerUseCase.create(inputData);
  }

  void getDtail() {
    playerUseCase.getDetail();
  }
}
