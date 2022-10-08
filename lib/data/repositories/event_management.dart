import '../../domain/i_repositories/event_management.dart';
import '../models/map_transition_model.dart';
import '../datasources/data_operation.dart';
import 'map_transition.dart';

class EventManagementRepositoryImpl implements EventManagementRepository {
  DataOperation dataOperation = DataOperation();

  @override
  eventHandle() {}

  @override
  MapTransitionModel transitionTheMap(String destination) {
    MapTransitionRepository mapTransitionRepository = MapTransitionRepository();

    /// 遷移先マップを取得
    MapTransitionModel mapTransitionModel;
    mapTransitionModel = mapTransitionRepository.getDestinationMap(destination);

    /// Add event
    dataOperation.readEventJsonFile();
    return mapTransitionModel;
  }
}
