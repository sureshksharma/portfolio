import 'package:flutter/material.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    final experienceList = [
      {
        "company": "Daksh Infosoft Pvt Ltd",
        "location": "Jaipur, India",
        "role": "Senior Flutter Developer",
        "duration": "Oct 2023 – Present",
        "tech": ["Flutter", "Firebase", "Node.js", "Figma", "REST APIs"],
        "details": [
          "Led the development of 15+ mobile apps, improving client delivery speed by 25%.",
          "Built highly performant, scalable mobile and web apps using Flutter and Node.js.",
          "Integrated FCM, Firebase Analytics, real-time data sync, and clean architecture.",
          "Managed a cross-functional team of 5 developers, mentoring juniors and reviewing code.",
        ],
      },
      {
        "company": "National Informatics Centre (NIC)",
        "location": "Jaipur, India",
        "role": "Flutter Developer (Contract)",
        "duration": "Jun 2022 – Sep 2023",
        "tech": ["Flutter", "Native Android", "SQLite", "REST APIs"],
        "details": [
          "Developed 5+ e-Governance apps used by thousands of users daily.",
          "Built scalable public-facing applications with authentication, maps, and offline storage.",
          "Collaborated with government stakeholders to translate functional requirements into mobile solutions.",
        ],
      },
      {
        "company": "Axestrack Software Solutions Pvt Ltd",
        "location": "Jaipur, India",
        "role": "Flutter Developer",
        "duration": "Nov 2020 – May 2022",
        "tech": ["Flutter", "Firebase", "GPS APIs", "Hive"],
        "details": [
          "Created a fleet tracking app to manage logistics for over 10,000 vehicles.",
          "Built custom maps, push notifications, and dynamic vehicle alerts system.",
          "Maintained app stability with automated testing and in-field diagnostics logging.",
        ],
      },
    ];

    return Container(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Professional Experience",
              style: Theme.of(context).textTheme.headlineSmall),
          const SizedBox(height: 24),
          ...experienceList.map(
            (exp) => Padding(
              padding: const EdgeInsets.only(bottom: 24.0),
              child: Card(
                elevation: 3,
                shadowColor: Colors.indigo.shade50,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('${exp["role"]!}',
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge
                              ?.copyWith(fontWeight: FontWeight.bold)),
                      Text("${exp["company"]} • ${exp["location"]}",
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium
                              ?.copyWith(color: Colors.grey[700])),
                      Text('${exp["duration"]!}',
                          style: const TextStyle(color: Colors.grey)),
                      const SizedBox(height: 12),
                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: (exp["tech"] as List<String>).map((tech) {
                          return Chip(
                            label: Text(tech),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                              side: BorderSide(color: Colors.indigo.shade100),
                            ),
                          );
                        }).toList(),
                      ),
                      const SizedBox(height: 12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:
                            (exp["details"] as List<String>).map((bullet) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 4),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(top: 6),
                                  child: Icon(Icons.check_circle_outline,
                                      size: 16, color: Colors.indigo),
                                ),
                                const SizedBox(width: 8),
                                Expanded(child: Text(bullet)),
                              ],
                            ),
                          );
                        }).toList(),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
