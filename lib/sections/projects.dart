import 'package:flutter/material.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final projects = [
      {"name": "PunyaSetu", "desc": "Spiritual & religious content platform.", "platform": "Android & iOS"},
      {"name": "iGuruji", "desc": "Online classes, polling & exams.", "platform": "Android & iOS"},
      {"name": "AirPhone", "desc": "Cloud telephony with call logs and SIP integration.", "platform": "Android & iOS"},
      {"name": "Paramarsh+", "desc": "Doctor consultation with medical records.", "platform": "Android & iOS"},
      {"name": "JHW", "desc": "Healthcare app with insurance card integration.", "platform": "Android & iOS"},
      {"name": "Gifzi", "desc": "Digital gifting and voucher platform.", "platform": "Android"},
      {"name": "Stamp Vendor", "desc": "Digital stamps for 20K+ vendors.", "platform": "Android & Web"},
      {"name": "Trackurate", "desc": "Fleet management and GPS tracking.", "platform": "Android & iOS"},
    ];

    return Container(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Selected Projects", style: Theme.of(context).textTheme.headlineSmall),
          const SizedBox(height: 16),
          Wrap(
            spacing: 16,
            runSpacing: 16,
            children: projects.map((proj) {
              return Container(
                width: 300,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.indigo.shade100),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(proj['name']!, style: Theme.of(context).textTheme.titleMedium),
                    Text(proj['platform']!, style: const TextStyle(fontSize: 12, color: Colors.grey)),
                    const SizedBox(height: 8),
                    Text(proj['desc']!),
                  ],
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
