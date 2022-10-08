import '../domain/entity/const/obj_name.dart';

class BaseData {
  /// Jsonデータをパースしてモデル変換
  /// Map
  String mapPath = "myRoom.tmx";
  List<String> objectNameList = [mapTransition, mapTransitionDestination];

  /// Player
  String name = "";
  String playerPath = "character/player2.png";
  double x = 0;
  double y = 0;
}
