import 'package:frame_demo/domain/usecases/map/map_input_data.dart';

abstract class MapUseCase {
  String testMapPath = "";

  load(MapLoadInputData inputData);
}
