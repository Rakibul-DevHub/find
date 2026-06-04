import 'package:flutter/material.dart';
import 'utils/app_colors.dart';

class BigButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final VoidCallback onTap;
  final bool filled;

  const BigButton({
    super.key,
    required this.text,
    required this.icon,
    required this.onTap,
    this.filled = true,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 62,
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          backgroundColor: filled ? green : Colors.white,
          foregroundColor: filled ? Colors.white : green,
          side: filled ? null : const BorderSide(color: green, width: 2),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        ),
        onPressed: onTap,
        icon: Icon(icon),
        label: Text(text, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w900)),
      ),
    );
  }
}