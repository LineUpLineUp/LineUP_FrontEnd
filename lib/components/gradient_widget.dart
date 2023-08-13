import 'package:flutter/cupertino.dart';
import 'package:line_up_front_end/components/colors.dart';

class GradientWidget extends StatelessWidget {
  final Widget child;
  final Gradient gradient;

  const GradientWidget({
    required this.child,
    this.gradient = AppColors.primaryGradient,
  });

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) =>
          gradient.createShader(
            Rect.fromLTWH(0, 0, bounds.width, bounds.height),
          ),
      child: child,
    );
  }
}