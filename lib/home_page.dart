import 'package:flutter/material.dart';
import 'widgets/navbar.dart';

import 'sections/header_section.dart';
import 'sections/about_section.dart';
import 'sections/showcase_section.dart';
import 'sections/experience_section.dart';
import 'sections/testimonial_section.dart';
import 'sections/resume_section.dart';
import 'sections/contact_section.dart';
import 'sections/footer_section.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();
  bool _isScrolled = false;

  final GlobalKey homeKey = GlobalKey();
  final GlobalKey aboutKey = GlobalKey();
  final GlobalKey portfolioKey = GlobalKey();
  final GlobalKey testimonialKey = GlobalKey();
  final GlobalKey educationKey = GlobalKey();
  final GlobalKey contactKey = GlobalKey();

  String _activeSection = "Home";

  int _lastCheckTime = 0;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      final isScrolled = _scrollController.offset > 50;
      if (isScrolled != _isScrolled) {
        setState(() => _isScrolled = isScrolled);
      }

      final now = DateTime.now().millisecondsSinceEpoch;
      if (now - _lastCheckTime > 200) {
        _lastCheckTime = now;
        _checkActiveSection();
      }
    });
  }

  void _checkActiveSection() {
    final sections = {
      'Home': homeKey,
      'About': aboutKey,
      'Portfolio': portfolioKey,
      'Education': educationKey,
      'Testimonial': testimonialKey,
      'Contact': contactKey,
    };

    String newActive = _activeSection;
    double minDistance = double.infinity;

    for (var entry in sections.entries) {
      final key = entry.value;
      if (key.currentContext == null) continue;

      final RenderBox box = key.currentContext!.findRenderObject() as RenderBox;
      final Offset position = box.localToGlobal(Offset.zero);

      final double distance = (position.dy - 100).abs();

      if (distance < minDistance) {
        minDistance = distance;
        newActive = entry.key;
      }
    }

    if (newActive != _activeSection) {
      setState(() => _activeSection = newActive);
    }
  }

  void scrollToSection(GlobalKey key) {
    if (key.currentContext != null) {
      Scrollable.ensureVisible(
        key.currentContext!,
        duration: const Duration(milliseconds: 700),
        curve: Curves.easeInOut,
      );
    }
  }

  void _navigateFromDrawer(GlobalKey key) {
    Navigator.of(context).pop();
    Future.delayed(const Duration(milliseconds: 250), () {
      scrollToSection(key);
    });
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final bool isMobile = screenWidth < 768;
    final double outerPadding = isMobile ? 8.0 : (screenWidth < 1100 ? 16.0 : 24.0);

    return Scaffold(
      endDrawer: _buildMobileDrawer(context),
      body: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Stack(
          children: [
            SingleChildScrollView(
              controller: _scrollController,
              child: Column(
                children: [
                  HeaderSection(
                    key: homeKey,
                    onContactTap: () => scrollToSection(contactKey),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: outerPadding),
                    child: Column(
                      children: [
                        _SectionContainer(child: AboutSection(key: aboutKey)),
                        const SizedBox(height: 30),
                        _SectionContainer(
                          child: ShowcaseSection(key: portfolioKey),
                        ),
                        const SizedBox(height: 30),
                        _SectionContainer(
                          child: ExperienceSection(key: educationKey),
                        ),
                        const SizedBox(height: 30),
                        _SectionContainer(
                          child: TestimonialSection(key: testimonialKey),
                        ),
                        const SizedBox(height: 30),
                        _SectionContainer(child: const ResumeSection()),
                        const SizedBox(height: 30),
                        _SectionContainer(
                          child: ContactSection(key: contactKey),
                        ),
                        const SizedBox(height: 30),
                        const FooterSection(),
                        const SizedBox(height: 30),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Navbar(
                isScrolled: _isScrolled,
                activeSection: _activeSection,
                onHomeTap: () => scrollToSection(homeKey),
                onAboutTap: () => scrollToSection(aboutKey),
                onPortfolioTap: () => scrollToSection(portfolioKey),
                onEducationTap: () => scrollToSection(educationKey),
                onTestimonialTap: () => scrollToSection(testimonialKey),
                onContactTap: () => scrollToSection(contactKey),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMobileDrawer(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;

    return Drawer(
      backgroundColor: Colors.white,
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: primaryColor.withOpacity(0.06),
                border: Border(bottom: BorderSide(color: Colors.grey.shade200)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Prod G",
                        style: GoogleFonts.balooPaaji2(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: primaryColor,
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.close_rounded),
                        onPressed: () => Navigator.of(context).pop(),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "Abhiseelan • Flutter Developer",
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey.shade700,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(vertical: 10),
                children: [
                  _drawerItem(Icons.home_outlined, "Home", homeKey),
                  _drawerItem(Icons.person_outline, "About", aboutKey),
                  _drawerItem(Icons.apps_rounded, "Portfolio", portfolioKey),
                  _drawerItem(Icons.school_outlined, "Education & Experience", educationKey),
                  _drawerItem(Icons.star_outline_rounded, "Testimonials", testimonialKey),
                  _drawerItem(Icons.mail_outline_rounded, "Contact", contactKey),
                  const Divider(indent: 20, endIndent: 20, height: 30),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                    child: ElevatedButton.icon(
                      onPressed: () {
                        Navigator.of(context).pop();
                        launchUrl(Uri.parse('assets/resume.pdf'));
                      },
                      icon: const Icon(Icons.download_rounded, size: 18),
                      label: const Text("View Resume"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: primaryColor,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _socialDrawerIcon(
                    FontAwesomeIcons.github,
                    'https://github.com/PR0D-G',
                  ),
                  const SizedBox(width: 16),
                  _socialDrawerIcon(
                    FontAwesomeIcons.linkedinIn,
                    'https://www.linkedin.com/in/abhiseelan-subramaniyam',
                  ),
                  const SizedBox(width: 16),
                  _socialDrawerIcon(
                    FontAwesomeIcons.envelope,
                    'mailto:abhiseelan25@gmail.com',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _drawerItem(IconData icon, String title, GlobalKey key) {
    final bool isActive = _activeSection.toLowerCase().contains(title.split(' ').first.toLowerCase());
    final primaryColor = Theme.of(context).primaryColor;

    return ListTile(
      leading: Icon(
        icon,
        color: isActive ? primaryColor : Colors.grey.shade700,
        size: 22,
      ),
      title: Text(
        title,
        style: TextStyle(
          color: isActive ? primaryColor : Colors.black87,
          fontWeight: isActive ? FontWeight.bold : FontWeight.w500,
          fontSize: 15,
        ),
      ),
      trailing: isActive
          ? Container(
              width: 8,
              height: 8,
              decoration: BoxDecoration(
                color: primaryColor,
                shape: BoxShape.circle,
              ),
            )
          : null,
      onTap: () => _navigateFromDrawer(key),
    );
  }

  Widget _socialDrawerIcon(IconData icon, String url) {
    return InkWell(
      onTap: () => launchUrl(Uri.parse(url)),
      borderRadius: BorderRadius.circular(30),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          shape: BoxShape.circle,
        ),
        child: Icon(icon, size: 18, color: Colors.grey.shade800),
      ),
    );
  }
}

class _SectionContainer extends StatelessWidget {
  final Widget child;

  const _SectionContainer({required this.child});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final bool isMobile = screenWidth < 768;

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.07),
        borderRadius: BorderRadius.circular(isMobile ? 16 : 20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      padding: EdgeInsets.symmetric(
        vertical: isMobile ? 12 : 20,
        horizontal: isMobile ? 6 : 14,
      ),
      child: child,
    );
  }
}
