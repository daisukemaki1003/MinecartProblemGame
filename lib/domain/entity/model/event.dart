class Event {
  /// フラグ
  bool _flag;
  String _name;

  Event(this._flag, this._name);

  bool get flag => _flag;
  String get name => _name;

  /// フラグ書き換え
  rewriteFlag() => _flag = !_flag;
}
