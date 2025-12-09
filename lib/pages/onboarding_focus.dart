import 'package:flutter/material.dart';
import 'package:lingobreeze/pages/onboarding_prepare.dart';
import 'package:lingobreeze/widgets/onboarding_page_template.dart';

import '../animations/animated_route.dart';

/// The second screen of the onboarding process.
class OnboardingFocus extends StatelessWidget {
  const OnboardingFocus({super.key});

  @override
  Widget build(BuildContext context) {
    return OnboardingPageTemplate(
      quote1: 'FOCUS!',
      quote2: 'Your Mind!',
      text: 'Master words, unlock\ntreasures and level up your\njourney.',
      imagePath: 'assets/hoppie.png',
      title: 'MOKSH',
      nextButtonColor: const Color.fromRGBO(59, 30, 14, 1),
      onPressed: () => Navigator.of(context).push(
        AnimatedRoute(
          page: const OnboardingPrepare(),
          startColor: const Color.fromRGBO(59, 30, 14, 1),
          endColor: const Color(0xFF06213D),
        ),
      ),

    );
  }
}
