import 'package:flutter/material.dart';

class AnimatedRoute extends PageRouteBuilder {
  final Widget page;
  final Color startColor;
  final Color endColor;

  AnimatedRoute({
    required this.page,
    required this.startColor,
    required this.endColor,
  }) : super(
    transitionDuration: const Duration(milliseconds: 700),
    reverseTransitionDuration: const Duration(milliseconds: 600),
    pageBuilder: (_, __, ___) => page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      // Fade new page in
      final fadeIn = CurvedAnimation(
        parent: animation,
        curve: Curves.easeInOut,
      );

      // Slide old page left
      final exitSlide = Tween<Offset>(
        begin: Offset.zero,
        end: const Offset(-1.1, 0),
      ).animate(
        CurvedAnimation(parent: animation, curve: Curves.easeOut),
      );

      return Stack(
        children: [
          // Old page sliding away
          SlideTransition(
            position: exitSlide,
            child: secondaryAnimation.status != AnimationStatus.dismissed
                ? const SizedBox()
                : child, // this keeps old widget sliding left
          ),

          // New page fading in
          FadeTransition(
            opacity: fadeIn,
            child: child,
          ),
        ],
      );
    },


  );
}
