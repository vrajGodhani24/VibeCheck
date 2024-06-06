import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vibecheck/views/splashscreen/splash_controller.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SplashController());
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('assets/background/background.png'),
          ),
        ),
        child: TweenAnimationBuilder(
          tween: Tween<double>(begin: 0, end: 1),
          duration: const Duration(seconds: 1),
          builder: (context, value, _) {
            return Opacity(
              opacity: value,
              child: TweenAnimationBuilder(
                tween: Tween<double>(begin: 0.8, end: 1),
                duration: const Duration(milliseconds: 500),
                child: Image.asset(
                  "assets/logo/VibeCheck.png",
                  height: 140,
                ),
                builder: (context, value, widget) {
                  return Transform.scale(
                    scale: value,
                    child: widget,
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
