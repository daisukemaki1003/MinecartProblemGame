import 'package:frame_demo/domain/entity/model/player.dart';

import '../../../presentation/preseter/player/player_get_detail_presenter.dart';
import 'player_input_data.dart';
import 'player_output_data.dart';
import 'player_usecase.dart';

class PlayerInteractor implements PlayerUseCase {
  late Player player;

  PlayerGetDetailPresenter playerGetDetailPresenter =
      PlayerGetDetailPresenter();

  /// 作成
  @override
  create(PlayerAddInputData inputData) {
    player = Player(inputData.imagePath, inputData.name, inputData.position);
  }

  /// 取得
  @override
  void getDetail() {
    PlayerGetDetailOutputData output = PlayerGetDetailOutputData(player);
    playerGetDetailPresenter.output(output);
  }

  /// 移動
  @override
  move(PlayerMoveInputData inputData) {
    player.move(inputData.position);
  }
}
