import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flappy_bird/components/background.dart';
import 'package:flappy_bird/components/bird.dart';
import 'package:flappy_bird/components/ground.dart';
import 'package:flappy_bird/components/pipe_group.dart';
import 'package:flappy_bird/game/configurations.dart';
import 'package:flutter/material.dart';

class FlappyBirdGame extends FlameGame with TapDetector, HasCollisionDetection {
  late Bird bird;
  late TextComponent scoreText;
  bool isHit = false;
  final _interval = Timer(Config.pipeInterval, repeat: true);
  @override
  FutureOr<void> onLoad() {
    addAll([Background(), Ground(), bird = Bird(), scoreText = buildScore()]);

    _interval.onTick = () {
      add(PipeGroup());
    };
    return super.onLoad();
  }

  @override
  void update(double dt) {
    _interval.update(dt);
    scoreText.text = 'Score: ${bird.score}';
    super.update(dt);
  }

  TextComponent buildScore() {
    return TextComponent(
        text: 'Score: 0',
        textRenderer: TextPaint(
            style: const TextStyle(
          fontFamily: 'Game',
          fontSize: 40,
          fontWeight: FontWeight.bold,
        )),
        position: Vector2(
          size.x / 2,
          size.y / 2 * 0.2,
        ),
        anchor: Anchor.center);
  }

  @override
  void onTap() {
    bird.fly();
    super.onTap();
  }
}
