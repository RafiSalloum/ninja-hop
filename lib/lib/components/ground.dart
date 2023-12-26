import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flame/parallax.dart';
import 'package:ninja_hop/lib/assets/assets.dart';
import 'package:ninja_hop/lib/configuration/configuration.dart';
import 'package:ninja_hop/lib/game/ninja_hop_game.dart';

class Ground extends ParallaxComponent<NinJaHopGame> with HasGameRef<NinJaHopGame> {
  Ground();

  @override
  Future<void> onLoad() async {
    final ground = await Flame.images.load(Assets.ground);
    parallax = Parallax([
      ParallaxLayer(
      ParallaxImage(ground, fill: LayerFill.none),
    ),
    ]);

    add(RectangleHitbox(
      position: Vector2(0, gameRef.size.y - Config.groundHeight + 8.0),
      size: Vector2(gameRef.size.x, Config.groundHeight)
    ));
  }

  @override
  void update(double dt) {
    super.update(dt);
    parallax?.baseVelocity.x = Config.gameSpeed;
  }
}