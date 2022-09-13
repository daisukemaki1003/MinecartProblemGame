import '../../domain/i_presenter/map_transition_presenter.dart';
import '../../domain/usecases/map_transition.dart/map_transition_input.dart';
import '../../domain/usecases/map_transition.dart/map_transition_interactor.dart';
import '../../domain/usecases/map_transition.dart/map_transition_output.dart';
import '../../domain/usecases/map_transition.dart/map_transition_usecase.dart';
import '../pages/main_page.dart';
import '../widgets/map.dart';

class MapTransitionPresenterImpl implements MapTransitionPresenter {
  MapTransitionUseCase mapTransitionUseCase = MapTransitionInteractor();

  @override
  void handle(String objName) {
    MapTransitionInputData mapTransitionInputData;
    mapTransitionInputData = MapTransitionInputData(objName);
    MapTransitionOutputData outputData =
        mapTransitionUseCase.handle(mapTransitionInputData);

    print(outputData);
    print(outputData.map.imagePath);
    MyMapComponent map = MyMapComponent(outputData.map.imagePath);

    GameScreen gameScreen = GameScreen();
    gameScreen.removeAll(gameScreen.children);
    gameScreen.add(map);
  }
}
