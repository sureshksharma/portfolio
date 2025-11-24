import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectsSection extends StatefulWidget {
  const ProjectsSection({super.key});

  @override
  State<ProjectsSection> createState() => _ProjectsSectionState();
}

class _ProjectsSectionState extends State<ProjectsSection> {
  late final List<Map<String, dynamic>> _projects;
  final List<String> _filters = [
    'All',
    'Mobile',
    'Backend',
    'Cloud',
    'CPaaS',
    'Healthcare',
    'Education',
    'Retail'
  ];
  String _selectedFilter = 'All';
  final Map<String, bool> _visibleMap = {};

  @override
  void initState() {
    super.initState();
    _projects = [
      {
        "name": "CPaaS Communication Suite",
        "desc":
            "End-to-end Communication Platform integrating WhatsApp Business API, RCS, SMS, and Email. Architected and led backend development using Node.js microservices, Kafka for message queues, and AWS (EC2, Lambda, S3) for cloud deployment. Implemented real-time analytics, user management, and secure message delivery. Led a team of 4 engineers and collaborated with product managers.",
        // example hero image (replace with your own asset or image)
        "image":
            "https://images.unsplash.com/photo-1555066931-4365d14bab8c?q=80&w=1400&auto=format&fit=crop&ixlib=rb-4.0.3&s=1a9b9a0b4f9a7b2f4f6e",
        "platform": "Web, Android, iOS, Cloud",
        "role": "Lead Backend Architect & Full-stack Developer",
        "tech": ["Node.js", "Kafka", "AWS", "Flutter", "MongoDB", "REST APIs"],
        "planning":
            "Defined project scope with stakeholders, created detailed architecture diagrams, and set up agile sprints for phased delivery.",
        "challenges":
            "Integrating multiple messaging channels (WhatsApp, RCS, SMS, Email) with real-time analytics and ensuring high availability.",
        "overcome":
            "Adopted microservices, used Kafka for decoupling, and implemented robust monitoring and auto-scaling on AWS.",
        "impact":
            "Enabled enterprise clients to automate and scale communication, reducing manual effort by 80% and improving delivery rates.",
        "links": {
          "website": "https://www.dakshconnect.com",
          "play": null,
          "ios": null,
          "devFlag": true
        },
        "tags": ["Backend", "Cloud", "CPaaS"]
      },
      {
        "name": "Stamp Vendor Portal",
        "desc":
            "Digital stamp platform for 20K+ vendors. Designed and developed secure backend in Node.js, integrated MySQL for transactional data, and used AWS S3 for document storage. Implemented vendor management, reporting, and scalable REST APIs. Led backend and cloud architecture.",
        "platform": "Android & Web",
        "role": "Backend Lead & Cloud Architect",
        "tech": [".NET Core", "PostgreSQL", "Flutter", "REST APIs"],
        "planning":
            "Collaborated with government officials to gather requirements, planned phased rollouts, and designed scalable database schemas.",
        "challenges":
            "Ensuring data security for sensitive transactions and scaling for thousands of concurrent users.",
        "overcome":
            "Implemented encrypted data storage, optimized queries, and used AWS S3 for reliable document management.",
        "impact":
            "Digitized stamp distribution, improved vendor efficiency, and reduced fraud by 60%.",
        "image":
            "https://images.unsplash.com/photo-1559526324-593bc073d938?q=80&w=1400&auto=format&fit=crop&ixlib=rb-4.0.3&s=0f0b6b2b3e6d0f1d4e7f",
        "links": {
          "website": "https://apiepanjiyan.rajasthan.gov.in/stampvendorweb/",
          "play":
              "https://play.google.com/store/apps/details?id=com.rajasthan.epanjiyan",
          "ios": null,
          "devFlag": false
        },
        "tags": ["Backend", "Cloud", "Retail"]
      },
      {
        "name": "PunyaSetu",
        "desc":
            "Spiritual & religious content platform. Developed Flutter frontend and Node.js backend, deployed on AWS. Implemented content management, user authentication, and scalable APIs. Led backend and mobile integration.",
        "platform": "Android & iOS",
        "role": "Full-stack Developer & Backend Designer",
        "tech": ["Flutter", "Node.js", "PHP", "AWS", "REST APIs"],
        "planning":
            "Worked with religious organizations to define content workflows, planned user engagement features, and set up CI/CD for rapid updates.",
        "challenges":
            "Managing large volumes of multimedia content and ensuring seamless user experience across devices.",
        "overcome":
            "Used AWS for scalable storage, optimized media delivery, and implemented responsive UI in Flutter.",
        "impact":
            "Reached 100K+ users, enabled easy access to spiritual content, and improved engagement by 40%.",
        "image":
            "https://images.unsplash.com/photo-1504384308090-c894fdcc538d?q=80&w=1400&auto=format&fit=crop&ixlib=rb-4.0.3&s=7b7d8b2a6be5a3d2e7c5",
        "links": {
          "website": null,
          "play":
              "https://play.google.com/store/apps/details?id=free.temple.mandir.darshan.dev.puja.panditji.sri.guruji.pravachan",
          "ios": "https://apps.apple.com/in/app/punyasetu/id6683311967",
          "devFlag": false
        },
        "tags": ["Mobile", "Backend"]
      },
      {
        "name": "JHW Healthcare",
        "desc":
            "Healthcare app with insurance card integration. Full-stack development with Flutter and Node.js, cloud hosting, and secure authentication. Designed backend for insurance management, claims, and reporting. Led backend and mobile teams.",
        "platform": "Android & iOS",
        "role": "Backend Lead & Full-stack Developer",
        "tech": ["Flutter", "Node.js", "AWS", "MongoDB", "REST APIs"],
        "planning":
            "Partnered with healthcare providers to map insurance workflows, planned secure data flows, and set up automated testing.",
        "challenges":
            "Integrating insurance APIs and ensuring HIPAA-compliant data security.",
        "overcome":
            "Used encrypted data storage, implemented OAuth2 authentication, and automated compliance checks.",
        "impact":
            "Streamlined insurance claims, reduced processing time by 50%, and improved patient satisfaction.",
        "image":
            "https://images.unsplash.com/photo-1586773860412-8d6c2da3f4f1?q=80&w=1400&auto=format&fit=crop&ixlib=rb-4.0.3&s=09f5c9f599c3b8e5a6d4",
        "links": {
          "website": null,
          "play": null,
          "ios":
              "https://apps.apple.com/in/app/just-health-and-wellness-jhw/id1613561522",
          "devFlag": false
        },
        "tags": ["Mobile", "Healthcare", "Backend"]
      },
      {
        "name": "Paramarsh+",
        "desc":
            "Doctor consultation platform with medical records. Designed Node.js backend for secure data storage, appointment scheduling, and real-time chat. Integrated Flutter mobile app and cloud deployment. Led backend and mobile integration.",
        "platform": "Android & iOS",
        "role": "Backend Designer & Mobile Integrator",
        "tech": ["Node.js", "Flutter", "AWS", "MongoDB", "REST APIs"],
        "planning":
            "Defined patient-doctor workflows, planned chat and appointment modules, and set up cloud infrastructure for scalability.",
        "challenges":
            "Ensuring real-time chat reliability and secure medical record storage.",
        "overcome":
            "Used WebSockets for chat, encrypted medical records, and implemented automated backups.",
        "impact":
            "Enabled remote consultations, improved access to healthcare, and reduced missed appointments by 30%.",
        "image":
            "https://images.unsplash.com/photo-1519389950473-47ba0277781c?q=80&w=1400&auto=format&fit=crop&ixlib=rb-4.0.3&s=7fb2d9b6f8c7d2a1e3a9",
        "links": {"website": null, "play": null, "ios": null, "devFlag": true},
        "tags": ["Mobile", "Healthcare"]
      },
      {
        "name": "Gifzi",
        "desc":
            "Digital gifting and voucher platform. Designed Node.js backend, MongoDB database, and Flutter mobile frontend. Developed website for voucher management and redemption. Led backend, web, and mobile teams.",
        "platform": "Android, Web",
        "role": "Backend Lead & Web/Mobile Developer",
        "tech": ["Node.js", "MongoDB", "Flutter", "React", "REST APIs"],
        "planning":
            "Worked with retailers to define voucher workflows, planned redemption logic, and set up analytics dashboards.",
        "challenges":
            "Preventing voucher fraud and scaling for high transaction volumes.",
        "overcome":
            "Implemented unique voucher codes, real-time validation, and scalable backend with MongoDB sharding.",
        "impact":
            "Processed 1M+ vouchers, reduced fraud by 70%, and improved retailer satisfaction.",
        "image":
            "https://images.unsplash.com/photo-1526045612212-70caf35c14df?q=80&w=1400&auto=format&fit=crop&ixlib=rb-4.0.3&s=3a7a2f8f7d9c6b3e4c1b",
        "links": {
          "website": "https://www.gifzi.in",
          "play": null,
          "ios": null,
          "devFlag": false
        },
        "tags": ["Mobile", "Retail", "Backend"]
      },
      {
        "name": "AirPhone Cloud Telephony",
        "desc":
            "Cloud telephony solution with SIP integration, call logs, and scalable backend using Node.js, Express, and MongoDB. Deployed on AWS with serverless functions and integrated with third-party SMS gateways. Led backend and cloud deployment.",
        "platform": "Android & iOS",
        "role": "Backend Lead & Cloud Integrator",
        "tech": ["Node.js", "Express.js", "MongoDB", "AWS", "Flutter"],
        "planning":
            "Mapped telephony workflows, planned SIP integration, and set up serverless architecture for cost efficiency.",
        "challenges":
            "Integrating SIP with mobile apps and ensuring call reliability across regions.",
        "overcome":
            "Used Express.js for API management, implemented fallback logic, and set up global monitoring.",
        "impact":
            "Enabled scalable cloud telephony, reduced call drop rates by 40%, and improved user experience.",
        "image":
            "https://images.unsplash.com/photo-1496307042754-b4aa456c4a2d?q=80&w=1400&auto=format&fit=crop&ixlib=rb-4.0.3&s=9a2d3b4c5d6e7f8a9b0c",
        "links": {
          "website": null,
          "play": null,
          "ios": "https://apps.apple.com/in/app/airson/id6475618479",
          "devFlag": true
        },
        "tags": ["Cloud", "CPaaS", "Backend"]
      },
      {
        "name": "Trackurate Fleet Management",
        "desc":
            "Fleet management and GPS tracking platform. Designed RESTful APIs in Node.js, used MongoDB for geospatial data, and implemented real-time updates with WebSockets. Hosted on AWS with CI/CD pipelines. Led backend and mobile teams.",
        "platform": "Android & iOS",
        "role": "Backend Lead & Mobile Developer",
        "tech": ["Node.js", "MongoDB", "WebSockets", "AWS", "Flutter"],
        "planning":
            "Worked with logistics companies to define tracking workflows, planned geospatial data models, and set up CI/CD for rapid deployments.",
        "challenges":
            "Handling real-time location updates and scaling for thousands of vehicles.",
        "overcome":
            "Used WebSockets for real-time updates, optimized geospatial queries, and automated deployments with CI/CD.",
        "impact":
            "Improved fleet visibility, reduced operational costs by 25%, and enabled real-time alerts.",
        "links": {
          "website": null,
          "play": "https://play.google.com/store/apps/details?id=gold.fvts.in",
          "ios": "https://apps.apple.com/in/app/trackurate/id1526682919",
          "devFlag": false
        },
        "tags": [
          "Mobile",
          "Fleet Management",
          "Google Maps",
          "WebSockets",
          "Kafka"
        ]
      },
      {
        "name": "iGuruji",
        "desc":
            "Online classes, polling & exams. Built REST APIs, integrated payment gateways, and managed cloud deployments. Led backend and mobile teams for scalable education platform.",
        "platform": "Android & iOS",
        "role": "Backend Lead & Mobile Developer",
        "tech": ["Node.js", "Flutter", "AWS", "REST APIs"],
        "planning":
            "Collaborated with educators to define course workflows, planned exam and polling modules, and set up payment integration.",
        "challenges":
            "Ensuring exam integrity and scaling for thousands of students during peak times.",
        "overcome":
            "Used secure REST APIs, implemented load balancing, and automated exam result processing.",
        "impact":
            "Enabled remote learning, improved exam participation by 50%, and streamlined payment collection.",
        "links": {
          "website": null,
          "play":
              "https://play.google.com/store/apps/details?id=com.iguruji.biolifescience",
          "ios": null,
          "devFlag": false
        },
        "tags": ["Education", "Mobile", "Backend"]
      },
    ];

    // initialize visibility map
    for (final p in _projects) {
      _visibleMap[p['name'] as String] = false;
    }

    // staggered reveal after first frame
    WidgetsBinding.instance.addPostFrameCallback((_) => _staggerReveal());
  }

  void _staggerReveal() {
    var delay = 80;
    for (final p in _projects) {
      Future.delayed(Duration(milliseconds: delay), () {
        if (!mounted) return;
        setState(() {
          _visibleMap[p['name'] as String] = true;
        });
      });
      delay += 80;
    }
  }

  void _applyFilter(String tag) {
    setState(() {
      _selectedFilter = tag;
      // hide all first
      for (final k in _visibleMap.keys) {
        _visibleMap[k] = false;
      }
    });

    // reveal filtered items with stagger
    final filtered = _projects
        .where((p) => tag == 'All' || (p['tags'] as List).contains(tag))
        .toList();
    var d = 80;
    for (final p in filtered) {
      Future.delayed(Duration(milliseconds: d), () {
        if (!mounted) return;
        setState(() {
          _visibleMap[p['name'] as String] = true;
        });
      });
      d += 80;
    }
  }

  @override
  Widget build(BuildContext context) {
    // Local helper to show a readable case study dialog
    void showCaseStudy(BuildContext ctx, Map<String, dynamic> proj) {
      showDialog(
        context: ctx,
        builder: (dctx) {
          return AlertDialog(
            title: Text(proj['name'] as String),
            content: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Use a safe local hero graphic (gradient + icon + initials) instead of loading remote images
                  Padding(
                    padding: const EdgeInsets.only(bottom: 12.0),
                    child: Container(
                      height: 160,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        gradient: LinearGradient(
                          colors: [
                            Theme.of(context)
                                .colorScheme
                                .primary
                                .withAlpha((0.12 * 255).toInt()),
                            Theme.of(context)
                                .colorScheme
                                .primary
                                .withAlpha((0.04 * 255).toInt()),
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      ),
                      child: Row(
                        children: [
                          const SizedBox(width: 12),
                          CircleAvatar(
                            radius: 36,
                            backgroundColor:
                                Theme.of(context).colorScheme.primary,
                            child: Text(
                              ((proj['name'] as String)
                                      .split(' ')
                                      .map((s) => s.isNotEmpty ? s[0] : '')
                                      .take(2)
                                      .join())
                                  .toUpperCase(),
                              style: TextStyle(
                                  color:
                                      Theme.of(context).colorScheme.onPrimary,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Text(
                              proj['platform'] as String,
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall
                                  ?.copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onSurfaceVariant),
                            ),
                          ),
                          const SizedBox(width: 12),
                        ],
                      ),
                    ),
                  ),
                  Text("Role", style: Theme.of(ctx).textTheme.labelLarge),
                  const SizedBox(height: 4),
                  Text((proj['role'] ?? '') as String),
                  const SizedBox(height: 10),
                  Text("Tech & Tools",
                      style: Theme.of(ctx).textTheme.labelLarge),
                  const SizedBox(height: 6),
                  Wrap(
                    spacing: 8,
                    children: (proj['tech'] as List<String>)
                        .map((t) => Chip(label: Text(t)))
                        .toList(),
                  ),
                  const SizedBox(height: 10),
                  Text("Project Summary",
                      style: Theme.of(ctx).textTheme.labelLarge),
                  const SizedBox(height: 4),
                  Text(proj['desc'] as String),
                  const SizedBox(height: 10),
                  if (proj['planning'] != null) ...[
                    Text("Planning", style: Theme.of(ctx).textTheme.labelLarge),
                    const SizedBox(height: 4),
                    Text(proj['planning'] as String),
                    const SizedBox(height: 8),
                  ],
                  if (proj['challenges'] != null) ...[
                    Text("Challenges",
                        style: Theme.of(ctx).textTheme.labelLarge),
                    const SizedBox(height: 4),
                    Text(proj['challenges'] as String),
                    const SizedBox(height: 8),
                  ],
                  if (proj['overcome'] != null) ...[
                    Text("How I Overcame",
                        style: Theme.of(ctx).textTheme.labelLarge),
                    const SizedBox(height: 4),
                    Text(proj['overcome'] as String),
                    const SizedBox(height: 8),
                  ],
                  if (proj['impact'] != null) ...[
                    Text("Impact", style: Theme.of(ctx).textTheme.labelLarge),
                    const SizedBox(height: 4),
                    Text(proj['impact'] as String),
                  ],
                ],
              ),
            ),
            actions: [
              TextButton(
                  onPressed: () => Navigator.of(dctx).pop(),
                  child: const Text('Close')),
              if ((proj['links'] as Map)['website'] != null)
                TextButton(
                  onPressed: () {
                    Navigator.of(dctx).pop();
                    launchUrl(
                        Uri.parse((proj['links'] as Map)['website'] as String));
                  },
                  child: const Text('Open Website'),
                ),
            ],
          );
        },
      );
    }

    return Padding(
      padding: const EdgeInsets.all(24),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(Icons.workspace_premium,
                      color: Theme.of(context).colorScheme.primary, size: 28),
                  const SizedBox(width: 12),
                  Text(
                    "Selected Projects",
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          color: Theme.of(context).colorScheme.onSurface,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ],
              ),
              const SizedBox(height: 18),
              // Filter chips
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: _filters.map((tag) {
                    final selected = _selectedFilter == tag;
                    return Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: ChoiceChip(
                        label: Text(tag),
                        selected: selected,
                        onSelected: (_) => _applyFilter(tag),
                      ),
                    );
                  }).toList(),
                ),
              ),
              const SizedBox(height: 12),
              LayoutBuilder(builder: (ctx, constraints) {
                // responsive columns: 1 on narrow, 2 medium, 3 on wide
                final width = constraints.maxWidth;
                int columns = 1;
                if (width > 1200) {
                  columns = 3;
                } else if (width > 800) {
                  columns = 2;
                }

                final filtered = _projects
                    .where((p) =>
                        _selectedFilter == 'All' ||
                        (p['tags'] as List).contains(_selectedFilter))
                    .toList();

                return GridView.count(
                  crossAxisCount: columns,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  childAspectRatio: 1.25,
                  children: filtered.map((proj) {
                    final links = proj['links'] as Map<String, dynamic>;
                    final visible =
                        _visibleMap[proj['name'] as String] ?? false;
                    return AnimatedContainer(
                      duration: const Duration(milliseconds: 420),
                      transform:
                          Matrix4.translationValues(0, visible ? 0 : 12, 0),
                      curve: Curves.easeOut,
                      child: AnimatedOpacity(
                        duration: const Duration(milliseconds: 420),
                        opacity: visible ? 1.0 : 0.0,
                        child: Card(
                          elevation: 4,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16)),
                          color: Theme.of(context).colorScheme.surface,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              // hero area
                              Container(
                                height: 130,
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.vertical(
                                      top: Radius.circular(16)),
                                  gradient: LinearGradient(
                                    colors: [
                                      Theme.of(context)
                                          .colorScheme
                                          .primary
                                          .withAlpha((0.14 * 255).toInt()),
                                      Theme.of(context)
                                          .colorScheme
                                          .primary
                                          .withAlpha((0.04 * 255).toInt()),
                                    ],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                  ),
                                ),
                                child: Center(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(Icons.work_outline,
                                          size: 42,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onPrimary),
                                      const SizedBox(width: 12),
                                      Text(
                                        (proj['name'] as String)
                                            .split(' ')
                                            .map(
                                                (s) => s.isNotEmpty ? s[0] : '')
                                            .take(2)
                                            .join()
                                            .toUpperCase(),
                                        style: TextStyle(
                                            fontSize: 22,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .onPrimary,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(14.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(children: [
                                      Expanded(
                                        child: Text(proj['name'] as String,
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleMedium
                                                ?.copyWith(
                                                    fontWeight:
                                                        FontWeight.w700)),
                                      ),
                                      if (links['devFlag'] == true)
                                        Tooltip(
                                            message: 'In development',
                                            child:
                                                Chip(label: const Text('Dev'))),
                                    ]),
                                    const SizedBox(height: 6),
                                    Text((proj['role'] ?? '') as String,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall),
                                    const SizedBox(height: 8),
                                    Wrap(
                                        spacing: 6,
                                        runSpacing: 6,
                                        children: (proj['tech'] as List<String>)
                                            .take(6)
                                            .map((t) => Chip(
                                                label: Text(t),
                                                visualDensity:
                                                    VisualDensity.compact))
                                            .toList()),
                                    const SizedBox(height: 10),
                                    Text(
                                      (proj['desc'] as String).length > 160
                                          ? '${(proj['desc'] as String).substring(0, 156)}...'
                                          : proj['desc'] as String,
                                      style:
                                          Theme.of(context).textTheme.bodySmall,
                                    ),
                                    const SizedBox(height: 12),
                                    Row(
                                      children: [
                                        ElevatedButton(
                                          onPressed: () =>
                                              showCaseStudy(context, proj),
                                          child: const Text('View case study'),
                                        ),
                                        const SizedBox(width: 8),
                                        if (links['play'] != null)
                                          IconButton(
                                            tooltip: 'Play Store',
                                            onPressed: () => launchUrl(
                                                Uri.parse(
                                                    links['play'] as String)),
                                            icon: const Icon(Icons.android),
                                          ),
                                        if (links['website'] != null)
                                          IconButton(
                                            tooltip: 'Website',
                                            onPressed: () => launchUrl(
                                                Uri.parse(links['website']
                                                    as String)),
                                            icon: const Icon(Icons.language),
                                          ),
                                      ],
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                );
              })
            ],
          ),
        ),
      ),
    );
  }
}
