import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:line_up_front_end/config/colors.dart';


class SvgIcon extends StatelessWidget {
  final String iconName;
  final double size;
  final Color color;
  final Gradient? gradient;

  SvgIcon({
    required this.iconName,
    this.size = 30.0,
    this.color = AppColors.secondaryTextColor,
    this.gradient,
  });

  @override
  Widget build(BuildContext context) {
    return
      gradient != null
          ?
      ShaderMask(
        shaderCallback: (Rect bounds) {
          return gradient!.createShader(bounds);
        },
        child: _buildSvgPicture(),
      )
          : _buildSvgPicture();




  }

  SvgPicture _buildSvgPicture() {
    return SvgPicture.asset(
      'assets/icons/$iconName.svg',
      width: size,
      height: size,
      color: color,
    );
  }
}
