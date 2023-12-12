import 'package:flappy_bird/common/assets.dart';
import 'package:flappy_bird/game/flappy_bird_game.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key, required this.flappyBirdGame}) : super(key: key);

  final FlappyBirdGame flappyBirdGame;
  static const routeName = '/main';

  @override
  Widget build(BuildContext context) {
    flappyBirdGame.pauseEngine();
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          flappyBirdGame.overlays.remove('/main');
          flappyBirdGame.resumeEngine();
        },
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(Assets.menu),
              fit: BoxFit.cover,
            ),
          ),
          child: Image.asset(Assets.message),
        ),
      ),
    );
  }
}
