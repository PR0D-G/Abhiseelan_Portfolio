import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class ShowcaseSection extends StatelessWidget {
  const ShowcaseSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "My",
                style: GoogleFonts.balooPaaji2(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.purple,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                "Showcase",
                style: GoogleFonts.balooPaaji2(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ],
          ).animate().fadeIn(duration: 600.ms).slideY(begin: 0.2, end: 0),
          const SizedBox(height: 10),
          Container(
            width: 60,
            height: 4,
            decoration: BoxDecoration(
              color: Colors.purple,
              borderRadius: BorderRadius.circular(2),
            ),
          ).animate().scaleX(
            begin: 0,
            end: 1,
            duration: 600.ms,
            curve: Curves.easeOut,
          ),
          const SizedBox(height: 50),
          const _ShowcaseTabs(),
        ],
      ),
    );
  }
}

class _ShowcaseTabs extends StatefulWidget {
  const _ShowcaseTabs();

  @override
  State<_ShowcaseTabs> createState() => _ShowcaseTabsState();
}

class _ShowcaseTabsState extends State<_ShowcaseTabs> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Container(
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(30),
            ),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _buildTabButton("Projects", 0),
                  const SizedBox(width: 5),
                  _buildTabButton("Certifications", 1),
                  const SizedBox(width: 5),
                  _buildTabButton("Tech Stack", 2),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(height: 40),
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          child: KeyedSubtree(
            key: ValueKey<int>(_selectedIndex),
            child: _buildContent(),
          ),
        ),
      ],
    );
  }

  Widget _buildContent() {
    switch (_selectedIndex) {
      case 0:
        return _ProjectsTab();
      case 1:
        return _CertificationsTab();
      case 2:
        return _SkillsTab();
      default:
        return const SizedBox.shrink();
    }
  }

  Widget _buildTabButton(String text, int index) {
    final bool isSelected = _selectedIndex == index;
    return InkWell(
      onTap: () => setState(() => _selectedIndex = index),
      borderRadius: BorderRadius.circular(25),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
        decoration: BoxDecoration(
          color: isSelected ? Colors.purple : Colors.transparent,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Text(
          text,
          style: GoogleFonts.balooPaaji2(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: isSelected ? Colors.white : Colors.grey.shade600,
          ),
        ),
      ),
    );
  }
}

class _ProjectsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Mapping safe assets since project_preview does not exist
    final projects = [
      _ProjectModel(
        title: "PathX",
        subtitle: "Career Recommendation",
        description:
            "AI-driven career discovery using skill-based profiling and interest mapping with heatmaps.",
        tags: ["AI", "Recommendation"],
        imagePath: "assets/project_preview/path_x.png",
        link: "https://github.com/PR0D-G/Path-X",
      ),
      _ProjectModel(
        title: "SignX",
        subtitle: "Sign Language Translator",
        description:
            "AI-powered speech-to-sign language translator enabling inclusive communication.",
        tags: ["AI", "Accessibility"],
        imagePath: "assets/project_preview/sign_X.png",
        link: "https://github.com/PR0D-G/Sign_x",
      ),
      _ProjectModel(
        title: "MetaDex",
        subtitle: "Pokémon Battle Analytics",
        description:
            "A feature-rich Pokémon analytics platform combining a Pokédex, stat breakdowns, and battle simulator.",
        tags: ["UI/UX", "Game Logic"],
        imagePath: "assets/project_preview/meta_dex.png",
        link: "https://github.com/PR0D-G/metadex",
      ),
      _ProjectModel(
        title: "StreakMate",
        subtitle: "Habit Tracker",
        description:
            "Minimal habit tracker to build consistency through streaks and visual analytics.",
        tags: ["Productivity", "Mobile"],
        imagePath: "assets/project_preview/streak_mate.png",
        link: "https://github.com/PR0D-G/streak_mate",
      ),
      _ProjectModel(
        title: "Beyond Barriers",
        subtitle: "Language Learning",
        description:
            "Interactive interface to break communication barriers with progress tracking and audio assistance.",
        tags: ["EdTech", "Accessibility"],
        imagePath: "assets/project_preview/beyond_barriers.png",
        link: "https://github.com/PR0D-G/beyond_barriers",
      ),
    ];

    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1200),
        child: Wrap(
          spacing: 30,
          runSpacing: 30,
          alignment: WrapAlignment.center,
          children: projects
              .map((p) => _NewProjectCard(project: p))
              .toList()
              .animate(interval: 100.ms)
              .fadeIn()
              .slideY(begin: 0.1, end: 0),
        ),
      ),
    );
  }
}

class _ProjectModel {
  final String title;
  final String subtitle;
  final String description;
  final List<String> tags;
  final String imagePath;
  final String link;

  _ProjectModel({
    required this.title,
    required this.subtitle,
    required this.description,
    required this.tags,
    required this.imagePath,
    required this.link,
  });
}

class _NewProjectCard extends StatefulWidget {
  final _ProjectModel project;

  const _NewProjectCard({required this.project});

  @override
  State<_NewProjectCard> createState() => _NewProjectCardState();
}

class _NewProjectCardState extends State<_NewProjectCard> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: 350,
        decoration: BoxDecoration(
          color: Colors.white, // Light background
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: isHovered
                  ? Theme.of(context).primaryColor.withOpacity(0.15)
                  : Colors.black.withOpacity(0.05),
              blurRadius: 20,
              offset: const Offset(0, 10),
            ),
          ],
          border: isHovered
              ? Border.all(color: Theme.of(context).primaryColor, width: 1.5)
              : Border.all(color: Colors.grey.shade200, width: 1),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image Section
            ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(16),
              ),
              child: SizedBox(
                height: 180,
                width: double.infinity,
                child: Image.asset(
                  widget.project.imagePath,
                  fit: BoxFit.fill,
                  cacheWidth: 400,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      color: Colors.grey.shade100,
                      child: const Center(
                        child: Icon(Icons.image, color: Colors.grey, size: 40),
                      ),
                    );
                  },
                ),
              ),
            ),

            // Content Section
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.project.title,
                    style: GoogleFonts.balooPaaji2(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    widget.project.subtitle,
                    style: TextStyle(
                      fontSize: 12,
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    widget.project.description,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 13,
                      color: Colors.black54,
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Tags
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: widget.project.tags.map((tag) {
                      return Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 5,
                        ),
                        decoration: BoxDecoration(
                          color: Theme.of(
                            context,
                          ).primaryColor.withOpacity(0.05),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: Theme.of(
                              context,
                            ).primaryColor.withOpacity(0.2),
                          ),
                        ),
                        child: Text(
                          tag,
                          style: TextStyle(
                            fontSize: 11,
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      );
                    }).toList(),
                  ),

                  const SizedBox(height: 25),

                  // Buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () =>
                              launchUrl(Uri.parse(widget.project.link)),
                          style: OutlinedButton.styleFrom(
                            side: BorderSide(
                              color: Theme.of(context).primaryColor,
                            ),
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: Text(
                            "View Details",
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 15),
                      IconButton(
                        onPressed: () =>
                            launchUrl(Uri.parse(widget.project.link)),
                        icon: const Icon(
                          FontAwesomeIcons.github,
                          color: Colors.black54,
                          size: 20,
                        ),
                        tooltip: "GitHub Repo",
                      ),
                    ],
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

class _CertificationsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final certs = [
      {
        "title": "Flutter Development",
        "org": "Udemy",
        "date": "2023",
        "path": "assets/certificates/lutter udamey.png",
        "isPdf": false,
        "type": "Course",
      },
      {
        "title": "Dart Programming",
        "org": "Udemy",
        "date": "2023",
        "path": "assets/certificates/dart udamey.png",
        "isPdf": false,
        "type": "Course",
      },
      {
        "title": "MERN Internship",
        "org": "Breakout Zone",
        "date": "2024",
        "path": "assets/certificates/breakout.png",
        "isPdf": false,
        "type": "Internship",
      },
      {
        "title": "MongoDB Java Developer",
        "org": "MongoDB University",
        "date": "2024",
        "path": "assets/certificates/Mongodb java developer path.png",
        "isPdf": false,
        "type": "Certification",
      },
      {
        "title": "MongoDB",
        "org": "Guvi",
        "date": "2023",
        "path":
            "assets/certificates/GuviCertification Excel mastering mongodb -.png",
        "isPdf": false,
        "type": "Certification",
      },
      {
        "title": "Payoda Hackathon",
        "org": "Payoda",
        "date": "2023",
        "path": "assets/certificates/Hackathon.jpeg",
        "isPdf": false,
        "type": "Hackathon",
      },
      {
        "title": "REST API Intermediate",
        "org": "HackerRank",
        "date": "2023",
        "path": "assets/certificates/rest APi hacker rank.png",
        "isPdf": false,
        "type": "Certification",
      },
      {
        "title": "Java Programming",
        "org": "Great Learning",
        "date": "2023",
        "path": "assets/certificates/Great learning java.png",
        "isPdf": false,
        "type": "Course",
      },
      {
        "title": "Python Programming",
        "org": "Guvi",
        "date": "2023",
        "path": "assets/certificates/GuviCertification - Python.png",
        "isPdf": false,
        "type": "Course",
      },
      {
        "title": "Cisco Cybersecurity",
        "org": "Cisco",
        "date": "2023",
        "path": "assets/certificates/Introduction to cybersecurity cisco.jpeg",
        "isPdf": false,
        "type": "Certification",
      },
      {
        "title": "Cisco IoT",
        "org": "Cisco",
        "date": "2023",
        "path": "assets/certificates/Introduction to IoT and Digital Cisco.png",
        "isPdf": false,
        "type": "Certification",
      },
    ];

    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1000),
        child: Wrap(
          spacing: 30,
          runSpacing: 30,
          alignment: WrapAlignment.center,
          children: certs
              .map(
                (c) => _CertificateCard(
                  title: c['title'] as String,
                  org: c['org'] as String,
                  date: c['date'] as String,
                  assetPath: c['path'] as String,
                  isPdf: c['isPdf'] as bool,
                  type: c['type'] as String,
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}

class _SkillsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1000),
        child: SingleChildScrollView(
          child: Column(
            children: [
              _TechCategory(
                title: "Front End",
                items: [
                  _TechItem(
                    "XML",
                    null,
                    assetPath: "assets/images/xml_logo.png",
                    isAsset: true,
                  ),
                  _TechItem(
                    "Figma",
                    null,
                    assetPath: "assets/images/figma.png",
                    isAsset: true,
                  ),
                  _TechItem(
                    "Flutter",
                    null,
                    assetPath: "assets/images/flutter_logo.png",
                    isAsset: true,
                  ),
                ],
              ),
              const SizedBox(height: 30),
              _TechCategory(
                title: "Backend",
                items: [
                  _TechItem(
                    "REST API",
                    null,
                    assetPath: "assets/images/api_logo.png",
                    isAsset: true,
                  ),
                  _TechItem(
                    "Java",
                    null,
                    assetPath: "assets/images/java_logo.png",
                    isAsset: true,
                  ),
                  _TechItem(
                    "Firebase",
                    null,
                    assetPath: "assets/images/firebase_logo.png",
                    isAsset: true,
                  ),
                  _TechItem(
                    "Supabase",
                    null,
                    assetPath: "assets/images/supabase_logo.png",
                    isAsset: true,
                  ),
                ],
              ),
              const SizedBox(height: 30),
              _TechCategory(
                title: "Database",
                items: [
                  _TechItem(
                    "MongoDB",
                    null,
                    assetPath: "assets/images/mongodb_logo.png",
                    isAsset: true,
                  ),
                  _TechItem(
                    "Firebase",
                    null,
                    assetPath: "assets/images/firebase_logo.png",
                    isAsset: true,
                  ),
                  _TechItem(
                    "Supabase",
                    null,
                    assetPath: "assets/images/supabase_logo.png",
                    isAsset: true,
                  ),
                  _TechItem(
                    "Postman",
                    null,
                    assetPath: "assets/images/postman_logo.png",
                    isAsset: true,
                  ),
                ],
              ),
            ].animate(interval: 100.ms).fade().slideY(begin: 0.1, end: 0),
          ),
        ),
      ),
    );
  }
}

// --- HELPER CLASSES ---

class _TechCategory extends StatelessWidget {
  final String title;
  final List<_TechItem> items;

  const _TechCategory({required this.title, required this.items});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title,
          style: GoogleFonts.balooPaaji2(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).primaryColor,
          ),
        ),
        const SizedBox(height: 15),
        Wrap(
          spacing: 20,
          runSpacing: 20,
          alignment: WrapAlignment.center,
          children: items.map((item) => _TechStackCard(item: item)).toList(),
        ),
      ],
    );
  }
}

class _TechItem {
  final String name;
  final IconData? icon;
  final String? assetPath;
  final bool isAsset;

  _TechItem(this.name, this.icon, {this.assetPath, required this.isAsset});
}

class _TechStackCard extends StatefulWidget {
  final _TechItem item;
  const _TechStackCard({required this.item});

  @override
  State<_TechStackCard> createState() => _TechStackCardState();
}

class _TechStackCardState extends State<_TechStackCard> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: 160,
        height: 100,
        transform: isHovered
            ? (Matrix4.identity()..translate(0, -5))
            : Matrix4.identity(),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isHovered
                ? Theme.of(context).primaryColor
                : Colors.grey.shade200,
            width: 2,
          ),
          boxShadow: [
            BoxShadow(
              color: isHovered
                  ? Theme.of(context).primaryColor.withOpacity(0.2)
                  : Colors.black.withOpacity(0.05),
              blurRadius: 15,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            widget.item.isAsset
                ? Image.asset(
                    widget.item.assetPath!,
                    width: 40,
                    height: 40,
                    cacheWidth: 100,
                    fit: BoxFit.contain,
                  )
                : Icon(
                    widget.item.icon,
                    size: 36,
                    color: Theme.of(context).primaryColor,
                  ),
            const SizedBox(height: 10),
            Text(
              widget.item.name,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 13,
                color: Colors.grey.shade800,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CertificateCard extends StatefulWidget {
  final String title;
  final String org;
  final String date;
  final String assetPath;
  final bool isPdf;
  final String type;

  const _CertificateCard({
    required this.title,
    required this.org,
    required this.date,
    required this.assetPath,
    required this.isPdf,
    required this.type,
  });

  @override
  State<_CertificateCard> createState() => _CertificateCardState();
}

class _CertificateCardState extends State<_CertificateCard> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: 300,
        height: 250,
        transform: isHovered
            ? (Matrix4.identity()..translate(0, -5))
            : Matrix4.identity(),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: isHovered
                  ? Theme.of(context).primaryColor.withOpacity(0.15)
                  : Colors.black.withOpacity(0.05),
              blurRadius: 15,
              offset: const Offset(0, 10),
            ),
          ],
          border: isHovered
              ? Border.all(
                  color: Theme.of(context).primaryColor.withOpacity(0.5),
                )
              : Border.all(color: Colors.grey.shade200),
        ),
        child: Column(
          children: [
            // Preview / Type Badge
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(15),
                  ),
                  child: SizedBox(
                    height: 140,
                    width: double.infinity,
                    child: widget.isPdf
                        ? _GenerativeCertificatePreview(
                            title: widget.title,
                            org: widget.org,
                          )
                        : Image.asset(
                            widget.assetPath,
                            fit: BoxFit.cover,
                            cacheWidth: 400,
                            errorBuilder: (c, e, s) => const Center(
                              child: Icon(
                                Icons.broken_image,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                  ),
                ),
                Positioned(
                  top: 10,
                  left: 10,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor.withOpacity(0.9),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      widget.type,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),

            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.title,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.balooPaaji2(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          widget.org,
                          style: TextStyle(
                            fontSize: 12,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const Icon(
                              Icons.calendar_today,
                              size: 12,
                              color: Colors.grey,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              widget.date,
                              style: const TextStyle(
                                fontSize: 11,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                        InkWell(
                          onTap: () {
                            if (widget.isPdf) {
                              launchUrl(Uri.parse(widget.assetPath));
                            } else {
                              showDialog(
                                context: context,
                                builder: (context) => Dialog(
                                  backgroundColor: Colors.transparent,
                                  child: InteractiveViewer(
                                    child: Image.asset(widget.assetPath),
                                  ),
                                ),
                              );
                            }
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 5,
                            ),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey.shade300),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.open_in_new,
                                  size: 10,
                                  color: Colors.grey.shade700,
                                ),
                                const SizedBox(width: 5),
                                Text(
                                  "Click to View",
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: Colors.grey.shade700,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _GenerativeCertificatePreview extends StatelessWidget {
  final String title;
  final String org;

  const _GenerativeCertificatePreview({required this.title, required this.org});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: const Color(0xFFFAF9F6), // Off-white paper color
        border: Border.all(
          color: const Color(0xFFD4AF37),
          width: 2,
        ), // Gold border
        borderRadius: BorderRadius.circular(4),
      ),
      child: Stack(
        children: [
          // Background Pattern (Subtle)
          Positioned.fill(
            child: Opacity(
              opacity: 0.05,
              child: Center(
                child: Icon(
                  FontAwesomeIcons.certificate,
                  size: 80,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          // Content
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "CERTIFICATE",
                  style: GoogleFonts.cinzel(
                    fontSize: 8,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2,
                    color: Colors.black54,
                  ),
                ),
                const Text(
                  "OF COMPLETION",
                  style: TextStyle(
                    fontSize: 5,
                    letterSpacing: 1,
                    color: Colors.black45,
                  ),
                ),
                const SizedBox(height: 5),
                const Divider(
                  color: Color(0xFFD4AF37),
                  thickness: 0.5,
                  indent: 20,
                  endIndent: 20,
                ),
                const SizedBox(height: 2),
                Text(
                  title,
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.greatVibes(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 2),
                const Divider(
                  color: Color(0xFFD4AF37),
                  thickness: 0.5,
                  indent: 20,
                  endIndent: 20,
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(height: 1, width: 20, color: Colors.black26),
                        const SizedBox(height: 1),
                        const Text(
                          "Signature",
                          style: TextStyle(fontSize: 4, color: Colors.black45),
                        ),
                      ],
                    ),
                    Icon(
                      FontAwesomeIcons.award,
                      size: 12,
                      color: const Color(0xFFD4AF37),
                    ),
                  ],
                ),
              ],
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
  final String description;
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
        width: 320,
        height: 350,
        transform: isHovered
            ? (Matrix4.identity()..translate(0, -10))
            : Matrix4.identity(),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white.withOpacity(0.9),
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(15),
              ),
              child: Image.asset(
                widget.imagePath,
                width: 320,
                height: 180,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.title,
                    style: GoogleFonts.balooPaaji2(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    widget.subtitle,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    widget.description,
                    style: const TextStyle(fontSize: 13, color: Colors.black54),
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
