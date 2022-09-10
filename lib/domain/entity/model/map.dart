import 'package:flutter/material.dart';
import 'package:frame_demo/domain/entity/model/event_object.dart';

class Map {
  /// マップパス
  final String _imagePath;

  late List<EventObject> _eventObjectList;

  Map(this._imagePath);

  String get imagePath => _imagePath;

  /// イベントを追加
  addEventObj(flag, position, objectSize) {
    EventObject obj = EventObject(flag, position, objectSize);
    _eventObjectList.add(obj);
  }

  /// event検索
}
