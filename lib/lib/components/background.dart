import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flame/parallax.dart';
import 'package:ninja_hop/lib/assets/assets.dart';
import 'package:ninja_hop/lib/configuration/configuration.dart';
import 'package:ninja_hop/lib/game/ninja_hop_game.dart';

class Background extends ParallaxComponent<NinJaHopGame> with HasGameRef<NinJaHopGame> {
  Background();

  @override
  Future<void> onLoad() async {
    final background = await Flame.images.load(Assets.background);
    parallax = Parallax([
      ParallaxLayer(
        ParallaxImage(background, fill: LayerFill.height),
      ),
    ]);
  }

  @override
  void update(double dt) {
    super.update(dt);
    parallax?.baseVelocity.x = Config.backgroundSpeed;
  }
}