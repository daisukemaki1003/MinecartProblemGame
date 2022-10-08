import 'package:flame/extensions.dart';

class MapTransitionModel {
  final String destinationMapPath;
  final Vector2 position;
  List<String> objects = [];

  setObjects(List<String> obj) => objects = obj;

  MapTransitionModel(this.destinationMapPath, this.position);
}
