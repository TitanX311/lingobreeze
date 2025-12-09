import 'package:flutter/material.dart';

class LanguageSelect extends StatefulWidget {
  const LanguageSelect({super.key});

  @override
  State<LanguageSelect> createState() => _LanguageSelectState();
}

class _LanguageSelectState extends State<LanguageSelect>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _imageSlide;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    );

    _imageSlide = Tween<Offset>(
      begin: const Offset(-1.5, 0), // start off-screen left
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeOutBack,
      ),
    );

    // Delay before playing animation
    Future.delayed(const Duration(milliseconds: 150), () {
      if (mounted) _controller.forward();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List<String> languages = [
      'हिन्दी',
      'English',
      'मराठी',
      'தமிழ்',
      'اردو',
      'తెలుగు',
      'ಕನ್ನಡ',
      'മലയാളം',
      'English',
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 35),
            child: GridView.count(
              shrinkWrap: true,
              crossAxisCount: 3,
              mainAxisSpacing: 22,
              crossAxisSpacing: 22,
              childAspectRatio: 2.2,
              physics: const NeverScrollableScrollPhysics(),
              children: languages.map((lang) {
                return GestureDetector(
                  onTap: () {
                    print("Clicked: $lang");
                  },
                  child: Center(
                    child: Text(
                      lang,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),

          const Spacer(),

          // 🟩 Chat bubble
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 40, 0),
              child: CustomPaint(
                painter: ChatBubblePainter(),
                size: const Size(230, 100),
              ),
            ),
          ),

          // 🟩 Animated Frog Image
          Align(
            alignment: Alignment.centerLeft,
            child: SlideTransition(
              position: _imageSlide,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(40, 0, 0, 0),
                child: Image.asset('assets/hoppie.png', height: 200),
              ),
            ),
          ),

          // 🟩 Wave
          CustomPaint(
            size: const Size(double.infinity, 60),
            painter: RealisticWaterPatchesPainter(),
          ),

          const SizedBox(height: 42),

          // 🟩 Continue Button
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 30),
            child: SizedBox(
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {},
                child: const SizedBox(
                  width: double.infinity,
                  child: Text(
                    "Continue",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Color(0xFF06213D)),
                  ),
                ),
              ),
            ),
          ),

          const SizedBox(height: 100),
        ],
      ),
    );
  }
}

class RealisticWaterPatchesPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    int patches = 7;

    for (int i = 0; i < patches; i++) {
      _drawPatch(canvas, size, i);
    }
  }

  void _drawPatch(Canvas canvas, Size size, int index) {
    // Increased spacing between lines
    double y = size.height * (0.15 + index * 0.18);

    double opacity = 0.12 + (index * 0.015);
    double strokeWidth = 4 + index * 0.8;

    final paint = Paint()
      ..color = Colors.white.withOpacity(opacity.clamp(0.05, 0.25))
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    Path path = Path();
    path.moveTo(-20, y);

    double x = 0;
    while (x < size.width + 40) {
      double cpX = x + 40;
      double cpY = y + (index.isEven ? -8 : 8);

      double endX = cpX + 45;
      double endY = y + (index.isEven ? 6 : -6);

      path.quadraticBezierTo(cpX, cpY, endX, endY);
      x = endX;
    }

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class ChatBubblePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFFE0E0E0)
      ..style = PaintingStyle.fill;

    const double radius = 22;
    const double tailHeight = 20;

    // Bubble body
    Path path = Path();
    path.addRRect(
      RRect.fromLTRBR(
        0,
        0,
        size.width,
        size.height - tailHeight,
        const Radius.circular(radius),
      ),
    );

    // Tail position (moved slightly right)
    double tailStartX = 55; // Moved from 40 to 55
    double tailBaseY = size.height - tailHeight;
    double tailTipX = 35; // Moved from 20 to 35
    double tailTipY = size.height - 5;

    // Start at top-left of tail attachment
    path.moveTo(tailStartX, tailBaseY);

    // LEFT SIDE OF TAIL — Sharp inward curve
    path.cubicTo(
      tailStartX - 8, // Control point 1 (slight left)
      tailBaseY + 4, // Control point 1 (down)
      tailTipX + 2, // Control point 2 (near tip)
      tailTipY - 3, // Control point 2 (above tip)
      tailTipX, // End at tip
      tailTipY,
    );

    // RIGHT SIDE OF TAIL — Gentle curve back
    path.cubicTo(
      tailTipX + 8, // Control point 1 (right of tip)
      tailTipY + 2, // Control point 1 (below tip)
      tailStartX + 5, // Control point 2 (right side)
      tailBaseY + 8, // Control point 2 (lower)
      tailStartX + 15, // End at bottom-right of tail
      tailBaseY,
    );

    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
