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
      padding: EdgeInsets.symmetric(
        vertical: isDesktop ? 80 : 40,
        horizontal: isDesktop ? 20 : 10,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1140),
          child: Column(
            children: [
              // Title
              Text(
                "Download My Resume",
                textAlign: TextAlign.center,
                style: GoogleFonts.balooPaaji2(
                  fontSize: isDesktop ? 40 : 28,
                  fontWeight: FontWeight.bold,
                  color: textColor,
                ),
              ),
              const SizedBox(height: 15),
              Text(
                "Comprehensive overview of my academic background in AI & Data Science,\ntechnical skills, and professional development experience.",
                textAlign: TextAlign.center,
                style: GoogleFonts.openSans(
                  color: subtleTextColor,
                  fontSize: isDesktop ? 16 : 14,
                  height: 1.5,
                ),
              ),
              SizedBox(height: isDesktop ? 60 : 35),

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
        // Header Section
        Container(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "ABHISEELAN SUBRAMANIYAM",
                textAlign: TextAlign.center,
                style: GoogleFonts.merriweather(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  letterSpacing: 0.5,
                  color: const Color(0xFF16213e),
                ),
              ),
              const SizedBox(height: 6),
              Text(
                "Salem, Tamil Nadu, India  |  +91 8190892852  |  abhiseelan25@gmail.com",
                textAlign: TextAlign.center,
                style: GoogleFonts.openSans(
                  fontSize: 11,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey.shade800,
                ),
              ),
              const SizedBox(height: 4),
              Wrap(
                alignment: WrapAlignment.center,
                spacing: 12,
                runSpacing: 4,
                children: [
                  _headerLink("LinkedIn", "https://linkedin.com/in/abhiseelan-subramaniyam", primaryColor),
                  _headerLink("GitHub", "https://github.com/PR0D-G", primaryColor),
                  _headerLink("Portfolio", "https://pr0d-g.github.io/Abhiseelan_Portfolio/", primaryColor),
                ],
              ),
            ],
          ),
        ),

        // Professional Summary
        _buildSection(
          context,
          title: "SUMMARY",
          color: primaryColor.withOpacity(0.04),
          content: Text(
            "Motivated Flutter Developer with practical experience gained through coursework, internships, and hands-on projects building cross-platform mobile applications for Android and iOS using Flutter and Dart. Proficient in building responsive UI components, integrating REST APIs, and managing application state using Provider. Skilled in leveraging Firebase services and native Android integration (Java). Strong foundation in version control using Git and GitHub, clean coding practices, and problem-solving. Seeking an opportunity to deliver clean, scalable, and maintainable mobile code.",
            style: GoogleFonts.openSans(
              fontSize: 11.5,
              height: 1.55,
              color: Colors.black87,
            ),
          ),
        ),

        // Skills
        _buildSection(
          context,
          title: "SKILLS",
          color: primaryColor.withOpacity(0.08),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _skillRow("Languages", "Dart, Java (Native Android)"),
              _skillRow("Frameworks & SDKs", "Flutter SDK"),
              _skillRow("State Management & Arch", "Provider, Clean Architecture principles"),
              _skillRow("Backend & Integration", "REST APIs, Firebase (Auth, Firestore), JSON Integration"),
              _skillRow("Tools & Version Control", "Git, GitHub, VS Code, Android Studio, Flutter DevTools"),
            ],
          ),
        ),

        // Experience & Projects
        _buildSection(
          context,
          title: "EXPERIENCE & PROJECTS",
          color: primaryColor.withOpacity(0.04),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _projectItem(
                title: "Path-X",
                role: "AI-Powered Career Guidance Application",
                date: "Aug 2025 – Present",
                bullets: [
                  "Designed and developed responsive, reusable UI screens across Android and iOS using Flutter and Dart.",
                  "Integrated REST APIs to display real-time career guidance data and handled loading states and error handling efficiently.",
                  "Utilized Provider for global state management to handle smooth navigation and data flow across screens.",
                ],
              ),
              const Divider(height: 24, thickness: 0.5),
              _projectItem(
                title: "Meta Dex",
                role: "Pokémon Battle Simulator & Pokédex Platform",
                date: "Jan 2025 – May 2025",
                bullets: [
                  "Developed an automated battle simulation engine capable of simulating 100 battle iterations to calculate matchup win rates and outcome analytics.",
                  "Integrated an interactive Pokédex lookup with stat analysis, move-set evaluations, and type advantages to assist players in competitive strategy.",
                ],
              ),
              const Divider(height: 24, thickness: 0.5),
              _projectItem(
                title: "Streak Mate",
                role: "Habit & Productivity Tracking Application",
                date: "Jul 2024 – Dec 2024",
                bullets: [
                  "Integrated Firebase Authentication and Cloud Firestore for secure user accounts and database storage.",
                  "Managed code quality and team collaboration using Git and GitHub branch management, pull requests, and code reviews.",
                  "Prepared, debugged, and tested the application for deployment on the Google Play Store.",
                ],
              ),
              const Divider(height: 24, thickness: 0.5),
              _projectItem(
                title: "Tamilcraft.in",
                role: "Minecraft SMP Creator Platform",
                date: "Feb 2024 – Jun 2024",
                bullets: [
                  "Designed and deployed a responsive web platform dedicated to a Minecraft SMP content creator, enhancing community engagement and information sharing.",
                  "Streamlined server updates, announcements, and user navigation through modern web performance practices.",
                ],
              ),
            ],
          ),
        ),

        // Education
        _buildSection(
          context,
          title: "EDUCATION",
          color: primaryColor.withOpacity(0.08),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _eduItem(
                degree: "Bachelor of Technology – Artificial Intelligence and Data Science",
                institution: "Excel Engineering College",
                date: "Sep 2022 – May 2026",
                score: "CGPA: 8.5",
              ),
              const SizedBox(height: 12),
              _eduItem(
                degree: "Higher Secondary Certificate (HSC) & SSLC",
                institution: "Vani Vidyalaya",
                date: "Jun 2020 – Apr 2022",
                score: "HSC: 83.3%  |  SSLC: 89%",
              ),
            ],
          ),
        ),

        // Certifications
        _buildSection(
          context,
          title: "CERTIFICATIONS",
          color: primaryColor.withOpacity(0.04),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _certItem(
                "Introduction to Flutter & Dart Programming (Certification)",
                "Udemy",
                "Jan 2024",
              ),
              const SizedBox(height: 8),
              _certItem(
                "Application Development",
                "Breakout Zone",
                "Nov 2023",
              ),
              const SizedBox(height: 8),
              _certItem(
                "Android Application Development",
                "Great Learning",
                "Oct 2023",
              ),
            ],
          ),
        ),
      ],
    );
  }

  static Widget _headerLink(String title, String url, Color primaryColor) {
    return InkWell(
      onTap: () => launchUrl(Uri.parse(url)),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.bold,
          color: primaryColor,
          decoration: TextDecoration.underline,
        ),
      ),
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
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
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
              fontSize: 13,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).primaryColor,
              letterSpacing: 1.1,
            ),
          ),
          const SizedBox(height: 10),
          content,
        ],
      ),
    );
  }

  Widget _skillRow(String category, String skills) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: RichText(
        text: TextSpan(
          style: GoogleFonts.openSans(fontSize: 11.5, color: Colors.black87),
          children: [
            TextSpan(
              text: "• $category: ",
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            TextSpan(
              text: skills,
              style: const TextStyle(color: Colors.black87),
            ),
          ],
        ),
      ),
    );
  }

  Widget _projectItem({
    required String title,
    required String role,
    required String date,
    required List<String> bullets,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: RichText(
                text: TextSpan(
                  style: GoogleFonts.openSans(fontSize: 12, color: Colors.black87),
                  children: [
                    TextSpan(
                      text: title,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text: " – $role",
                      style: TextStyle(color: Colors.grey.shade700, fontStyle: FontStyle.italic),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 8),
            Text(
              date,
              style: GoogleFonts.openSans(
                fontSize: 10.5,
                color: Colors.grey.shade600,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        const SizedBox(height: 6),
        ...bullets.map((b) => Padding(
          padding: const EdgeInsets.only(left: 8, bottom: 4),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("• ", style: TextStyle(fontSize: 11, color: Colors.black54)),
              Expanded(
                child: Text(
                  b,
                  style: GoogleFonts.openSans(
                    fontSize: 11,
                    height: 1.45,
                    color: Colors.black87,
                  ),
                ),
              ),
            ],
          ),
        )),
      ],
    );
  }

  Widget _eduItem({
    required String degree,
    required String institution,
    required String date,
    required String score,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                degree,
                style: GoogleFonts.openSans(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ),
            const SizedBox(width: 8),
            Text(
              date,
              style: GoogleFonts.openSans(
                fontSize: 10.5,
                color: Colors.grey.shade600,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        const SizedBox(height: 2),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              institution,
              style: GoogleFonts.openSans(
                fontSize: 11.5,
                fontStyle: FontStyle.italic,
                color: Colors.black54,
              ),
            ),
            Text(
              score,
              style: GoogleFonts.openSans(
                fontSize: 11,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _certItem(String name, String org, String date) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: RichText(
            text: TextSpan(
              style: GoogleFonts.openSans(fontSize: 11.5, color: Colors.black87),
              children: [
                const TextSpan(text: "• "),
                TextSpan(
                  text: name,
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
                TextSpan(
                  text: " – $org",
                  style: TextStyle(color: Colors.grey.shade600, fontStyle: FontStyle.italic),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(width: 8),
        Text(
          date,
          style: GoogleFonts.openSans(
            fontSize: 10.5,
            color: Colors.grey.shade600,
            fontWeight: FontWeight.w600,
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
    final bool isMobile = MediaQuery.of(context).size.width < 768;

    return Container(
      padding: EdgeInsets.all(isMobile ? 20 : 30),
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
    final bool isMobile = MediaQuery.of(context).size.width < 768;

    return Container(
      padding: EdgeInsets.all(isMobile ? 20 : 30),
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
