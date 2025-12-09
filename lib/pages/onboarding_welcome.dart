import 'package:flutter/material.dart';
import 'package:lingobreeze/pages/onboarding_focus.dart';
import 'package:lingobreeze/widgets/onboarding_page_template.dart';

import '../animations/animated_route.dart';

/// The first screen of the onboarding process.
class OnboardingWelcome extends StatelessWidget {
  const OnboardingWelcome({super.key});

  @override
  Widget build(BuildContext context) {
    return OnboardingPageTemplate(
      quote1: 'AHOY!',
      quote2: 'Welcome abroad!',
      text: 'Learn Language as you sail\nthrough islands of\nadventure!',
      imagePath: 'assets/hoppie.png',
      title: 'HOPPIE',
      nextButtonColor: const Color.fromRGBO(141, 217, 62, 1),
      onPressed: () => Navigator.of(context).push(
        AnimatedRoute(
          page: const OnboardingFocus(),
          startColor: const Color(0xFF06213D),
          endColor: const Color.fromRGBO(59, 30, 14, 1),
        ),
      ),
    );
  }
}
