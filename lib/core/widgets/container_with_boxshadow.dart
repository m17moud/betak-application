

import 'package:flutter/material.dart';

class ContainerWithBoxShadow extends StatelessWidget {
  const ContainerWithBoxShadow({super.key, this.child, this.height});
  final Widget? child;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black54.withOpacity(0.1),
              blurRadius: 10,
            ),
          ],
        ),
        child: child);
  }
}
