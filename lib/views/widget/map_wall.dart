import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame_tiled/flame_tiled.dart';
import 'package:tiled/tiled.dart';
import 'package:flame/palette.dart';

import '../../gloabal.dart';

class MapWall extends PositionComponent with HasGameRef, CollisionCallbacks {
  // マップタイル
  TiledComponent mapComponent;
  // 1フレームのスプライトサイズ
  Vector2 spriteSize;

  MapWall(this.mapComponent, this.spriteSize);

  @override
  Future<void>? onLoad() async {
    /// マップチップの情報から当たり判定を作る
    TileLayer? hitLayer = mapComponent.tileMap.getLayer("collision");
    final tileData = hitLayer!.tileData;
    for (var line = 0; line < tileData!.length; line++) {
      for (var column = 0; column < tileData[0].length; column++) {
        final tile = tileData[line][column].tile;
        if (tile > 0) {
          PositionComponent hitSprite = PositionComponent(
            position: Vector2(spriteSize.x * column, spriteSize.y * line),
            size: spriteSize,
          );
          RectangleHitbox rectangleHitbox = RectangleHitbox(
            position: Vector2.zero(),
            size: mySpriteSize,
          );
          hitSprite.add(rectangleHitbox);
          mapComponent.add(hitSprite);

          // デバッグモード
          if (!isRelease) {
            rectangleHitbox.renderShape = true;
            rectangleHitbox.paint = BasicPalette.red.withAlpha(100).paint();
          }
        }
      }
    }

    await super.onLoad();
  }
}
