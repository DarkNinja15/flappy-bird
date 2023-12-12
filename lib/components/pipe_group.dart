import 'dart:async';
import 'dart:math';

import 'package:flame/components.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flappy_bird/common/assets.dart';
import 'package:flappy_bird/components/pipe.dart';
import 'package:flappy_bird/game/configurations.dart';
import 'package:flappy_bird/game/flappy_bird_game.dart';
import 'package:flappy_bird/game/pipe_position.dart';

class PipeGroup extends PositionComponent with HasGameRef<FlappyBirdGame> {
  PipeGroup();

  final _random = Random();

  @override
  FutureOr<void> onLoad() {
    position.x = gameRef.size.x;
    final heightMinusGround = gameRef.size.y - Config.groundHeight;
    final spacing = 100 + _random.nextDouble() * (heightMinusGround / 4);
    final center =
        spacing + _random.nextDouble() * (heightMinusGround - spacing);
    addAll([
      Pipe(height: center - spacing / 2, pipePositon: PipePositon.top),
      Pipe(
          height: heightMinusGround - (center + spacing / 2),
          pipePositon: PipePositon.bottom),
    ]);
    return super.onLoad();
  }

  @override
  void update(double dt) {
    position.x -= dt * Config.gameSpeed;

    if (position.x < -10) {
      removeFromParent();
      updateScore();
    }

    if (gameRef.isHit) {
      removeFromParent();
      game.isHit = false;
    }
    super.update(dt);
  }

  void updateScore() {
    gameRef.bird.score += 1;
    FlameAudio.play(Assets.point);
  }
}
