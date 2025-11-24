import 'package:flutter/material.dart';

class EducationSection extends StatelessWidget {
  const EducationSection({super.key});

  @override
  Widget build(BuildContext context) {
    final educationList = [
      {
        "degree": "Bachelor of Computer Applications (BCA)",
        "university": "University of Rajasthan, Jaipur",
        "years": "2016 – 2019",
        "courses": [
          "System Design",
          "Java & OOP",
          ".NET Framework",
          "Web & Mobile App Development",
          "Database Management Systems",
          "Cloud Computing Basics",
        ],
        "achievements": [
          "Graduated with Distinction",
          "Top 10% in class",
          "Led final year project on mobile app development",
        ],
      },
    ];

    // final certifications = [
    //   {
    //     "title": "AWS Certified Developer – Associate",
    //     "issuer": "Amazon Web Services",
    //     "year": "2021"
    //   },
    //   {"title": "Node.js Backend Developer", "issuer": "Udemy", "year": "2020"},
    //   {"title": "Flutter Advanced", "issuer": "Coursera", "year": "2019"},
    // ];

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
              "Education",
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 24),
            ...educationList.map((edu) => Card(
                  color: Theme.of(context).colorScheme.surfaceContainerHighest,
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18)),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          edu["degree"] as String,
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
                          "${edu["university"]} • ${edu["years"]}",
                          style:
                              Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onSurfaceVariant,
                                  ),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          "Relevant Courses:",
                          style:
                              Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                        Wrap(
                          spacing: 8,
                          runSpacing: 8,
                          children:
                              (edu["courses"] as List<String>).map((course) {
                            return Chip(
                              label: Text(course),
                              backgroundColor: Theme.of(context)
                                  .colorScheme
                                  .surfaceContainerHighest,
                              labelStyle: TextStyle(
                                  color:
                                      Theme.of(context).colorScheme.onSurface),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            );
                          }).toList(),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          "Achievements:",
                          style:
                              Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                        ...((edu["achievements"] as List<String>)
                            .map((ach) => Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 2),
                                  child: Row(
                                    children: [
                                      const Icon(Icons.star,
                                          size: 16, color: Colors.amber),
                                      const SizedBox(width: 6),
                                      Expanded(child: Text(ach)),
                                    ],
                                  ),
                                ))),
                      ],
                    ),
                  ),
                )),
            // const SizedBox(height: 32),
            // Text(
            //   "Certifications",
            //   style: Theme.of(context).textTheme.titleMedium?.copyWith(
            //     color: Theme.of(context).colorScheme.primary,
            //     fontWeight: FontWeight.w600,
            //   ),
            // ),
            // const SizedBox(height: 12),
            // Wrap(
            //   spacing: 10,
            //   runSpacing: 10,
            //   children: certifications.map((cert) {
            //     return Chip(
            //       label: Text("${cert["title"]} (${cert["year"]})"),
            //       backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
            //       labelStyle: TextStyle(color: Theme.of(context).colorScheme.onSecondaryContainer),
            //       shape: RoundedRectangleBorder(
            //         borderRadius: BorderRadius.circular(12),
            //       ),
            //     );
            //   }).toList(),
            // ),
          ],
        ),
      ),
    );
  }
}
