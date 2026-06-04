import 'package:flutter/material.dart';
import 'utils/app_colors.dart';

class CodeBadge extends StatelessWidget {
  final String code;
  final Color color;
  final Color bgColor;

  const CodeBadge(
    this.code, {
    super.key,
    this.color = green,
    this.bgColor = const Color(0xFFECFDF5),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
      decoration: BoxDecoration(color: bgColor, borderRadius: BorderRadius.circular(8)),
      child: Text(code, style: TextStyle(color: color, fontWeight: FontWeight.w900, fontSize: 12)),
    );
  }
}