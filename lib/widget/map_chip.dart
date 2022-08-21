import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame_tiled/flame_tiled.dart';
import 'package:tiled/tiled.dart';
import 'package:flame/palette.dart';

import '../gloabal.dart';
import '../screen/game_main.dart';

class MapChip extends Component with HasGameRef, CollisionCallbacks {
  // マップパス
  String mapPath = "";
  // 1フレームのスプライトサイズ
  Vector2 spriteSize = Vector2(32.0, 32.0);

  TiledComponent? mapChip;

  MapChip(this.mapPath, this.spriteSize);

  @override
  Future<void>? onLoad() async {
    mapChip = await TiledComponent.load(mapPath, spriteSize);
    await add(mapChip!);

    // マップチップの情報から当たり判定を作る
    TileLayer? hitLayer = mapChip!.tileMap.getLayer("wall");
    int line = 0;
    int column = 0;
    hitLayer!.tileData!.forEach((element) {
      element.forEach((childElement) {
        if (childElement.tile == 343) {
          // 通れる地面以外の場合当たり判定を置く
          PositionComponent hitSprite = PositionComponent(
            position: Vector2(spriteSize.x * column, spriteSize.y * line),
            size: spriteSize,
          );
          RectangleHitbox rectangleHitbox = RectangleHitbox(
            position: Vector2.zero(),
            size: spriteSize,
          );
          hitSprite.add(rectangleHitbox);
          add(hitSprite);
          if (!isRelease) {
            rectangleHitbox.renderShape = true;
            rectangleHitbox.paint = BasicPalette.red.withAlpha(100).paint();
          }
        }
        column++;
      });
      column = 0;
      line++;
    });
    await super.onLoad();
  }

  /// 更新処理
  @override
  void update(double dt) {
    super.update(dt);
  }
}
