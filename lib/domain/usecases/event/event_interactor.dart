import 'dart:ffi';

import 'package:frame_demo/domain/usecases/event/event_input_data.dart';
import 'package:frame_demo/domain/usecases/event/event_output_data.dart';

import '../../../presentation/preseter/event/event_load_presenter.dart';
import '../../entity/model/event.dart';
import 'event_usecase.dart';

class EventInteractor implements EventUseCase {
  EventLoadPresenter eventLoadPresenter = EventLoadPresenter();

  @override
  load(EventLoadInputData inputData) {
    /// dataレイヤーにIDを送信
    /// response = data.load(inputData.id);
    Event event = Event(false, "respawn_point");

    EventLoadOutputData eventLoadOutputData;
    eventLoadOutputData = EventLoadOutputData([event]);
    eventLoadPresenter.output(eventLoadOutputData);
  }
}
