import 'package:flutter/material.dart';
import '../core/resources/color_manager.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({Key? key, required this.text, required this.function, this.margin = 0.0}) : super(key: key);
  final String text;
  final double margin;
  final void Function()? function;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: margin),
      width: 350.0,
      height: 50.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: AppColors.primaryColor,
      ),
      child: MaterialButton(
        onPressed: function,
        child:  Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontFamily: 'Inter',
            fontSize: 16.0,
          ),
        ),
      ),
    );
  }
}
