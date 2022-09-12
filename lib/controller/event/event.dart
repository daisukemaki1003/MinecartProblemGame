import '../../domain/usecases/event/event_input_data.dart';
import '../../domain/usecases/event/event_interactor.dart';
import '../../domain/usecases/event/event_usecase.dart';

class EventController {
  EventUseCase eventUseCase = EventInteractor();

  load(int eventId) {
    EventLoadInputData eventLoadInputData;
    eventLoadInputData = EventLoadInputData(eventId);
    eventUseCase.load(eventLoadInputData);
  }
}
