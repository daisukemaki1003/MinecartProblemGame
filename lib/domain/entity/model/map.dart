class Map {
  /// マップパス
  final String _imagePath;

  // late List<EventObj> _eventObjectList;

  Map(this._imagePath);

  String get imagePath => _imagePath;

  // /// イベントを追加
  // addEventObj(flag, position, objectSize) {
  //   EventObj obj = EventObj(flag, position, objectSize);
  //   _eventObjectList.add(obj);
  // }

  /// event検索
}
