import 'dart:async';

import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flappy_bird/components/background.dart';
import 'package:flappy_bird/components/bird.dart';
import 'package:flappy_bird/components/ground.dart';
import 'package:flappy_bird/components/pipe_group.dart';
import 'package:flame/timer.dart';
import 'package:flappy_bird/game/configurations.dart';

class FlappyBirdGame extends FlameGame with TapDetector {
  late Bird bird;
  final _interval = Timer(Config.pipeInterval, repeat: true);
  @override
  FutureOr<void> onLoad() {
    addAll([
      Background(),
      Ground(),
      bird = Bird(),
    ]);

    _interval.onTick = () {
      add(PipeGroup());
    };
    return super.onLoad();
  }

  @override
  void update(double dt) {
    _interval.update(dt);
    super.update(dt);
  }

  @override
  void onTap() {
    bird.fly();
    super.onTap();
  }
}
