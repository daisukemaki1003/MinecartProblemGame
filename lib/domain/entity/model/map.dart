import 'event.dart';

class MapModel {
  /// マップパス
  final String _imagePath;
  final List<EventModel> _events;

  MapModel(this._imagePath, this._events);

  String get imagePath => _imagePath;
  List<EventModel> get events => _events;
}
