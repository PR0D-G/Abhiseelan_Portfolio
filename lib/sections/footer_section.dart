import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
      decoration: const BoxDecoration(
        border: Border(top: BorderSide(color: Colors.black12)),
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1140),
          child: LayoutBuilder(
            builder: (context, constraints) {
              return Wrap(
                alignment: WrapAlignment.spaceBetween,
                crossAxisAlignment: WrapCrossAlignment.center,
                runSpacing: 20,
                spacing: 20,
                children: [
                  const Text(
                    "Copyright © 2023 Abhiseelan. All rights reserved.",
                    style: TextStyle(color: Colors.black87),
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
              );
            },
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
