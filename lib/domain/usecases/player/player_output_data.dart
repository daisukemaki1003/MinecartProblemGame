import 'package:frame_demo/domain/entity/model/player.dart';

class PlayerAddOutputData {}

class PlayerGetDetailOutputData {
  Player _player;
  PlayerGetDetailOutputData(this._player);
  Player get player => _player;
}
