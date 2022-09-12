import 'package:frame_demo/domain/usecases/event/event_output_data.dart';
import 'package:frame_demo/presentation/view_model/event_obj_model.dart';
import 'package:frame_demo/presentation/view_model/game_screen.dart';

class EventLoadPresenter {
  void output(EventLoadOutputData outputData) {
    GameScreenModel gameScreenModel = GameScreenModel();

    /// イベントオブジェクト設定
    // EventObjModel eventObjectModel = EventObjModel(outputData.events);
    gameScreenModel.setEvents(outputData.events);
  }
}
