import 'package:flutter/material.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        children: [
          const CircleAvatar(
            radius: 60,
            backgroundImage: AssetImage('assets/profile.jpeg'),
          ),
          const SizedBox(height: 16),
          Text(
            "Hi, I'm a Flutter Developer from Jaipur, India",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(height: 12),
          const Text(
            "Highly motivated and results-driven Flutter Developer with 5 years of experience delivering 20+ innovative projects across government and business sectors.",
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          Wrap(
            alignment: WrapAlignment.center,
            spacing: 10,
            runSpacing: 10,
            children: [
              Chip(label: Text("Jaipur, India")),
              Chip(label: Text("Open to Relocate")),
              Chip(label: Text("Visa Sponsorship Required")),
            ],
          )
        ],
      ),
    );
  }
}
