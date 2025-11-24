import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final TextEditingController _nameController = TextEditingController();
    final TextEditingController _emailController = TextEditingController();
    final TextEditingController _messageController = TextEditingController();

    return Card(
      color: Theme.of(context).colorScheme.surface,
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Contact",
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                color: Theme.of(context).colorScheme.onSurface,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 24),
            Text(
              "I’m always open to connecting with fellow professionals and exploring impactful opportunities. Feel free to reach out for collaboration, consulting, or to discuss exciting projects.",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: 24),
            Wrap(
              spacing: 20,
              children: [
                IconButton(
                  icon: const Icon(Icons.email),
                  tooltip: 'Email',
                  onPressed: () => launchUrl(Uri.parse("mailto:sureshksharma51100@gmail.com")),
                ),
                IconButton(
                  icon: const Icon(Icons.phone),
                  tooltip: 'Phone',
                  onPressed: () => launchUrl(Uri.parse("tel:+919119396072")),
                ),
                IconButton(
                  icon: const Icon(Icons.link),
                  tooltip: 'LinkedIn',
                  onPressed: () => launchUrl(Uri.parse("https://www.linkedin.com/in/suresh-kumar-sharma-60ba99182")),
                ),
                IconButton(
                  icon: const Icon(Icons.code),
                  tooltip: 'GitHub',
                  onPressed: () => launchUrl(Uri.parse("https://github.com/sureshksharma")),
                ),
              ],
            ),
            const SizedBox(height: 24),
            Card(
              color: Theme.of(context).colorScheme.surfaceContainerHighest,
              elevation: 2,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      TextFormField(
                        controller: _nameController,
                        decoration: const InputDecoration(
                          labelText: 'Name',
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) => value == null || value.isEmpty ? 'Please enter your name' : null,
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        controller: _emailController,
                        decoration: const InputDecoration(
                          labelText: 'Email',
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) => value == null || !value.contains('@') ? 'Please enter a valid email' : null,
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        controller: _messageController,
                        decoration: const InputDecoration(
                          labelText: 'Message',
                          border: OutlineInputBorder(),
                        ),
                        maxLines: 4,
                        validator: (value) => value == null || value.isEmpty ? 'Please enter your message' : null,
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton.icon(
                        icon: const Icon(Icons.send),
                        label: const Text('Send Message'),
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          textStyle: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        onPressed: () {
                          if (_formKey.currentState?.validate() ?? false) {
                            // In a real app, send the message via backend/email service
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Message sent!')),
                            );
                            _nameController.clear();
                            _emailController.clear();
                            _messageController.clear();
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),
            const Text("📍 Jaipur, Rajasthan, India"),
            const Text("🌍 Open to relocate worldwide"),
          ],
        ),
      ),
    );
  }
}
