import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:ninja_hop/lib/game/ninja_hop_game.dart';
import 'package:ninja_hop/lib/view/screens/game_over.dart';
import 'package:ninja_hop/lib/view/screens/main_menu.dart';

void main() async {
  final game = NinJaHopGame();

  runApp(
    GameWidget(
      game: game,
      initialActiveOverlays: const [MainMenu.id],
      overlayBuilderMap: {
        'mainMenu': (context, newGame) => MainMenu(game: game),
        'gameOver': (context, newGame) => GameOver(game: game),
      },
    ),
  );
}
