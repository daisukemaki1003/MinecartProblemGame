import 'player_input_data.dart';

abstract class PlayerUseCase {
  /// 作成
  create(PlayerAddInputData inputData);

  /// 取得
  void getDetail();

  /// 移動
  move(PlayerMoveInputData inputData);
}
