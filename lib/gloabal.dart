import 'package:flame/extensions.dart';

// リリースモード
const isRelease = bool.fromEnvironment('dart.vm.product');

// スプライトサイズ
final mySpriteSize = Vector2(32.0, 32.0);

// 衝突判定オブジェクト
const collision = "collision";

// リスポーンオブジェクト
const respoawnObj = "respawn_obj";

// リスポーンオブジェクト
const respoawnPoint = "respawn_point";
