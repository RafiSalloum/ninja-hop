import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:ninja_hop/lib/assets/assets.dart';
import 'package:ninja_hop/lib/configuration/configuration.dart';
import 'package:ninja_hop/lib/game/ninja_hop_game.dart';
import 'package:ninja_hop/lib/pipe_position/pipe_position.dart';

class Pipe extends SpriteComponent with HasGameRef<NinJaHopGame> {
  Pipe({required this.height, required this.pipePosition});

  @override
  final double height;
  final PipePosition pipePosition;

  @override
  Future<void> onLoad() async {
    final pipe = await Flame.images.load(Assets.pipe);
    final pipeRotated = await Flame.images.load(Assets.pipeRotated);
    size = Vector2(50, height);

    switch (pipePosition) {
      case PipePosition.top:
        position.y = 0;
        sprite = Sprite(pipeRotated);
        break;
      case PipePosition.bottom:
        position.y = gameRef.size.y - size.y - Config.groundHeight;
        sprite = Sprite(pipe);
        break;
    }

    add(RectangleHitbox());
  }
}
