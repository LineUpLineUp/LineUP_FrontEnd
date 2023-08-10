import 'package:flutter/material.dart';
import 'package:line_up_front_end/components/colors.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  PrimaryButton({required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      //버튼 테두리 radius 설정
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 17),
        backgroundColor: AppColors.primaryButtonColor, // primary color for the button
        minimumSize: Size(double.infinity, 50), // 가로를 꽉 차게 설정
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Text(
          text,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
      ),
    );
  }
}
class AccentButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  AccentButton({required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,

      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.accentColor, // accent color for the button
        foregroundColor: Colors.black, // text color
        // Add other customizations if needed
      ),
      child: Text(text),
    );
  }
}