import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_flappy_bird/components/background.dart';
import 'package:flutter_flappy_bird/components/bird.dart';
import 'package:flutter_flappy_bird/components/ground.dart';
import 'package:flutter_flappy_bird/components/pipe_group.dart';
import 'package:flutter_flappy_bird/game/configuration.dart';

class FlappyBirdGame extends FlameGame with TapDetector, HasCollisionDetection {
  FlappyBirdGame();

  late Bird bird;
  late TextComponent scoreCard;
  Timer interval = Timer(Config.pipeInterval, repeat: true);

  bool isHit = false;
  @override
  Future<void> onLoad() async {
    addAll([
      Background(),
      Ground(),
      bird = Bird(),
      scoreCard = buildScore(),
    ]);

    interval.onTick = () => add(PipeGroup());
  }

  TextComponent buildScore() {
    return TextComponent(
      text: 'Score 0',
      position: Vector2(size.x / 2, size.y / 2 * 0.2),
      anchor: Anchor.center,
      textRenderer: TextPaint(
        style: const TextStyle(
            fontSize: 50, fontFamily: 'PlayBold', fontWeight: FontWeight.bold),
      ),
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
    scoreCard.text = 'Score ${bird.score}';
  }
}
