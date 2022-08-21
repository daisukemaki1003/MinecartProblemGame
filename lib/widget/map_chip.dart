import 'package:flame/game.dart';
import 'package:flame_tiled/flame_tiled.dart';

class MapChip extends FlameGame {
  // 画像パス
  String mapPath = "";
  Vector2 spriteSize = Vector2(32.0, 32.0);

  TiledComponent? mapChip;

  MapChip(this.mapPath, this.spriteSize);

  @override
  Future<void>? onLoad() async {
    mapChip = await TiledComponent.load(mapPath, spriteSize);
    await add(mapChip!);
  }

  /// 更新処理
  @override
  void update(double dt) {
    super.update(dt);
  }
}
