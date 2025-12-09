import 'package:flutter/material.dart';

/// A container with a custom bottom curve, used as a background element
/// in the onboarding screens.
class BottomRoundedContainer extends StatelessWidget {
  const BottomRoundedContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: BottomCurveClipper(),
      child: Container(
        height: 200,
        color: const Color.fromRGBO(141, 217, 62, 1), // Light green color
      ),
    );
  }
}

/// A custom clipper that creates a curved path at the bottom of the container.
///
/// The shape starts flat, curves up slightly, then closes back to the top.
class BottomCurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double h = size.height;
    double w = size.width;

    final path = Path();
    path.moveTo(0, h); // Start at bottom-left
    path.lineTo(0, h - 70); // Line up to start of curve
    // Quadratic bezier curve to create the wave effect
    path.quadraticBezierTo(
      w * 0.5, // Control point x (center)
      -10,     // Control point y (above top)
      w,       // End point x (right)
      h - 70,  // End point y
    );
    path.lineTo(w, h); // Line down to bottom-right
    path.close(); // Close the path

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
