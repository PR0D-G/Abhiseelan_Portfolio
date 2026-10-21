import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TestimonialSection extends StatelessWidget {
  const TestimonialSection({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isDesktop = MediaQuery.of(context).size.width > 768;

    return Container(
      padding: EdgeInsets.symmetric(
        vertical: isDesktop ? 80 : 40,
        horizontal: isDesktop ? 20 : 10,
      ),
      child: Column(
        children: [
          Text(
            "What Think Client About Me ?",
            style: TextStyle(
              color: Colors.black.withOpacity(0.6),
              fontSize: 16,
            ),
          ),
          Text(
            "Testimonial",
            style: GoogleFonts.balooPaaji2(
              fontSize: isDesktop ? 35 : 28,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).primaryColor,
            ),
          ),
          SizedBox(height: isDesktop ? 60 : 35),
          Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1140),
              child: Wrap(
                spacing: 30,
                runSpacing: 30,
                alignment: WrapAlignment.center,
                children: const [
                  _TestimonialCard(
                    imagePath: "assets/images/review.jpeg",
                    text:
                        "I bought an app for my mini project, and it was totally worth the money. Delivered on time and exceeded my expectations. Really satisfied with the quality and support!",
                    name: "Gowri, College Student",
                  ),
                  _TestimonialCard(
                    imagePath: "assets/images/bals.jpg",
                    text:
                        "I asked for a wikipedia for pokemons and it came out really good. The time taken, the design and attention to details everything came out as expected. The back-end for the battle system was incredible, quick response and tweaks really impressed",
                    name: "bals",
                  ),
                  _TestimonialCard(
                    imagePath: "assets/images/profile.jpg",
                    text:
                        "I tried out a demo app developed by him and was genuinely impressed. Even though it was a trial version, the quality, design, and attention to detail stood out. Great work!",
                    name: "Mathan, Private Bank Employee",
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _TestimonialCard extends StatelessWidget {
  final String imagePath;
  final String text;
  final String name;
  const _TestimonialCard({
    required this.imagePath,
    required this.text,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final double cardWidth = math.min(500.0, constraints.maxWidth);
        final bool isCompact = cardWidth < 440;

        return SizedBox(
          width: cardWidth,
          child: isCompact
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(4),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
                      ),
                      child: CircleAvatar(
                        radius: 35,
                        backgroundImage: AssetImage(imagePath),
                      ),
                    ),
                    const SizedBox(height: 12),
                    _buildContent(context, true),
                  ],
                )
              : Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(4),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
                      ),
                      child: CircleAvatar(
                        radius: 40,
                        backgroundImage: AssetImage(imagePath),
                      ),
                    ),
                    const SizedBox(width: 18),
                    Expanded(
                      child: _buildContent(context, false),
                    ),
                  ],
                ),
        );
      },
    );
  }

  Widget _buildContent(BuildContext context, bool centered) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade200),
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment:
            centered ? CrossAxisAlignment.center : CrossAxisAlignment.start,
        children: [
          Text(
            text,
            textAlign: centered ? TextAlign.center : TextAlign.start,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.black87,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 14),
          Text(
            name,
            textAlign: centered ? TextAlign.center : TextAlign.start,
            style: GoogleFonts.balooPaaji2(
              fontSize: 17,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
