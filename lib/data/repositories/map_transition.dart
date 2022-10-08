import 'package:frame_demo/domain/entity/model/map.dart';

import '../../domain/i_repositories/map_transition.dart';

class MapTransitionRepositoryImpl implements MapTransitionRepository {
  @override
  MapModel getDestinationMap(String objName) {
    String mapPath = "";
    switch (objName) {
      case "room_to_city":
        mapPath = "city.tmx";
        break;
      case "city_to_room":
        mapPath = "myRoom.tmx";
        break;
      default:
        break;
    }

    MapModel map = MapModel(mapPath, []);
    return map;
  }
}
