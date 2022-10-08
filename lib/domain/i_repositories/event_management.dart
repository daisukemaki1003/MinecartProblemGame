import '../../data/models/map_transition_model.dart';

abstract class EventManagementRepository {
  eventHandle() {}

  MapTransitionModel transitionTheMap(String destination);
}
