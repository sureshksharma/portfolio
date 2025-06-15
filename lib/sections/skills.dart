import 'package:flutter/material.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final categorizedSkills = {
      "Languages": [
        "Dart",
        "JavaScript",
        "Java",
        "Kotlin",
        "C++",
      ],
      "Frameworks & Platforms": [
        "Flutter",
        "Flutter Web",
        "Flutter Desktop (Windows/Linux)",
        "Firebase",
        "GetX",
        "Provider",
        "Riverpod",
        "Bloc",
      ],
      "Backend & APIs": [
        "Node.js",
        "Express.js",
        "REST API",
        "GraphQL",
        "Firebase Cloud Functions",
      ],
      "Databases": [
        "Firebase Firestore",
        "Firebase Realtime DB",
        "SQLite",
        "Hive",
        "Moor/Drift",
        "MySQL",
        "MongoDB",
      ],
      "Tools & Platforms": [
        "Git & GitHub",
        "Bitbucket",
        "CI/CD (Codemagic, GitHub Actions)",
        "Figma",
        "Postman",
        "Android Studio",
        "Visual Studio Code",
        "Xcode",
        "Jira",
        "Slack",
      ],
      "Testing & Debugging": [
        "Unit Testing",
        "Widget Testing",
        "Integration Testing",
        "Flutter DevTools",
      ],
      "Other Skills": [
        "Clean Architecture",
        "MVC/MVVM/MVP",
        "Agile & Scrum",
        "App Store & Play Store Deployment",
        "Localization & Internationalization",
        "In-app Purchases & Subscriptions",
        "Push Notifications (FCM)",
        "State Management (GetX, Bloc, Riverpod)",
        "Animations & Custom UI",
      ]
    };

    return Container(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Technical Skills",
              style: Theme.of(context).textTheme.headlineSmall),
          const SizedBox(height: 16),
          ...categorizedSkills.entries.map(
            (entry) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(entry.key,
                        style: Theme.of(context).textTheme.titleMedium),
                    const SizedBox(height: 8),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: entry.value.map((skill) {
                        return Chip(
                          label: Text(skill),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                            side: BorderSide(color: Colors.indigo.shade100),
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
