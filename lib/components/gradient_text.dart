import 'package:flutter/material.dart';

class GradientText extends StatelessWidget {
  final String text;
  final Gradient gradient;
  final double? fontSize;
  final FontWeight? fontWeight;

  const GradientText({
    super.key,
    required this.text,
    required this.gradient,
    this.fontSize,
    this.fontWeight,
  });

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) => gradient.createShader(
        Rect.fromLTWH(0, 0, bounds.width, bounds.height),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: Colors.white,
        ),
      ),
    );
  }
}
