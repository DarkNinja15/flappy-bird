import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flappy_bird/common/assets.dart';
import 'package:flappy_bird/game/bird_movement.dart';
import 'package:flappy_bird/game/configurations.dart';
import 'package:flappy_bird/game/flappy_bird_game.dart';
import 'package:flutter/material.dart';

class Bird extends SpriteGroupComponent<BirdMovement>
    with HasGameRef<FlappyBirdGame> {
  Bird();

  @override
  FutureOr<void> onLoad() async {
    final birdMidFlap = await gameRef.loadSprite(Assets.birdMidFlap);
    final birdDownFlap = await gameRef.loadSprite(Assets.birdDownFlap);
    final birdUpFlap = await gameRef.loadSprite(Assets.birdUpFlap);

    size = Vector2(50, 40);
    current = BirdMovement.middle;
    position = Vector2(50, gameRef.size.y / 2 - size.y / 2);
    sprites = {
      BirdMovement.middle: birdMidFlap,
      BirdMovement.down: birdDownFlap,
      BirdMovement.up: birdUpFlap,
    };
    return super.onLoad();
  }

  @override
  void update(double dt) {
    position.y += dt * Config.birdVelocity;
    super.update(dt);
  }

  void fly() {
    add(
      MoveByEffect(
          Vector2(0, Config.gravity),
          EffectController(
            duration: 0.2,
            curve: Curves.decelerate,
          ), onComplete: () {
        current = BirdMovement.down;
      }),
    );
    current = BirdMovement.up;
  }
}
