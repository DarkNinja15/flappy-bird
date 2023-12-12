import 'dart:async';

import 'package:flame/game.dart';
import 'package:flappy_bird/components/background.dart';
import 'package:flappy_bird/components/bird.dart';
import 'package:flappy_bird/components/ground.dart';
import 'package:flappy_bird/components/pipe_group.dart';

class FlappyBirdGame extends FlameGame {
  late Bird bird;
  @override
  FutureOr<void> onLoad() {
    addAll([
      Background(),
      Ground(),
      bird = Bird(),
      PipeGroup(),
    ]);
    return super.onLoad();
  }
}
