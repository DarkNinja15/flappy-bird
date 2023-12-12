import 'dart:async';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flappy_bird/common/assets.dart';
import 'package:flappy_bird/game/configurations.dart';
import 'package:flappy_bird/game/flappy_bird_game.dart';
import 'package:flappy_bird/game/pipe_position.dart';

class Pipe extends SpriteComponent with HasGameRef<FlappyBirdGame> {
  Pipe({required this.height, required this.pipePositon});

  @override
  final double height;
  final PipePositon pipePositon;

  @override
  FutureOr<void> onLoad() async {
    final pipe = await Flame.images.load(Assets.pipe);
    final pipeRotated = await Flame.images.load(Assets.pipeRotated);
    size = Vector2(50, height);

    if (pipePositon == PipePositon.top) {
      position.y = 0;
      sprite = Sprite(pipeRotated);
    } else {
      position.y = gameRef.size.y - size.y - Config.groundHeight;
      sprite = Sprite(pipe);
    }

    add(RectangleHitbox());
    return super.onLoad();
  }
}
