import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HeaderSection extends StatefulWidget {
  final VoidCallback? onContactTap;
  const HeaderSection({super.key, this.onContactTap});

  @override
  State<HeaderSection> createState() => _HeaderSectionState();
}

class _HeaderSectionState extends State<HeaderSection>
    with SingleTickerProviderStateMixin {
  late AnimationController _orbitController;
  bool _isButtonHovered = false;

  @override
  void initState() {
    super.initState();
    _orbitController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 20),
    )..repeat();
  }

  @override
  void dispose() {
    _orbitController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isMobile = MediaQuery.of(context).size.width < 900;
    return Container(
      width: double.infinity,
      constraints: BoxConstraints(
        minHeight: MediaQuery.of(context).size.height,
      ),
      child: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.asset(
              'assets/images/header.jpg',
              fit: BoxFit.cover,
              cacheWidth: 2000,
              errorBuilder: (context, error, stackTrace) {
                return Container(color: Colors.white);
              },
            ),
          ),
          // Removed gradient overlay
          // Content
          Center(
            child: Container(
              constraints: const BoxConstraints(minHeight: 700),
              padding: EdgeInsets.symmetric(
                vertical: 80,
                horizontal: isMobile ? 20 : 80,
              ),
              child: isMobile
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buildLeftContent(context, true),
                        const SizedBox(height: 50),
                        _buildRightContent(context),
                      ],
                    )
                  : Row(
                      children: [
                        Expanded(child: _buildLeftContent(context, false)),
                        Expanded(child: _buildRightContent(context)),
                      ],
                    ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLeftContent(BuildContext context, bool centered) {
    bool isMobile = MediaQuery.of(context).size.width < 900;
    return Column(
      crossAxisAlignment: centered
          ? CrossAxisAlignment.center
          : CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Status Pill
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: Colors.green.shade50,
            borderRadius: BorderRadius.circular(30),
            border: Border.all(color: Colors.green.shade200),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 8,
                height: 8,
                decoration: const BoxDecoration(
                  color: Colors.green,
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                "Available for Mobile & Web Development Projects",
                style: TextStyle(
                  color: Colors.green.shade800,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ).animate().fadeIn().slideY(begin: 0.2, end: 0),
        const SizedBox(height: 30),
        // Name
        Text(
          "Abhiseelan",
          textAlign: centered ? TextAlign.center : TextAlign.start,
          style: GoogleFonts.balooPaaji2(
            fontSize: isMobile ? 40 : 60,
            fontWeight: FontWeight.bold,
            height: 1.1,
            color: Colors.black87,
          ),
        ).animate().fadeIn(delay: 200.ms).slideX(begin: -0.1, end: 0),
        // Role
        Text(
          "Flutter Developer",
          textAlign: centered ? TextAlign.center : TextAlign.start,
          style: GoogleFonts.balooPaaji2(
            fontSize: isMobile ? 24 : 32,
            fontWeight: FontWeight.w600,
            color: Theme.of(context).primaryColor,
          ),
        ).animate().fadeIn(delay: 400.ms).slideX(begin: -0.1, end: 0),
        const SizedBox(height: 20),
        // Description
        Text(
          "Passionate developer crafting beautiful mobile and web applications. Specializing in Flutter, React, and Node.js to deliver exceptional user experiences and scalable solutions for businesses worldwide.",
          textAlign: centered ? TextAlign.center : TextAlign.start,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.black54,
            height: 1.6,
          ),
        ).animate().fadeIn(delay: 600.ms),
        const SizedBox(height: 20),
        // Location & Stats
        Row(
          mainAxisAlignment: centered
              ? MainAxisAlignment.center
              : MainAxisAlignment.start,
          children: [
            Icon(
              Icons.location_on_outlined,
              size: 16,
              color: Colors.grey.shade600,
            ),
            const SizedBox(width: 5),
            Text("India", style: TextStyle(color: Colors.grey.shade600)),
            const SizedBox(width: 20),
            Icon(
              FontAwesomeIcons.rocket,
              size: 14,
              color: Colors.grey.shade600,
            ),
            const SizedBox(width: 5),
            Text(
              "10+ Mobile & Web Apps",
              style: TextStyle(color: Colors.grey.shade600),
            ),
          ],
        ).animate().fadeIn(delay: 700.ms),

        const SizedBox(height: 40),
        // Buttons
        Wrap(
          spacing: 15,
          runSpacing: 15,
          alignment: centered ? WrapAlignment.center : WrapAlignment.start,
          children: [
            MouseRegion(
              onEnter: (_) => setState(() => _isButtonHovered = true),
              onExit: (_) => setState(() => _isButtonHovered = false),
              child: AnimatedScale(
                scale: _isButtonHovered ? 1.1 : 1.0,
                duration: const Duration(milliseconds: 200),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    gradient: LinearGradient(
                      colors: [
                        Theme.of(context).primaryColor,
                        Colors.purple.shade300,
                      ],
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Theme.of(context).primaryColor.withOpacity(0.3),
                        blurRadius: 10,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: ElevatedButton(
                    onPressed: widget.onContactTap,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 30,
                        vertical: 18,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Let's Build Something Together",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(width: 8),
                        Icon(
                          Icons.arrow_forward,
                          color: Colors.white,
                          size: 18,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            OutlinedButton(
              onPressed: () {
                launchUrl(Uri.parse('assets/resume.pdf'));
              },
              style: OutlinedButton.styleFrom(
                side: BorderSide(color: Theme.of(context).primaryColor),
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 18,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.visibility_outlined,
                    size: 18,
                    color: Theme.of(context).primaryColor,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    "View Resume",
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ).animate().fadeIn(delay: 800.ms).slideY(begin: 0.2, end: 0),

        const SizedBox(height: 40),
        // Social Icons Row
        Row(
          mainAxisAlignment: centered
              ? MainAxisAlignment.center
              : MainAxisAlignment.start,
          children: [
            _SocialButton(
              icon: FontAwesomeIcons.github,
              url: 'https://github.com/PR0D-G',
            ),
            const SizedBox(width: 15),
            _SocialButton(
              icon: FontAwesomeIcons.linkedinIn,
              url: 'https://linkedin.com/in/abhiseelan',
            ),
            const SizedBox(width: 15),
            _SocialButton(
              icon: FontAwesomeIcons.envelope,
              url: 'mailto:abhiseelan@example.com',
            ),
          ],
        ).animate().fadeIn(delay: 900.ms),
      ],
    );
  }

  Widget _buildRightContent(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final displaySize = math.min(size.width * 0.9, 450.0);

    return Container(
      width: displaySize,
      height: displaySize,
      child: FittedBox(
        fit: BoxFit.contain,
        child: SizedBox(
          // Fixed height for the orbit/stack internal layout
          height: 450,
          width: 450,
          child: Stack(
            alignment: Alignment.center,
            children: [
              // Main Profile Image
              Container(
                width: 280,
                height: 280,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  border: Border.all(color: Colors.white, width: 5),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 20,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
                child: ClipObjectId(
                  child: Image.asset(
                    'assets/images/prod.png',
                    fit: BoxFit.cover,
                    cacheWidth: 400,
                    errorBuilder: (c, e, s) => Image.asset(
                      'assets/images/man.png',
                      fit: BoxFit.cover,
                      cacheWidth: 400,
                    ),
                  ),
                ),
              ),

              // Orbiting Icons
              AnimatedBuilder(
                animation: _orbitController,
                builder: (context, child) {
                  return Stack(
                    alignment: Alignment.center,
                    children: _buildOrbitingIcons(200), // Radius of orbit
                  );
                },
              ),
            ],
          ),
        ),
      ),
    ).animate().fadeIn(delay: 500.ms).scale();
  }

  List<Widget> _buildOrbitingIcons(double radius) {
    final icons = [
      'assets/images/flutter_logo.png',
      'assets/images/firebase_logo.png',
      'assets/images/java_logo.png',
      'assets/images/mongodb_logo.png',
      'assets/images/figma.png',
    ];

    return List.generate(icons.length, (index) {
      final double angle =
          (2 * math.pi * index) / icons.length +
          (_orbitController.value * 2 * math.pi);

      return Transform.translate(
        offset: Offset(radius * math.cos(angle), radius * math.sin(angle)),
        child: Container(
          width: 50,
          height: 50,
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 10,
                spreadRadius: 2,
              ),
            ],
          ),
          child: Image.asset(icons[index], cacheWidth: 100),
        ),
      );
    });
  }
}

class ClipObjectId extends StatelessWidget {
  final Widget child;
  const ClipObjectId({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return ClipOval(child: child);
  }
}

class _SocialButton extends StatelessWidget {
  final IconData icon;
  final String url;

  const _SocialButton({required this.icon, required this.url});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => launchUrl(Uri.parse(url)),
      borderRadius: BorderRadius.circular(50),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300),
          shape: BoxShape.circle,
          color: Colors.white,
        ),
        child: Icon(icon, size: 20, color: Colors.grey.shade700),
      ),
    );
  }
}
