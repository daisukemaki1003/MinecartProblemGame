import '../entity/model/map.dart';

abstract class MapTransitionRepository {
  MapModel getDestinationMap(String objName);
}
