import 'package:bookly/Features/splash/presentation/home/presentation/views/home_view.dart';
import 'package:bookly/constants.dart';
import 'package:bookly/core/utils/assets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';

class SpalshViewBody extends StatefulWidget {
  const SpalshViewBody({super.key});

  @override
  State<SpalshViewBody> createState() => _SpalshViewBodyState();
}

class _SpalshViewBodyState extends State<SpalshViewBody> {
  @override
  void initState() {
    super.initState();

    navigateToHome();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset(AssetsDate.logo),
        const SizedBox(
          height: 4,
        ),
        const Text(
          'Read Free Books',
          textAlign: TextAlign.center,
        ).animate().slideY(
              begin: 5,
              end: 0,
              duration: kTransitionDuration,
              delay: kTransitionDelay,
            )
      ],
    );
  }
}

//  Methods
void navigateToHome() {
  Future.delayed(const Duration(seconds: 2), () {
    Get.to(
      () => const HomeView(),
      transition: Transition.fadeIn,
      duration: kTransitionDuration,
    );
  });
}
