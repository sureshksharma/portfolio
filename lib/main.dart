import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'sections/about.dart';
import 'sections/skills.dart';
import 'sections/projects.dart';
import 'sections/experience.dart';
import 'sections/education.dart';
import 'sections/contact.dart';
import 'theme/theme.dart';

void main() {
  runApp(const MyPortfolioApp());
}

class MyPortfolioApp extends StatefulWidget {
  const MyPortfolioApp({super.key});

  @override
  State<MyPortfolioApp> createState() => _MyPortfolioAppState();
}

class _MyPortfolioAppState extends State<MyPortfolioApp> {
  ThemeMode _themeMode = ThemeMode.system;

  final sectionKeys = {
    'About': GlobalKey(),
    'Skills': GlobalKey(),
    'Projects': GlobalKey(),
    'Experience': GlobalKey(),
    'Education': GlobalKey(),
    'Contact': GlobalKey(),
  };

  final List<String> sectionNames = [
    'About',
    'Skills',
    'Projects',
    'Experience',
    'Education',
    'Contact'
  ];

  int _selectedIndex = 0;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    // Find the section whose top is closest to the scroll offset
    double minDiff = double.infinity;
    int currentIndex = _selectedIndex;
    for (int i = 0; i < sectionNames.length; i++) {
      final key = sectionKeys[sectionNames[i]];
      if (key?.currentContext != null) {
        final box = key!.currentContext!.findRenderObject() as RenderBox;
        final position = box.localToGlobal(Offset.zero, ancestor: null).dy;
        final diff = (position - kToolbarHeight - 32).abs();
        if (diff < minDiff) {
          minDiff = diff;
          currentIndex = i;
        }
      }
    }
    if (currentIndex != _selectedIndex) {
      setState(() {
        _selectedIndex = currentIndex;
      });
    }
  }

  void _scrollToSection(String section, int index) {
    final key = sectionKeys[section];
    if (key != null && key.currentContext != null) {
      Scrollable.ensureVisible(
        key.currentContext!,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Developer Portfolio',
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: _themeMode,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Suresh K Sharma | Software Developer'),
          centerTitle: true,
          actions: [
            IconButton(
              icon: Icon(_themeMode == ThemeMode.dark
                  ? Icons.light_mode
                  : Icons.dark_mode),
              tooltip: 'Toggle Theme',
              onPressed: () {
                setState(() {
                  _themeMode = _themeMode == ThemeMode.dark
                      ? ThemeMode.light
                      : ThemeMode.dark;
                });
              },
            ),
            IconButton(
              icon: const Icon(Icons.download),
              tooltip: "Download Resume",
              onPressed: () async {
                await launchUrl(Uri.parse('assets/resume.pdf'));
              },
            ),
          ],
        ),
        body: LayoutBuilder(
          builder: (context, constraints) {
            final extended = constraints.maxWidth > 900;
            return Row(
              children: [
                NavigationRail(
                  selectedIndex: _selectedIndex,
                  destinations: sectionNames
                      .map((section) => NavigationRailDestination(
                            icon: const Icon(Icons.circle),
                            label: Text(section),
                          ))
                      .toList(),
                  labelType: extended
                      ? NavigationRailLabelType.none
                      : NavigationRailLabelType.all,
                  onDestinationSelected: (index) {
                    _scrollToSection(sectionNames[index], index);
                  },
                  extended: extended,
                ),
                Expanded(
                  child: SingleChildScrollView(
                    controller: _scrollController,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 32),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Container(
                              key: sectionKeys['About'],
                              child: const AboutSection()),
                          const SizedBox(height: 48),
                          Container(
                              key: sectionKeys['Skills'],
                              child: const SkillsSection()),
                          const SizedBox(height: 48),
                          Container(
                              key: sectionKeys['Projects'],
                              child: const ProjectsSection()),
                          const SizedBox(height: 48),
                          Container(
                              key: sectionKeys['Experience'],
                              child: ExperienceSection()),
                          const SizedBox(height: 48),
                          Container(
                              key: sectionKeys['Education'],
                              child: EducationSection()),
                          const SizedBox(height: 48),
                          Container(
                              key: sectionKeys['Contact'],
                              child: ContactSection()),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
