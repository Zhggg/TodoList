import 'package:flutter/material.dart';

import 'package:todolist/utils/constants/color.dart';

class CustomTextField extends StatefulWidget {
  final String label;
  final IconData icon;

  final TextEditingController? controller;
  final bool addSuffix;

  const CustomTextField({
    super.key,
    required this.label,
    required this.icon,
    required this.controller,
    this.addSuffix = false,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool passwordVisible = false;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      keyboardType: TextInputType.name,
      decoration: InputDecoration(
        labelText: widget.label,
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
        prefixIcon: Icon(widget.icon, color: AppColors.primaryColor),
        suffixIcon: widget.addSuffix
            ? GestureDetector(
                onTap: () {
                  setState(() {
                    passwordVisible = !passwordVisible;
                  });
                },
                child: Icon(
                  passwordVisible ? Icons.visibility_off : Icons.visibility,
                  size: 20,
                ),
              )
            : null,
        prefixIconConstraints: const BoxConstraints(minWidth: 40),
      ),
    );
  }
}
