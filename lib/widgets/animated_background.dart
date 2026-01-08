import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class AnimatedBackground extends StatelessWidget {
  final Widget child;
  const AnimatedBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Base background
        Container(color: const Color(0xFFf8f9fa)),

        // Abstract blurred shapes for depth
        Positioned(
          top: -100,
          left: -100,
          child: _BlurCircle(
            color: const Color(0xFF695aa6).withOpacity(0.15),
            size: 600,
          ),
        ),
        Positioned(
          top: MediaQuery.of(context).size.height * 0.4,
          right: -50,
          child: _BlurCircle(
            color: Colors.blueAccent.withOpacity(0.1),
            size: 400,
          ),
        ),
        Positioned(
          bottom: -50,
          left: MediaQuery.of(context).size.width * 0.3,
          child: _BlurCircle(
            color: Colors.purpleAccent.withOpacity(0.1),
            size: 500,
          ),
        ),

        // Content
        child,
      ],
    );
  }
}

class _BlurCircle extends StatelessWidget {
  final Color color;
  final double size;

  const _BlurCircle({required this.color, required this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
          width: size,
          height: size,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        )
        .animate(onPlay: (controller) => controller.repeat(reverse: true))
        .scale(
          begin: const Offset(1, 1),
          end: const Offset(1.1, 1.1),
          duration: 2000.ms,
          curve: Curves.easeInOut,
        )
        .moveY(begin: 0, end: 20, duration: 2000.ms, curve: Curves.easeInOut);
  }
}
