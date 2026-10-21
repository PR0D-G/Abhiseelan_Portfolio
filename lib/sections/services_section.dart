import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class ServicesSection extends StatelessWidget {
  const ServicesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1140),
          child: LayoutBuilder(
            builder: (context, constraints) {
              return Wrap(
                spacing: 30,
                runSpacing: 30,
                alignment: WrapAlignment.center,
                children: [
                  _buildServiceCard(
                    context,
                    "assets/images/android-svgrepo-com.svg",
                    "Android App Development",
                    "Built 20+ apps using Java and XML. I can create fast, reliable Android applications.",
                  ),
                  _buildServiceCard(
                    context,
                    "assets/images/responsive.svg",
                    "Flutter App Development",
                    "Cross-platform apps with smooth UI and performance. 10+ apps completed using Flutter.",
                  ),
                  _buildServiceCard(
                    context,
                    "assets/images/pencil-case.svg",
                    "UI/UX Design for Mobile Apps",
                    "Clean, user-focused mobile UI designs that enhance usability and engagement.",
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildServiceCard(
    BuildContext context,
    String iconPath,
    String title,
    String desc,
  ) {
    return Container(
      width: 350,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SvgPicture.asset(iconPath, width: 55, height: 55),
          const SizedBox(height: 25),
          Text(
            title,
            style: GoogleFonts.balooPaaji2(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).primaryColor,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            desc,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.black54,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}
