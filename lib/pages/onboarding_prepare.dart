import 'package:flutter/material.dart';
import 'package:lingobreeze/pages/get_started.dart';
import 'package:lingobreeze/widgets/onboarding_page_template.dart';

import '../animations/animated_route.dart';

/// The third screen of the onboarding process.
class OnboardingPrepare extends StatelessWidget {
  const OnboardingPrepare({super.key});

  @override
  Widget build(BuildContext context) {
    return OnboardingPageTemplate(
      quote1: 'PREPARE!',
      quote2: 'For the Quest!',
      text: 'Face tougher challenges,\nearn rare rewards & rise as a\ntrue language warrior',
      imagePath: 'assets/hoppie.png',
      title: 'MOKSH',
      nextButtonColor: Colors.white,
      arrowColor: Color(0xFF06213D),
      onPressed: () => Navigator.of(context).push(
        AnimatedRoute(
          page: const GetStarted(),
          startColor: const Color(0xFF06213D),
          endColor: Colors.white,
        ),
      ),

    );
  }
}
