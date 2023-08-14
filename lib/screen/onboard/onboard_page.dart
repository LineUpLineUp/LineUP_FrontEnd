import 'dart:ui';

import 'package:flutter/material.dart';

abstract class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        background(),
        blur(),
        content(context),
      ],
    );
  }

  Widget background();

  Widget blur() {
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 7, sigmaY: 7),
        child: Container(
          color: Color(0x1912171F).withOpacity(0.1),
        ),
      ),
    );
  }

  Widget content(BuildContext context);
}
