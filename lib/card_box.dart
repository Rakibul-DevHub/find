import 'package:flutter/material.dart';

class CardBox extends StatelessWidget {
  final Widget child;
  final Color? borderColor;
  final double marginBottom;

  const CardBox({
    super.key,
    required this.child,
    this.borderColor,
    this.marginBottom = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: marginBottom),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: borderColor ?? Colors.transparent, width: borderColor == null ? 0 : 2),
        boxShadow: const [BoxShadow(color: Color(0x08000000), blurRadius: 10)],
      ),
      child: child,
    );
  }
}