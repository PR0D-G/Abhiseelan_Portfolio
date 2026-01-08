import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Navbar extends StatelessWidget {
  final VoidCallback onHomeTap;
  final VoidCallback onAboutTap;
  final VoidCallback onPortfolioTap;
  final VoidCallback onEducationTap;
  final VoidCallback onTestimonialTap;
  final VoidCallback onContactTap;

  final bool isScrolled;
  final String activeSection;

  const Navbar({
    super.key,
    required this.onHomeTap,
    required this.onAboutTap,
    required this.onPortfolioTap,
    required this.onEducationTap,
    required this.onTestimonialTap,
    required this.onContactTap,
    this.isScrolled = false,
    this.activeSection = "Home",
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
      color: isScrolled ? Colors.white.withOpacity(0.9) : Colors.transparent,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Prod G",
            style: GoogleFonts.balooPaaji2(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: isScrolled ? Theme.of(context).primaryColor : Colors.white,
            ),
          ),
          if (MediaQuery.of(context).size.width > 800)
            Row(
              children: [
                _NavLink(
                  title: "Home",
                  onTap: onHomeTap,
                  isScrolled: isScrolled,
                  isActive: activeSection == "Home",
                ),
                _NavLink(
                  title: "About",
                  onTap: onAboutTap,
                  isScrolled: isScrolled,
                  isActive: activeSection == "About",
                ),
                _NavLink(
                  title: "Portfolio",
                  onTap: onPortfolioTap,
                  isScrolled: isScrolled,
                  isActive: activeSection == "Portfolio",
                ),
                _NavLink(
                  title: "Education",
                  onTap: onEducationTap,
                  isScrolled: isScrolled,
                  isActive: activeSection == "Education",
                ),
                _NavLink(
                  title: "Testimonial",
                  onTap: onTestimonialTap,
                  isScrolled: isScrolled,
                  isActive: activeSection == "Testimonial",
                ),
                _NavLink(
                  title: "Contact",
                  onTap: onContactTap,
                  isScrolled: isScrolled,
                  isActive: activeSection == "Contact",
                ),
              ],
            )
          else
            IconButton(
              icon: Icon(
                Icons.menu,
                color: isScrolled ? Colors.black87 : Colors.white,
              ),
              onPressed: () {
                Scaffold.of(context).openEndDrawer();
              },
            ),
        ],
      ),
    );
  }
}

class _NavLink extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final bool isScrolled;
  final bool isActive;

  const _NavLink({
    required this.title,
    required this.onTap,
    this.isScrolled = false,
    this.isActive = false,
  });

  @override
  Widget build(BuildContext context) {
    // Determine text color based on scroll and active state
    Color textColor;
    if (isActive) {
      textColor = Theme.of(context).primaryColor;
    } else {
      textColor = isScrolled ? Colors.black87 : Colors.white;
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: TextButton(
        onPressed: onTap,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              style: TextStyle(
                color: textColor,
                fontWeight: isActive ? FontWeight.bold : FontWeight.w600,
              ),
            ),
            if (isActive)
              Container(
                margin: const EdgeInsets.only(top: 4),
                height: 2,
                width: 20,
                color: Theme.of(context).primaryColor,
              ),
          ],
        ),
      ),
    );
  }
}
