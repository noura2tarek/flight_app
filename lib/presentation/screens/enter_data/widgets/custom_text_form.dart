import 'package:flutter/material.dart';

import '../../../core/resources/color_manager.dart';

class CustomTextForm extends StatelessWidget {
  const CustomTextForm({Key? key, required this.hintText, required this.type, required this.controller}) : super(key: key);
  final String? hintText;
  final TextInputType type;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.0,
      width: 350.0,
      child: TextFormField(
        controller: controller,
        keyboardType: type,
        style: TextStyle(
          color: AppColors.formFillColor,
        ),
        decoration: InputDecoration(
          hintText: hintText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide(color: AppColors.primaryColor),
          ),
        ),
      ),
    );
  }
}
