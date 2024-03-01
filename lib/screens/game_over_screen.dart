import 'package:flutter/material.dart';

import 'package:flutter_flappy_bird/game/assets.dart';
import 'package:flutter_flappy_bird/game/flappy_bird_game.dart';

class GameOverScreen extends StatelessWidget {
  const GameOverScreen({super.key, required this.game});
  final FlappyBirdGame game;
  static const String id = 'gameOver';

  void onRestart() {
    game.bird.reset();
    game.overlays.remove("gameOver");
    game.resumeEngine();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black26,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Score: ${game.bird.score}',
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 50,
                  fontFamily: 'PlayBold',
                  fontWeight: FontWeight.bold),
            ),
            Image.asset(Assets.gameOver),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: onRestart,
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 106, 157, 216)),
              child: const Text(
                'Restart',
                style: TextStyle(
                  fontSize: 20,
                  color: Color.fromARGB(255, 1, 52, 27),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
