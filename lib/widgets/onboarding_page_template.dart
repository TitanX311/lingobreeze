import 'package:flutter/material.dart';
import 'package:lingobreeze/widgets/bottom_rounded_container.dart';

/// A reusable widget template for onboarding screens.
///
/// This widget displays a two-part quote, a description text, a central image,
/// a name/title, and a navigation button within a styled container.
class OnboardingPageTemplate extends StatelessWidget {
  final String quote1;
  final String quote2;
  final String text;
  final String imagePath;
  final String title;
  final Color nextButtonColor;
  final Color arrowColor;
  final VoidCallback onPressed;

  const OnboardingPageTemplate({
    super.key,
    required this.quote1,
    required this.quote2,
    required this.text,
    required this.imagePath,
    required this.title,
    required this.nextButtonColor,
    this.arrowColor = Colors.white,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF06213D),
      body: Column(
        children: [
          const SizedBox(height: 40),
          const Spacer(),
          // First part of the quote
          FadeTransition(
            opacity: CurvedAnimation(
              parent: ModalRoute.of(context)!.animation!,
              curve: Curves.easeInOut,
            ),
            child: Text(
              quote1,
              style: const TextStyle(
                fontSize: 45,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          const SizedBox(height: 10),

          // Second part of the quote
          FadeTransition(
            opacity: CurvedAnimation(
              parent: ModalRoute.of(context)!.animation!,
              curve: Curves.easeInOut,
            ),
            child: Text(
              quote2,
              style: const TextStyle(
                fontSize: 28,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          const Spacer(),

          // Description text
          FadeTransition(
            opacity: CurvedAnimation(
              parent: ModalRoute.of(context)!.animation!,
              curve: Curves.easeInOut,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Text(
                text,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 22, color: Colors.white),
              ),
            ),
          ),

          const Spacer(),

          // Central image with shadow
          Container(
            decoration: const BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black54,
                  spreadRadius: -5,
                  blurRadius: 10,
                  offset: Offset(0, 10),
                ),
              ],
            ),
            child: SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(0, 0.4), // start slightly lower
                end: Offset.zero,
              ).animate(
                CurvedAnimation(
                  parent: ModalRoute.of(context)!.animation!,
                  curve: Curves.easeOut,
                ),
              ),
              child: Image.asset(imagePath, height: 170),
            ),

          ),
          const Spacer(),

          // Title or character name
          FadeTransition(
            opacity: CurvedAnimation(
              parent: ModalRoute.of(context)!.animation!,
              curve: Curves.easeInOut,
            ),
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 19,
                color: Colors.white,
                letterSpacing: 2,
              ),
            ),
          ),

          // Bottom container with navigation button
          Stack(
            alignment: Alignment.center,
            children: [
              // Curved green container background
              const BottomRoundedContainer(),
              // Floating Action Button for navigation
              Positioned(
                top: 30,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    const CircleAvatar(
                      radius: 46,
                      backgroundColor: Color(0xFF06213D),
                    ),
                    CircleAvatar(
                      radius: 27,
                      backgroundColor: nextButtonColor,
                      child: IconButton(
                        onPressed: onPressed,
                        icon: const Icon(
                          Icons.arrow_forward,
                          size: 28,
                          weight: 700,
                        ),
                        color: arrowColor,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
