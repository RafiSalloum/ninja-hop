import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flame/text.dart';
import 'package:flutter/material.dart';
import 'package:ninja_hop/lib/components/background.dart';
import 'package:ninja_hop/lib/components/ground.dart';
import 'package:ninja_hop/lib/components/ninja.dart';
import 'package:ninja_hop/lib/components/pipe_group.dart';
import 'package:ninja_hop/lib/configuration/configuration.dart';

class NinJaHopGame extends FlameGame with TapDetector, HasCollisionDetection {
  late Ninja bird;
  late TextComponent score;
  Timer interval = Timer(Config.pipeInterval, repeat: true);
  bool isHit = false;

  @override
  Future<void> onLoad() async {
    addAll([Background(), Ground(), bird = Ninja(), score = buildScore()]);
    interval.onTick = () => add(PipeGroup());
  }

  TextComponent buildScore() {
    return TextComponent(
      text: 'Score: 0',
      textRenderer: TextPaint(
        style: const TextStyle(
          fontSize: 40.0,
          color: Colors.white70,
          fontFamily: 'game',
        ),
      ),
      position: Vector2(size.x / 2.5, size.y / 2 * 0.2)
    );
  }

  @override
  void onTap() {
    super.onTap();
    bird.fly();
  }

  @override
  void update(double dt) {
    super.update(dt);
    interval.update(dt);
    score.text = 'Score: ${bird.score}';
  }
}
