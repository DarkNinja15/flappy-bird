import 'package:flame/game.dart';
import 'package:flappy_bird/game/flappy_bird_game.dart';
import 'package:flappy_bird/screens/game_over_screen.dart';
import 'package:flappy_bird/screens/main_screen.dart';
import 'package:flutter/material.dart';

void main() {
  final game = FlappyBirdGame();
  runApp(GameWidget(
    game: game,
    initialActiveOverlays: const [MainScreen.routeName],
    overlayBuilderMap: {
      '/main': (context, _) => MainScreen(flappyBirdGame: game),
      '/game-over': (context, _) => GameOverScreen(
            flappyBirdGame: game,
          ),
    },
  ));
}
