import 'dart:async';

import 'package:flame/components.dart';
import 'package:flappy_bird/common/assets.dart';
import 'package:flappy_bird/game/bird_movement.dart';
import 'package:flappy_bird/game/flappy_bird_game.dart';

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
}
