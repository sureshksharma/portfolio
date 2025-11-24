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
        "Microservices",
        "Serverless Architectures",
      ],
      "Databases": [
        "Firebase Firestore",
        "Firebase Realtime DB",
        "SQLite",
        "Hive",
        "Moor/Drift",
        "MySQL",
        "MongoDB",
        "Redis",
      ],
      "Cloud & DevOps": [
        "AWS (EC2, S3, Lambda, RDS)",
        "Google Cloud Platform",
        "Azure",
        "CI/CD (Codemagic, GitHub Actions)",
        "Docker",
        "Kubernetes",
      ],
      "Messaging & Queues": [
        "Kafka",
        "RabbitMQ",
        "SQS",
        "WebSockets",
      ],
      "CPaaS & Communication": [
        "WhatsApp Business API",
        "RCS",
        "SMS Gateways",
        "Twilio",
        "Vonage",
        "Email Integrations",
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
        "Jest",
        "Mocha",
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
        "Performance Optimization",
        "Security Best Practices",
      ]
    };

    return Padding(
      padding: const EdgeInsets.all(24),
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        color: Theme.of(context).colorScheme.surface,
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Technical Skills",
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 24),
              ...categorizedSkills.entries.map(
                (entry) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          entry.key,
                          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            color: Theme.of(context).colorScheme.primary,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Wrap(
                          spacing: 10,
                          runSpacing: 10,
                          children: entry.value.map((skill) {
                            return Chip(
                              label: Text(skill),
                              backgroundColor: Theme.of(context).colorScheme.surfaceContainerHighest,
                              labelStyle: TextStyle(color: Theme.of(context).colorScheme.onSurface),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
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
        ),
      ),
    );
  }
}
