import 'package:flame/components.dart';
import 'package:frame_demo/presentation/view_model/map_model.dart';
import 'package:frame_demo/presentation/view_model/player_model.dart';

import '../../domain/entity/model/event.dart';
import 'event_obj_model.dart';

class GameScreenModel {
  static final GameScreenModel _instance = GameScreenModel._internal();
  GameScreenModel._internal();
  factory GameScreenModel() {
    return _instance;
  }

  late PlayerModel _player;
  late MapModel _map;
  late List<Event> _events;

  PlayerModel get player => _player;
  MapModel get map => _map;
  List<Event> get events => _events;

  setPlayer(PlayerModel player) => _player = player;
  setMap(MapModel map) => _map = map;
  setEvents(List<Event> events) => _events = events;

  /// Other component
  final List<Component> _components = [];
  List<Component> get components => _components;
  addComponent(Component component) => _components.add(component);

  /// Add event
  EventObjModel createEvent() => EventObjModel(_map.tiledComponent, _events);
}
