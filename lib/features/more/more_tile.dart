import 'package:flutter/material.dart';
import '../../utils/app_colors.dart';

class MoreTile extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;

  const MoreTile({super.key, required this.title, required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(24),
        child: Container(
          height: 76,
          padding: const EdgeInsets.symmetric(horizontal: 18),
          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(24), boxShadow: const [BoxShadow(color: Color(0x08000000), blurRadius: 10)]),
          child: Row(
            children: [
              Icon(icon, color: green, size: 30),
              const SizedBox(width: 14),
              Text(title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w900)),
            ],
          ),
        ),
      ),
    );
  }
}