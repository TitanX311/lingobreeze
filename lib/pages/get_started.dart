import 'package:flutter/material.dart';
import 'package:lingobreeze/pages/language_select.dart';

class GetStarted extends StatelessWidget {
  const GetStarted({super.key});

  @override
  Widget build(BuildContext context) {
    final gradient = LinearGradient(colors: [Colors.cyanAccent, Colors.white]);
    return Scaffold(
      backgroundColor: const Color(0xFF06213D),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 40),
            const Spacer(),
            const Text(
              "JOURNEY!",
              style: TextStyle(
                fontSize: 45,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),

            const Text(
              "Awaits!",
              style: TextStyle(
                fontSize: 28,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 80),
            Image.asset('assets/lingo.jpg'),
            const SizedBox(height: 30),
            ShaderMask(
              shaderCallback: (bounds) {
                return gradient.createShader(
                  Rect.fromLTWH(0, 0, bounds.width, bounds.height),
                );
              },
              child: Text(
                "LingoBreeze",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 26,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Color(0xFF06213D),
                elevation: 8,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                // Padding
                textStyle: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ), // Text style
              ),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => LanguageSelect()));
              },
              child: const Text("Lets Get Started"),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
