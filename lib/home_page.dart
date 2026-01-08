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

      // We check how close the top of the section is to a point slightly down the screen (e.g. 150px)
      // This allows the section to be considered "active" as it scrolls into view or occupies the top area.
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: Colors.white, // Pure White
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
                  ), // Hero Section remains distinct
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        _SectionContainer(child: AboutSection(key: aboutKey)),
                        const SizedBox(height: 30),
                        // ServicesSection content now in AboutSection
                        _SectionContainer(
                          child: ShowcaseSection(key: portfolioKey),
                        ), // Removed fixed key from inside Showcase wrapping
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
}

class _SectionContainer extends StatelessWidget {
  final Widget child;

  const _SectionContainer({required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.07), // Light grey with 7% transparency
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02), // Subtler shadow
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(
        vertical: 20,
        horizontal: 10,
      ), // Reduced internal padding as sections have their own
      child: child,
    );
  }
}
