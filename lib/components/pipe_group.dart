import 'dart:async';

import 'package:flame/components.dart';
import 'package:flappy_bird/components/pipe.dart';
import 'package:flappy_bird/game/configurations.dart';
import 'package:flappy_bird/game/flappy_bird_game.dart';
import 'package:flappy_bird/game/pipe_position.dart';

class PipeGroup extends PositionComponent with HasGameRef<FlappyBirdGame> {
  PipeGroup();

  @override
  FutureOr<void> onLoad() {
    position.x = gameRef.size.x;
    addAll([
      Pipe(height: 100, pipePositon: PipePositon.top),
      Pipe(height: 200, pipePositon: PipePositon.bottom),
    ]);
    return super.onLoad();
  }

  @override
  void update(double dt) {
    position.x -= dt * Config.gameSpeed;
    super.update(dt);
  }
}
