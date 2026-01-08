import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDesktop = MediaQuery.of(context).size.width > 800;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 70, horizontal: 20),
      width: double.infinity,
      // color: Colors.white, // Removed extra background layer
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1140),
          child: Column(
            children: [
              isDesktop
                  ? Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(child: Center(child: _buildImage())),
                        const SizedBox(width: 40),
                        Expanded(child: _buildText(context)),
                      ],
                    )
                  : Column(
                      children: [
                        _buildImage(),
                        const SizedBox(height: 40),
                        _buildText(context),
                      ],
                    ),
              const SizedBox(height: 60),
              Wrap(
                spacing: 20,
                runSpacing: 20,
                alignment: WrapAlignment.center,
                children: [
                  _ServiceCard(
                    title: "Flutter App Development",
                    description: "10+ apps",
                    icon: FontAwesomeIcons.mobileScreen,
                  ),
                  _ServiceCard(
                    title: "UI/UX",
                    description:
                        "Created multiple responsive and dynamic designs",
                    icon: FontAwesomeIcons.penNib,
                  ),
                  _ServiceCard(
                    title: "Web Templates Designer",
                    description: "Designed using Figma",
                    icon: FontAwesomeIcons.figma,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildImage() {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 400),
      child: Image.asset(
        'assets/images/man.png',
        fit: BoxFit.contain,
        cacheWidth: 400,
        errorBuilder: (context, error, stackTrace) {
          return const Icon(Icons.person, size: 100, color: Colors.grey);
        },
      ).animate().fadeIn(duration: 800.ms).slideX(begin: -0.2, end: 0),
    );
  }

  Widget _buildText(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Who Am I ?",
          style: TextStyle(color: Colors.black.withOpacity(0.6), fontSize: 16),
        ).animate().fadeIn(duration: 600.ms).slideX(begin: 0.2, end: 0),
        const SizedBox(height: 10),
        Text(
              "About Me",
              style: GoogleFonts.balooPaaji2(
                fontSize: 35,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor,
              ),
            )
            .animate()
            .fadeIn(delay: 200.ms, duration: 600.ms)
            .slideX(begin: 0.2, end: 0),
        const SizedBox(height: 20),
        const Text(
          "I'm Abhiseelan, an aspiring application and website developer passionate about building responsive, user-centered digital solutions.\n\n"
          "Skilled in designing and deploying dynamic apps and websites, integrating backend systems and APIs to create seamless, scalable products.\n"
          "Eager to leverage technology and creativity to drive innovation and business growth in a collaborative environment.",
          style: TextStyle(fontSize: 15, height: 1.6, color: Colors.black87),
        ).animate().fadeIn(delay: 400.ms, duration: 600.ms).slideX(begin: 0.2, end: 0),
      ],
    );
  }
}

class _ServiceCard extends StatefulWidget {
  final String title;
  final String description;
  final IconData icon;

  const _ServiceCard({
    required this.title,
    required this.description,
    required this.icon,
  });

  @override
  State<_ServiceCard> createState() => _ServiceCardState();
}

class _ServiceCardState extends State<_ServiceCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: 300,
        padding: const EdgeInsets.all(25),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).primaryColor.withOpacity(0.1),
              blurRadius: 20,
              offset: const Offset(0, 10),
            ),
          ],
          border: _isHovered
              ? Border.all(color: Theme.of(context).primaryColor, width: 2)
              : Border.all(color: Colors.transparent, width: 2),
        ),
        child: Column(
          children: [
            Icon(widget.icon, size: 40, color: Theme.of(context).primaryColor),
            const SizedBox(height: 15),
            Text(
              widget.title,
              textAlign: TextAlign.center,
              style: GoogleFonts.balooPaaji2(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            AnimatedCrossFade(
              firstChild: const SizedBox(width: double.infinity, height: 0),
              secondChild: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text(
                  widget.description,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.openSans(
                    fontSize: 14,
                    color: Colors.black54,
                  ),
                ),
              ),
              crossFadeState: _isHovered
                  ? CrossFadeState.showSecond
                  : CrossFadeState.showFirst,
              duration: const Duration(milliseconds: 300),
            ),
          ],
        ),
      ),
    );
  }
}
