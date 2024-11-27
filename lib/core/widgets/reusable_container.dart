import 'package:flutter/material.dart';

class ReusableContainer extends StatelessWidget {
  const ReusableContainer(
      {super.key,
      required this.childWidget,
      required this.backgroundImage, this.boxFit,
      });

  final Widget childWidget;
  final String backgroundImage;
  final BoxFit? boxFit;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage(backgroundImage),
            fit: boxFit ?? BoxFit.contain,
            alignment: Alignment.topRight),
      ),
      child: childWidget,
    );
  }
}
