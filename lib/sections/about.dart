import 'package:flutter/material.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        color: Theme.of(context).colorScheme.surface,
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage('assets/profile.jpeg'),
              ),
              const SizedBox(height: 24),
              Text(
                "Hi, I'm Suresh K Sharma — Software Developer (5+ years)",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                "Experienced in crafting robust solutions across frontend and backend. Specialized in Flutter for beautiful, responsive apps, and Node.js for scalable, high-performance backends. Skilled in MySQL, Postgres, MongoDB, AWS, and other cloud platforms. Proficient with messaging queues (Kafka, BullMQ) and CPaaS integrations (WhatsApp, RCS, SMS, and more). Currently architecting low cost advanced CPaaS solutions for modern communication needs.",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
              ),
              const SizedBox(height: 24),
              Wrap(
                alignment: WrapAlignment.center,
                spacing: 10,
                runSpacing: 10,
                children: [
                  Chip(
                    label: Text("Jaipur, India"),
                    backgroundColor: Theme.of(context).colorScheme.primaryContainer,
                    labelStyle: TextStyle(color: Theme.of(context).colorScheme.onPrimaryContainer),
                  ),
                  Chip(
                    label: Text("Open to Relocate"),
                    backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
                    labelStyle: TextStyle(color: Theme.of(context).colorScheme.onSecondaryContainer),
                  ),
                  Chip(
                    label: Text("Visa Sponsorship Required"),
                    backgroundColor: Theme.of(context).colorScheme.tertiaryContainer,
                    labelStyle: TextStyle(color: Theme.of(context).colorScheme.onTertiaryContainer),
                  ),
                  Chip(
                    label: Text("5+ Years Experience"),
                    backgroundColor: Theme.of(context).colorScheme.surfaceContainerHighest,
                    labelStyle: TextStyle(color: Theme.of(context).colorScheme.onSurface),
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
