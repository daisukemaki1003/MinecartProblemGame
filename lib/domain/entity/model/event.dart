class EventModel {
  /// フラグ
  bool _flag;
  final String _name;

  EventModel(this._flag, this._name);

  bool get flag => _flag;
  String get name => _name;

  /// フラグ書き換え
  rewrite() => _flag = !_flag;
}
