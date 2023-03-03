import 'package:flutter/material.dart';

import '../../../theme/app_colors.dart';
import '../../../theme/app_fonts.dart';

class CustomtextField extends StatefulWidget {
  const CustomtextField({
    Key? key,
    required this.lableText,
    required this.controller,
    required this.onChanged,
  }) : super(key: key);
  final String lableText;
  final TextEditingController controller;
  final Function(String)? onChanged;

  @override
  State<CustomtextField> createState() => _CustomtextFieldState();
}

class _CustomtextFieldState extends State<CustomtextField> {
  @override
  Widget build(BuildContext context) {
  String? errorText;
    return TextField(
      onChanged: widget.onChanged,
      controller: widget.controller,
      decoration: InputDecoration(
         errorText: errorText,
          fillColor: AppColors.white.withOpacity(0.1),
          label: Text(
            widget.lableText,
            style: AppFonts.w600s15.copyWith(color: AppColors.white),
          ),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(14))),
    );
  }
}
