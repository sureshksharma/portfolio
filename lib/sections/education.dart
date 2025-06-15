import 'package:flutter/material.dart';

class EducationSection extends StatelessWidget {
  const EducationSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Education", style: Theme.of(context).textTheme.headlineSmall),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text("Bachelor of Computer Applications",
                    style: TextStyle(fontWeight: FontWeight.bold)),
                Text("University of Rajasthan, Jaipur (2016–2019)"),
                SizedBox(height: 8),
                Text("Courses: System Design, Java, .Net, Web & Mobile App Development"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
