import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isDesktop = MediaQuery.of(context).size.width > 768;

    final educationColumn = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        _SectionHeader(title: "Education", icon: Icons.school),
        SizedBox(height: 30),
        _TimelineItem(
          year: "2022 - 2026",
          title: "B.Tech - Artificial Intelligence and Data Science",
          subtitle: "Excel Engineering College",
          description: "CGPA: 8.5",
        ),
        _TimelineItem(
          year: "2022",
          title: "HSC",
          subtitle: "Vani Vidyalaya",
          description: "Score: 83.3%",
        ),
        _TimelineItem(
          year: "2020",
          title: "SSLC",
          subtitle: "Vani Vidyalaya",
          description: "Score: 89%",
        ),
      ],
    );

    final internshipColumn = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        _SectionHeader(title: "Internship", icon: Icons.work),
        SizedBox(height: 30),
        _TimelineItem(
          year: "2024 - 2025",
          title: "Flutter & UI Design Intern",
          subtitle: "Breakout Zone",
          description:
              "Developed and refined Flutter UI components using Material Design principles. Designed mobile and web UI prototypes in Figma. Collaborated with cross-functional teams to enhance user experience.",
        ),
      ],
    );

    return Container(
      padding: EdgeInsets.symmetric(
        vertical: isDesktop ? 80 : 40,
        horizontal: isDesktop ? 20 : 10,
      ),
      child: Column(
        children: [
          Text(
            "My Journey",
            style: TextStyle(
              color: Colors.black.withOpacity(0.6),
              fontSize: 16,
            ),
          ).animate().fadeIn(duration: 600.ms).slideY(begin: 0.2, end: 0),
          Text(
                "Education & Experience",
                style: GoogleFonts.balooPaaji2(
                  fontSize: isDesktop ? 35 : 28,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor,
                ),
              )
              .animate()
              .fadeIn(delay: 200.ms, duration: 600.ms)
              .slideY(begin: 0.2, end: 0),
          SizedBox(height: isDesktop ? 60 : 35),
          Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1000),
              child: isDesktop
                  ? Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(child: educationColumn),
                        const SizedBox(width: 40),
                        Expanded(child: internshipColumn),
                      ],
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        educationColumn,
                        const SizedBox(height: 20),
                        internshipColumn,
                      ],
                    ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  final String title;
  final IconData icon;

  const _SectionHeader({required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: Theme.of(context).primaryColor, size: 28),
        const SizedBox(width: 10),
        Text(
          title,
          style: GoogleFonts.balooPaaji2(
            fontSize: 26,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

class _TimelineItem extends StatelessWidget {
  final String year;
  final String title;
  final String subtitle;
  final String description;

  const _TimelineItem({
    required this.year,
    required this.title,
    required this.subtitle,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 30, left: 15),
      padding: const EdgeInsets.only(left: 20, bottom: 20),
      decoration: BoxDecoration(
        border: Border(
          left: BorderSide(
            color: Theme.of(context).primaryColor.withOpacity(0.3),
            width: 2,
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              year,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ).animate().slideX(begin: -0.5, end: 0, duration: 400.ms),
          const SizedBox(height: 10),
          Text(
            title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Text(
            subtitle,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Colors.black54,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            description,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.black87,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}
