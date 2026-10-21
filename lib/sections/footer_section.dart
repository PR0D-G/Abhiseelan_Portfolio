import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isMobile = MediaQuery.of(context).size.width < 700;
    final int currentYear = DateTime.now().year;

    return Container(
      padding: EdgeInsets.symmetric(
        vertical: isMobile ? 30 : 40,
        horizontal: isMobile ? 12 : 20,
      ),
      decoration: const BoxDecoration(
        border: Border(top: BorderSide(color: Colors.black12)),
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1140),
          child: isMobile
              ? Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Copyright © $currentYear Abhiseelan. All rights reserved.",
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: Colors.black87, fontSize: 13),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        _SocialIcon(
                          icon: FontAwesomeIcons.envelope,
                          url: "mailto:abhiseelan25@gmail.com",
                        ),
                        const SizedBox(width: 14),
                        _SocialIcon(
                          icon: FontAwesomeIcons.github,
                          url: "https://github.com/PR0D-G",
                        ),
                        const SizedBox(width: 14),
                        _SocialIcon(
                          icon: FontAwesomeIcons.linkedinIn,
                          url:
                              "https://www.linkedin.com/in/abhiseelan-subramaniyam",
                        ),
                      ],
                    ),
                  ],
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Copyright © $currentYear Abhiseelan. All rights reserved.",
                      style: const TextStyle(color: Colors.black87),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        _SocialIcon(
                          icon: FontAwesomeIcons.envelope,
                          url: "mailto:abhiseelan25@gmail.com",
                        ),
                        const SizedBox(width: 10),
                        _SocialIcon(
                          icon: FontAwesomeIcons.github,
                          url: "https://github.com/PR0D-G",
                        ),
                        const SizedBox(width: 10),
                        _SocialIcon(
                          icon: FontAwesomeIcons.linkedinIn,
                          url:
                              "https://www.linkedin.com/in/abhiseelan-subramaniyam",
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

class _SocialIcon extends StatelessWidget {
  final IconData icon;
  final String url;

  const _SocialIcon({required this.icon, required this.url});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        launchUrl(Uri.parse(url));
      },
      borderRadius: BorderRadius.circular(50),
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.grey),
        ),
        child: Center(child: FaIcon(icon, size: 18, color: Colors.grey)),
      ),
    );
  }
}
