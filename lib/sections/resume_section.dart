import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class ResumeSection extends StatelessWidget {
  const ResumeSection({super.key});

  @override
  Widget build(BuildContext context) {
    // Determine screen size for layout
    bool isDesktop = MediaQuery.of(context).size.width > 900;

    // Light theme colors
    final primaryColor = Theme.of(context).primaryColor;
    // final backgroundColor = Colors.grey.shade50; // Removed unused variable
    final cardColor = Colors.white;
    final textColor = Colors.black87;
    final subtleTextColor = Colors.black54;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 20),
      // color: backgroundColor, // Removed to allow parent background to show
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1140),
          child: Column(
            children: [
              // Title
              Text(
                "Download My Resume",
                style: GoogleFonts.balooPaaji2(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: textColor,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                "Comprehensive overview of my academic background in AI & Data Science,\ntechnical skills, and professional development experience.",
                textAlign: TextAlign.center,
                style: GoogleFonts.openSans(
                  color: subtleTextColor,
                  fontSize: 16,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 60),

              // Content Grid
              isDesktop
                  ? IntrinsicHeight(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Expanded(
                            flex: 3,
                            child: _ResumePreviewCard(
                              cardColor: cardColor,
                              primaryColor: primaryColor,
                              textColor: textColor,
                            ),
                          ),
                          const SizedBox(width: 30),
                          Expanded(
                            flex: 2,
                            child: Column(
                              children: [
                                Expanded(
                                  child: _DownloadCard(
                                    cardColor: cardColor,
                                    primaryColor: primaryColor,
                                    textColor: textColor,
                                    subtleTextColor: subtleTextColor,
                                  ),
                                ),
                                const SizedBox(height: 30),
                                Expanded(
                                  child: _ContactCard(
                                    cardColor: cardColor,
                                    primaryColor: primaryColor,
                                    textColor: textColor,
                                    subtleTextColor: subtleTextColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  : Column(
                      children: [
                        SizedBox(
                          height: 500,
                          child: _ResumePreviewCard(
                            cardColor: cardColor,
                            primaryColor: primaryColor,
                            textColor: textColor,
                          ),
                        ), // Fixed height for mobile preview
                        const SizedBox(height: 30),
                        _DownloadCard(
                          cardColor: cardColor,
                          primaryColor: primaryColor,
                          textColor: textColor,
                          subtleTextColor: subtleTextColor,
                        ),
                        const SizedBox(height: 30),
                        _ContactCard(
                          cardColor: cardColor,
                          primaryColor: primaryColor,
                          textColor: textColor,
                          subtleTextColor: subtleTextColor,
                        ),
                      ],
                    ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ResumePreviewCard extends StatelessWidget {
  final Color cardColor;
  final Color primaryColor;
  final Color textColor;

  const _ResumePreviewCard({
    required this.cardColor,
    required this.primaryColor,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.black12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 20,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(Icons.picture_as_pdf, color: primaryColor),
                  const SizedBox(width: 10),
                  Text(
                    "Resume Preview",
                    style: GoogleFonts.balooPaaji2(
                      color: textColor,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              // REMOVED ICON BUTTON HERE
            ],
          ),
          const SizedBox(height: 20),
          Expanded(
            child: Container(
              color: Colors.white,
              width: double.infinity,
              height: double.infinity,
              child: const SingleChildScrollView(
                padding: EdgeInsets.all(15),
                child: _BuiltInResumePreview(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _BuiltInResumePreview extends StatelessWidget {
  const _BuiltInResumePreview();

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Header Section (White underlay)
        Container(
          padding: const EdgeInsets.all(20),
          color: Colors.white,
          child: Column(
            children: [
              Text(
                "ABHISEELAN S",
                style: GoogleFonts.merriweather(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                  color: const Color(0xFF16213e),
                ),
              ),
              const SizedBox(height: 5),
              Text(
                "Flutter Developer | Mobile App Developer",
                style: GoogleFonts.openSans(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: primaryColor,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                "+91 8190892852 | abhiseelan25@gmail.com",
                style: GoogleFonts.openSans(
                  fontSize: 11,
                  color: Colors.grey.shade700,
                ),
              ),
            ],
          ),
        ),

        // Professional Summary (Very Light Purple)
        _buildSection(
          context,
          title: "PROFESSIONAL SUMMARY",
          color: primaryColor.withOpacity(0.04),
          content: Text(
            "Aspiring application and website developer passionate about building responsive, user-centered digital solutions. Skilled in Flutter and MERN stack.",
            style: GoogleFonts.openSans(
              fontSize: 12,
              height: 1.6,
              color: Colors.black87,
            ),
          ),
        ),

        // Education (Light Purple)
        _buildSection(
          context,
          title: "EDUCATION",
          color: primaryColor.withOpacity(0.08),
          content: Column(
            children: [
              _expItem(
                "B.Tech - AI & DS",
                "Excel Engineering College",
                "2022 - 2026",
                "CGPA: 8.5",
              ),
              const SizedBox(height: 10),
              _expItem("HSC", "Vani Vidyalaya", "2022", "83.3%"),
            ],
          ),
        ),

        // Skills (Very Light Purple)
        _buildSection(
          context,
          title: "SKILLS",
          color: primaryColor.withOpacity(0.04),
          content: Text(
            "• Flutter, Dart, Firebase, UI/UX (Figma)\n• Java, Python, C++\n• Web Development (HTML, CSS, JS)",
            style: GoogleFonts.openSans(
              fontSize: 12,
              height: 1.6,
              color: Colors.black87,
            ),
          ),
        ),

        // Internship (Light Purple - Distinct)
        _buildSection(
          context,
          title: "INTERNSHIP",
          color: primaryColor.withOpacity(0.12),
          content: _expItem(
            "Flutter & UI Design Intern",
            "Breakout Zone",
            "2024 - 2025",
            "Built UI components & Prototypes",
          ),
        ),

        // Projects (Very Light Purple)
        _buildSection(
          context,
          title: "PROJECTS",
          color: primaryColor.withOpacity(0.04),
          content: Column(
            children: [
              _expItem(
                "Sign X",
                "Voice-to-Sign App",
                "",
                "Flutter, Python, ML",
              ),
              const SizedBox(height: 10),
              _expItem("Path-X", "Career Guidance", "", "Flutter, Firebase"),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSection(
    BuildContext context, {
    required String title,
    required Widget content,
    required Color color,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
      decoration: BoxDecoration(
        color: color,
        border: Border(
          bottom: BorderSide(
            color: Theme.of(context).primaryColor.withOpacity(0.1),
            width: 1,
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: GoogleFonts.merriweather(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).primaryColor,
              letterSpacing: 1.2,
            ),
          ),
          const SizedBox(height: 12),
          content,
        ],
      ),
    );
  }

  Widget _expItem(String title, String subtitle, String date, String desc) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: GoogleFonts.openSans(
                fontSize: 13,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            if (date.isNotEmpty)
              Text(
                date,
                style: GoogleFonts.openSans(
                  fontSize: 11,
                  color: Colors.grey.shade700,
                  fontWeight: FontWeight.w600,
                ),
              ),
          ],
        ),
        const SizedBox(height: 2),
        RichText(
          text: TextSpan(
            style: GoogleFonts.openSans(fontSize: 12, color: Colors.black87),
            children: [
              TextSpan(
                text: subtitle,
                style: const TextStyle(fontStyle: FontStyle.italic),
              ),
              if (desc.isNotEmpty)
                TextSpan(
                  text: " - $desc",
                  style: const TextStyle(color: Colors.black54),
                ),
            ],
          ),
        ),
      ],
    );
  }
}

class _DownloadCard extends StatelessWidget {
  final Color cardColor;
  final Color primaryColor;
  final Color textColor;
  final Color subtleTextColor;

  const _DownloadCard({
    required this.cardColor,
    required this.primaryColor,
    required this.textColor,
    required this.subtleTextColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(30),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.black12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Icon(FontAwesomeIcons.download, color: primaryColor),
              const SizedBox(width: 10),
              Text(
                "Download Resume",
                style: GoogleFonts.balooPaaji2(
                  color: textColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
          Text(
            "Get the latest version of my professional resume in PDF format.",
            style: TextStyle(color: subtleTextColor),
          ),
          const SizedBox(height: 25),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: () {
                launchUrl(Uri.parse('assets/resume.pdf'));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: primaryColor,
                padding: const EdgeInsets.symmetric(vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              icon: const Icon(Icons.download, color: Colors.white),
              label: const Text(
                "Download PDF",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ContactCard extends StatelessWidget {
  final Color cardColor;
  final Color primaryColor;
  final Color textColor;
  final Color subtleTextColor;

  const _ContactCard({
    required this.cardColor,
    required this.primaryColor,
    required this.textColor,
    required this.subtleTextColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(30),
      decoration: BoxDecoration(
        color: primaryColor.withOpacity(0.05),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: primaryColor.withOpacity(0.2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.handshake, color: primaryColor, size: 40),
          const SizedBox(height: 15),
          Text(
            "Ready to Work Together?",
            style: GoogleFonts.balooPaaji2(
              color: textColor,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            "Let's discuss your next project and bring your ideas to life.",
            textAlign: TextAlign.center,
            style: TextStyle(color: subtleTextColor),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              launchUrl(Uri.parse('mailto:abhiseelan25@gmail.com'));
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: primaryColor,
              side: BorderSide(color: primaryColor),
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            child: const Text(
              "Get In Touch",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
