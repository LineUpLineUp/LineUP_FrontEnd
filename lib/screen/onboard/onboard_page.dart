import 'package:flutter/material.dart';

abstract class OnboardingPage extends StatelessWidget{
  const OnboardingPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // background(),
        // blur(),
        content(context),
      ],
    );
  }
  Widget background();
  Widget blur(){
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.transparent,
            Colors.black.withOpacity(0.7),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
    );
  }

  Widget content(BuildContext context);
}