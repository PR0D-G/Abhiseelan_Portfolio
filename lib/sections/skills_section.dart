import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final skills = [
      {"name": "Flutter", "level": 0.90},
      {"name": "Dart", "level": 0.90},
      {"name": "Firebase", "level": 0.80},
      {"name": "UI/UX (Figma)", "level": 0.85},
      {"name": "State Management", "level": 0.75},
      {"name": "API Integration", "level": 0.80},
      {"name": "Java", "level": 0.70},
      {"name": "XML", "level": 0.70},
    ];

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 20),
      child: Column(
        children: [
          Text(
            "My Expertise",
            style: TextStyle(
              color: Colors.black.withOpacity(0.6),
              fontSize: 16,
            ),
          ).animate().fadeIn(duration: 600.ms).slideY(begin: 0.2, end: 0),
          Text(
                "Skills",
                style: GoogleFonts.balooPaaji2(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor,
                ),
              )
              .animate()
              .fadeIn(delay: 200.ms, duration: 600.ms)
              .slideY(begin: 0.2, end: 0),
          const SizedBox(height: 60),
          Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1000),
              child: Wrap(
                spacing: 40,
                runSpacing: 40,
                alignment: WrapAlignment.center,
                children: skills
                    .map(
                      (skill) => _SkillCircle(
                        name: skill["name"] as String,
                        level: skill["level"] as double,
                      ),
                    )
                    .toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SkillCircle extends StatelessWidget {
  final String name;
  final double level;

  const _SkillCircle({required this.name, required this.level});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 120,
          height: 120,
          child:
              Stack(
                    fit: StackFit.expand,
                    children: [
                      CircularProgressIndicator(
                        value: level,
                        strokeWidth: 8,
                        backgroundColor: Colors.grey.shade200,
                        valueColor: AlwaysStoppedAnimation<Color>(
                          Theme.of(context).primaryColor,
                        ),
                      ),
                      Center(
                        child: Text(
                          "${(level * 100).toInt()}%",
                          style: GoogleFonts.openSans(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  )
                  .animate(onPlay: (controller) => controller.repeat())
                  .shimmer(
                    duration: 2000.ms,
                    color: Colors.white.withOpacity(0.5),
                  )
                  .animate() // Re-wrap to apply entrance animation
                  .fadeIn(duration: 800.ms)
                  .scale(begin: const Offset(0.5, 0.5)),
        ),
        const SizedBox(height: 15),
        Text(
          name,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
      ],
    );
  }
}
