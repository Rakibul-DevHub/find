import 'package:find/utils/app_colors.dart';
import 'package:flutter/material.dart';

class AppInput extends StatelessWidget {
  final String hint;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final IconData? prefixIcon;
  final ValueChanged<String>? onChanged;

  const AppInput({
    super.key,
    required this.hint,
    this.keyboardType,
    this.controller,
    this.prefixIcon,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      onChanged: onChanged,
      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
      decoration: InputDecoration(
        hintText: hint,
        prefixIcon: prefixIcon == null ? null : Icon(prefixIcon),
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(18), borderSide: const BorderSide(color: Color(0xFFE2E8F0))),
        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(18), borderSide: const BorderSide(color: Color(0xFFE2E8F0))),
        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(18), borderSide: const BorderSide(color: green, width: 2)),
      ),
    );
  }
}