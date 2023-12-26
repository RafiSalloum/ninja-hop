import 'package:flutter/material.dart';
import 'package:ninja_hop/lib/assets/assets.dart';
import 'package:ninja_hop/lib/game/ninja_hop_game.dart';

class GameOver extends StatelessWidget {
  final NinJaHopGame game;
  static const String id = 'gameOver';
  const GameOver({super.key, required this.game});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black38,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(Assets.gameOver),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                'Score: ${game.bird.score}',
                style: const TextStyle(
                  fontSize: 30.0,
                  color: Colors.white,
                  fontFamily: 'pressStart',
                ),
              ),
            ),
            const SizedBox(height: 40.0),
            ElevatedButton(
              onPressed: onRestart,
              style: ElevatedButton.styleFrom(backgroundColor: Colors.orange, elevation: 0.0, fixedSize:const Size(200.0, 40.0) ),
              child: const Text('Restart', style: TextStyle(fontFamily: 'game', color: Colors.white, fontSize: 24.0),),
            ),
          ],
        ),
      ),
    );
  }

  onRestart() {
    game.bird.reset();
  }
}
