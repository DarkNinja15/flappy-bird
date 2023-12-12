import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flame/parallax.dart';
import 'package:flappy_bird/common/assets.dart';
import 'package:flappy_bird/game/configurations.dart';
import 'package:flappy_bird/game/flappy_bird_game.dart';

class Ground extends ParallaxComponent<FlappyBirdGame> {
  Ground();

  @override
  FutureOr<void> onLoad() async {
    final ground = await Flame.images.load(Assets.ground);
    parallax =
        Parallax([ParallaxLayer(ParallaxImage(ground, fill: LayerFill.none))]);
    return super.onLoad();
  }

  @override
  void update(double dt) {
    parallax?.baseVelocity.x = Config.gameSpeed;
    super.update(dt);
  }
}
