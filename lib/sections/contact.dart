import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("Contact", style: Theme.of(context).textTheme.headlineSmall),
          const SizedBox(height: 12),
          Wrap(
            spacing: 20,
            children: [
              IconButton(
                icon: const Icon(Icons.email),
                tooltip: 'Email',
                onPressed: () => launchUrl(Uri.parse("mailto:sureshksharma51100@gmail.com")),
              ),
              IconButton(
                icon: const Icon(Icons.phone),
                tooltip: 'Phone',
                onPressed: () => launchUrl(Uri.parse("tel:+919119396072")),
              ),
              IconButton(
                icon: const Icon(Icons.link),
                tooltip: 'LinkedIn',
                onPressed: () => launchUrl(Uri.parse("https://www.linkedin.com/in/suresh-kumar-sharma-60ba99182")),
              ),
              IconButton(
                icon: const Icon(Icons.code),
                tooltip: 'GitHub',
                onPressed: () => launchUrl(Uri.parse("https://github.com/sureshksharma")),
              ),
            ],
          ),
          const SizedBox(height: 8),
          const Text("📍 Jaipur, Rajasthan, India"),
          const Text("🌍 Open to relocate worldwide"),
        ],
      ),
    );
  }
}
