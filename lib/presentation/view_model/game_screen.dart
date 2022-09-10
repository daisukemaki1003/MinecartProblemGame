import 'package:flame/components.dart';
import 'package:frame_demo/presentation/view_model/map_model.dart';
import 'package:frame_demo/presentation/view_model/player_model.dart';

class GameScreenModel {
  static final GameScreenModel _instance = GameScreenModel._internal();
  GameScreenModel._internal();
  factory GameScreenModel() {
    return _instance;
  }

  late PlayerModel _player;
  late MapModel _map;

  setPlayer(PlayerModel player) => _player = player;
  setMap(MapModel map) => _map = map;

  get player => _player;
  get map => _map;

  final List<Component> _components = [];
  List<Component> get components => _components;

  addComponent(Component component) {
    _components.add(component);
    print(_components);
  }
}
