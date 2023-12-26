import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';
import 'package:ninja_hop/lib/assets/assets.dart';
import 'package:ninja_hop/lib/configuration/configuration.dart';
import 'package:ninja_hop/lib/game/ninja_hop_game.dart';
import 'package:ninja_hop/lib/states/ninja_movement.dart';

class Ninja extends SpriteGroupComponent<NinjaMovement>
    with HasGameRef<NinJaHopGame>, CollisionCallbacks {
  Ninja();

  int score = 0;

  @override
  Future<void> onLoad() async {
    final ninjaMidHop = await gameRef.loadSprite(Assets.ninjaMidHop);
    final ninjaUpHop = await gameRef.loadSprite(Assets.ninjaUpHop);
    final ninjaDownHop = await gameRef.loadSprite(Assets.ninjaDownHop);

    size = Vector2(74, 64);
    position = Vector2(50, gameRef.size.y / 2 - size.y / 2);
    current = NinjaMovement.middle;

    sprites = {
      NinjaMovement.middle: ninjaMidHop,
      NinjaMovement.up: ninjaUpHop,
      NinjaMovement.down: ninjaDownHop,
    };

    add(CircleHitbox());
  }

  @override
  void onCollisionStart(
      Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollisionStart(intersectionPoints, other);
    gameOver();
  }

  void fly() {
    add(
      MoveByEffect(Vector2(0, Config.gravity),
          EffectController(duration: 0.2, curve: Curves.decelerate),
          onComplete: () => current = NinjaMovement.down),
    );
    current = NinjaMovement.up;
    FlameAudio.play(Assets.hop);
  }

  void gameOver() {
    FlameAudio.play(Assets.collision);
    gameRef.pauseEngine();
    gameRef.overlays.add('gameOver');
    game.isHit = true;
  }

  void reset() {
    position = Vector2(50, gameRef.size.y / 2 - size.y / 2);
    gameRef.overlays.remove('gameOver');
    gameRef.resumeEngine();
    score = 0;
  }

  @override
  void update(double dt) {
    super.update(dt);
    position.y += Config.ninjaVelocity * dt;

    if(position.y < 1) {
      gameOver();
    }
  }
}
