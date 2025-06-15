import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'sections/about.dart';
import 'sections/skills.dart';
import 'sections/experience.dart';
import 'sections/projects.dart';
import 'sections/education.dart';
import 'sections/contact.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Suresh K Sharma"),
        actions: [
          IconButton(
            icon: const Icon(Icons.download),
            tooltip: "Download Resume",
            onPressed: () {
              launchUrl(Uri.parse('assets/resume.pdf'));
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: const [
            AboutSection(),
            SkillsSection(),
            ExperienceSection(),
            ProjectsSection(),
            EducationSection(),
            ContactSection(),
          ],
        ),
      ),
    );
  }
}
