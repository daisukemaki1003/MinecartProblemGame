import '../../domain/usecases/map_transition.dart/map_transition_output.dart';

class MapTransitionPresenter {
  void output(MapTransitionOutputData outputData) {
    print(outputData);
    print(outputData.map.imagePath);
  }
}
