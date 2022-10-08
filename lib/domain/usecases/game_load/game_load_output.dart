import 'package:frame_demo/domain/entity/model/player.dart';

import '../../entity/model/map.dart';

class GameLoadOutputData {
  final MapModel _map;
  final PlayerModel _player;

  MapModel get map => _map;
  PlayerModel get player => _player;

  GameLoadOutputData(
    this._map,
    this._player,
  );
}
