import 'package:flutter/material.dart';
import 'package:ninja_hop/lib/assets/assets.dart';
import 'package:ninja_hop/lib/game/ninja_hop_game.dart';

class MainMenu extends StatelessWidget {
  final NinJaHopGame game;
  static const String id = 'mainMenu';
  const MainMenu({super.key, required this.game});

  @override
  Widget build(BuildContext context) {
    game.pauseEngine();
    return Scaffold(
      body: GestureDetector(
        onTap: (){
          game.overlays.remove('mainMenu');
          game.resumeEngine();
        },
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(Assets.menu),
              fit: BoxFit.cover,
            ),
          ),
          child: Image.asset(Assets.message),
        ),
      ),
    );
  }
}
