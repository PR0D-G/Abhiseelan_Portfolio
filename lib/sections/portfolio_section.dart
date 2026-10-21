import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';

class PortfolioSection extends StatelessWidget {
  const PortfolioSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 20),
      child: Column(
        children: [
          Text(
            "What I Did ?",
            style: TextStyle(
              color: Colors.black.withOpacity(0.6),
              fontSize: 16,
            ),
          ).animate().fadeIn(duration: 600.ms).slideY(begin: 0.2, end: 0),
          Text(
                "Projects",
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
              constraints: const BoxConstraints(maxWidth: 1140),
              child: Wrap(
                spacing: 30,
                runSpacing: 30,
                alignment: WrapAlignment.center,
                children: [
                  _PortfolioCard(
                    imagePath: "assets/images/sign language.jpg",
                    title: "Sign X",
                    subtitle:
                        "Voice-to-Sign Language Interpreter\nFlutter | Dart | Firebase | ML",
                    description:
                        "Developed a cross-platform app converting spoken language into sign language visual output. Implemented speech recognition and sequential video playback.",
                  ),
                  _PortfolioCard(
                    imagePath: "assets/images/code1.jpg",
                    title: "Path-X",
                    subtitle:
                        "Career Guidance Application\nFlutter | Dart | Firebase",
                    description:
                        "Career guidance app helping users identify job roles. Provides personalized skill recommendations and course links.",
                  ),
                  _PortfolioCard(
                    imagePath: "assets/images/figma.png",
                    title: "Beyond Barriers",
                    subtitle:
                        "Gamified Language Learning\nFlutter | Dart | Firebase | Figma",
                    description:
                        "Language learning app with game-based approach. Focused on interactive learning and structured levels for engagement.",
                  ),
                ].animate(interval: 200.ms).fade(duration: 600.ms).scale(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _PortfolioCard extends StatefulWidget {
  final String imagePath;
  final String title;
  final String subtitle;
  final String description; // Added description
  const _PortfolioCard({
    required this.imagePath,
    required this.title,
    required this.subtitle,
    required this.description,
  });

  @override
  State<_PortfolioCard> createState() => _PortfolioCardState();
}

class _PortfolioCardState extends State<_PortfolioCard> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: 350,
        height: 380, // Increased height for description
        transform: isHovered
            ? (Matrix4.identity()..translate(0, -10))
            : Matrix4.identity(),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15), // Softer corners
          color: Colors.white,
          boxShadow: isHovered
              ? [
                  BoxShadow(
                    color: Theme.of(context).primaryColor.withOpacity(0.3),
                    blurRadius: 20,
                    spreadRadius: 2,
                  ),
                ]
              : [
                  const BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10,
                    spreadRadius: 2,
                  ),
                ],
        ),
        child: Column(
          // changed from Stack to Column for better layout of text
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(15),
              ),
              child: Image.asset(
                widget.imagePath,
                width: 350,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.title,
                    style: GoogleFonts.balooPaaji2(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    widget.subtitle,
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    widget.description,
                    style: const TextStyle(fontSize: 14, color: Colors.black54),
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
