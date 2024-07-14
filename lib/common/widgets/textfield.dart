import 'package:flutter/material.dart';
import 'package:todolist/utils/constants/color/color.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final IconData icon;
  final TextEditingController? controller;

  const CustomTextField({
    super.key,
    required this.label,
    required this.icon,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.name,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: Theme.of(context).textTheme.bodySmall,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide:
              const BorderSide(color: AppColors.primaryColor, width: 1.7),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: const BorderSide(color: AppColors.darkGrey, width: 1.7),
        ),
        prefixIcon: Icon(icon, color: AppColors.primaryColor),
        prefixIconConstraints: const BoxConstraints(minWidth: 40),
      ),
    );
  }
}
