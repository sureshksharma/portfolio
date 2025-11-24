import 'package:flutter/material.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    final experienceList = [
      {
        "company": "Daksh Infosoft Pvt Ltd",
        "location": "Jaipur, India",
        "role": "Senior Software Developer",
        "duration": "2023 – Present",
        "tech": [
          "Node.js",
          "Flutter",
          "AWS",
          "Kafka",
          "Message Queue",
          "MySQL",
          "MongoDB",
          "REST APIs",
          "GraphQL",
          "WebSockets",
          "VOIP",
          "CPaaS"
        ],
        "details": [
          "Architected and led backend development for CPaaS solutions integrating WhatsApp, RCS, and SMS.",
          "Built scalable Node.js microservices, managed cloud deployments on AWS, and implemented Kafka-based messaging systems.",
          "Mentored junior developers and collaborated with cross-functional teams for product delivery.",
        ],
      },
      {
        "company": "National Informatics Centre (NIC)",
        "location": "Jaipur, India",
        "role": "Software Developer",
        "duration": "2022 – 2023",
        "tech": [
          "Node.js",
          "Express.js",
          "MySQL",
          "PostgreSQL",
          "Cloud",
          "Flutter",
          "Android"
        ],
        "details": [
          "Developed robust backend APIs using Node.js and Express, integrated PostgreSQL databases, and deployed applications on Government Cloud Server.",
          "Built real-time communication features and optimized system performance for high-traffic apps.",
        ],
      },
      {
        "company": "Axestrack Software Solutions Pvt Ltd",
        "location": "Jaipur, India",
        "role": "Software Developer",
        "duration": "2020 – 2022",
        "tech": ["Flutter", "Firebase", "REST APIs", "Figma"],
        "details": [
          "Designed and developed cross-platform mobile apps with Flutter for healthcare, education, and retail clients.",
          "Implemented custom UI, state management, and integrated RESTful APIs for seamless user experiences.",
        ],
      },
    ];

    return Card(
      color: Theme.of(context).colorScheme.surface,
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Professional Experience',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 24),
            ...experienceList.map((exp) => Padding(
                  padding: const EdgeInsets.only(bottom: 32),
                  child: Card(
                    color:
                        Theme.of(context).colorScheme.surfaceContainerHighest,
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18)),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            exp['role'] as String,
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(
                                  color: Theme.of(context).colorScheme.primary,
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            '${exp["company"]} • ${exp["location"]}',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onSurfaceVariant,
                                ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            exp['duration'] as String,
                            style: TextStyle(
                              fontSize: 13,
                              color: Theme.of(context)
                                  .colorScheme
                                  .onSurfaceVariant,
                            ),
                          ),
                          const SizedBox(height: 12),
                          Wrap(
                            spacing: 10,
                            runSpacing: 10,
                            children: (exp['tech'] as List<String>).map((tech) {
                              return Chip(
                                label: Text(tech),
                                backgroundColor: Theme.of(context)
                                    .colorScheme
                                    .surfaceContainerHighest,
                                labelStyle: TextStyle(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onSurface),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              );
                            }).toList(),
                          ),
                          const SizedBox(height: 12),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children:
                                (exp['details'] as List<String>).map((bullet) {
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 4),
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
                          ),
                        ],
                      ),
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
