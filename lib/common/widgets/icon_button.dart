import 'package:flutter/material.dart';

class CustomIconButton extends StatefulWidget {
  final VoidCallback onPressed;
  final IconData icon;
  final Color iconColor;
  const CustomIconButton({super.key, required this.onPressed, required this.icon, required this.iconColor});

  @override
  State<CustomIconButton> createState() => _CustomIconButtonState();
}

class _CustomIconButtonState extends State<CustomIconButton> {
  @override
  Widget build(BuildContext context) {
    return IconButton(onPressed: widget.onPressed, icon: Icon(widget.icon,color: widget.iconColor,));
  }
}