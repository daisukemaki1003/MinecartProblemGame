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
  Vector2 spriteSize = Vector2(32.0, 32.0);

  MapWall(this.mapComponent, this.spriteSize);

  @override
  Future<void>? onLoad() async {
    /// マップチップの情報から当たり判定を作る
    /// for レイヤー
    for (var layer in mapComponent.tileMap.renderableLayers) {
      // "collision"ならヒットボックス配置
      if (layer.layer.properties.isNotEmpty &&
          layer.layer.properties[0].name.contains("collision")) {
        TileLayer? hitLayer = mapComponent.tileMap.getLayer(layer.layer.name);
        final tileData = hitLayer!.tileData;
        for (var line = 0; line < tileData!.length; line++) {
          for (var column = 0; column < tileData[0].length; column++) {
            final tile = tileData[line][column].tile;
            if (tile > 0) {
              // オブジェクトの位置
              // PositionComponent hitSprite = PositionComponent(
              //   position:
              //       Vector2(mySpriteSize.x * column, mySpriteSize.y * line),
              //   size: Vector2.zero(),
              // );
              // ヒットボックス
              // RectangleHitbox rectangleHitbox = RectangleHitbox(
              //   position: Vector2.zero(),
              //   size: mySpriteSize,
              // );
              RectangleHitbox rectangleHitbox = RectangleHitbox(
                position:
                    Vector2(mySpriteSize.x * column, mySpriteSize.y * line),
                size: mySpriteSize,
              );
              add(rectangleHitbox);

              // デバッグモード
              if (!isRelease) {
                rectangleHitbox.renderShape = true;
                rectangleHitbox.paint = BasicPalette.red.withAlpha(100).paint();
              }
            }
          }
        }
      }
    }
    await super.onLoad();
  }
}
