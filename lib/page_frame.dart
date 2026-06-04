import 'package:flutter/material.dart';
import 'app_header.dart';

class PageFrame extends StatelessWidget {
  final String title;
  final String subtitle;
  final Widget child;
  final bool showBack;

  const PageFrame({super.key, required this.title, required this.subtitle, required this.child, this.showBack = false});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          AppHeader(title: title, subtitle: subtitle),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(18),
              children: [
                if (showBack)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: TextButton.icon(
                        onPressed: () => Navigator.pop(context),
                        icon: const Icon(Icons.arrow_back),
                        label: const Text('ফিরে যান'),
                      ),
                    ),
                  ),
                child,
              ],
            ),
          ),
        ],
      ),
    );
  }
}