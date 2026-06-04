import 'package:flutter/material.dart';

class SimplePage extends StatelessWidget {
  final String title;
  final String subtitle;
  final Widget child;

  const SimplePage({super.key, required this.title, required this.subtitle, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: const TextStyle(fontSize: 30, fontWeight: FontWeight.w900)),
              const SizedBox(height: 6),
              Text(subtitle, style: const TextStyle(color: Colors.grey, fontWeight: FontWeight.w600)),
              const SizedBox(height: 40),
              Expanded(child: child),
            ],
          ),
        ),
      ),
    );
  }
}