import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HiringSection extends StatelessWidget {
  final VoidCallback onHireTap;
  const HiringSection({super.key, required this.onHireTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
      color: Theme.of(context).primaryColor,
      width: double.infinity,
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 900),
          child: Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 50,
            runSpacing: 20,
            alignment: WrapAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Want to work with me?",
                    style: GoogleFonts.balooPaaji2(
                      fontSize: 25,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                  const Text(
                    "Always feel Free to Contact & Hire me",
                    style: TextStyle(color: Colors.white70, fontSize: 16),
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: onHireTap,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Theme.of(context).primaryColor,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40,
                    vertical: 18,
                  ),
                  textStyle: GoogleFonts.balooPaaji2(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                child: const Text("Hire Me"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
