import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame_tiled/flame_tiled.dart';
import 'package:tiled/tiled.dart';
import 'package:flame/palette.dart';

import '../gloabal.dart';

class MapChip extends PositionComponent with HasGameRef, CollisionCallbacks {
  // マップパス
  String mapPath = "";
  // 1フレームのスプライトサイズ
  Vector2 spriteSize = Vector2(32.0, 32.0);

  // マップタイル
  TiledComponent? mapTiled;

  MapChip(this.mapPath, this.spriteSize);

  @override
  Future<void>? onLoad() async {
    // マップタイル
    mapTiled = await TiledComponent.load(mapPath, spriteSize);
    await add(mapTiled!);

    /// マップチップの情報から当たり判定を作る
    /// for レイヤー
    for (var layer in mapTiled!.tileMap.renderableLayers) {
      print(layer.layer.name);
      print(layer.layer.properties);
      // "collision"ならヒットボックス配置
      if (layer.layer.properties.isNotEmpty &&
          layer.layer.properties[0].name.contains("collision")) {
        TileLayer? hitLayer = mapTiled!.tileMap.getLayer(layer.layer.name);
        final tileData = hitLayer!.tileData;
        for (var line = 0; line < tileData!.length; line++) {
          for (var column = 0; column < tileData[0].length; column++) {
            final tile = tileData[line][column].tile;
            if (tile > 0) {
              // オブジェクトの位置
              PositionComponent hitSprite = PositionComponent(
                position: Vector2(spriteSize.x * column, spriteSize.y * line),
                size: spriteSize,
              );
              // ヒットボックス
              RectangleHitbox rectangleHitbox = RectangleHitbox(
                position: Vector2.zero(),
                size: spriteSize,
              );
              hitSprite.add(rectangleHitbox);
              add(hitSprite);
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

  /// 更新処理
  @override
  void update(double dt) {
    super.update(dt);
  }
}
