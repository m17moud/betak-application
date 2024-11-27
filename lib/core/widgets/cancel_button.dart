import 'package:flutter/material.dart';

import '../utils/styles.dart';

class CancelButton extends StatelessWidget {
  const CancelButton({
    super.key, this.onTap,
  });
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
          padding: const EdgeInsets.only(bottom: 6),
          child: GestureDetector(
            onTap: onTap,
            child: const Text('Cancel',style: Styles.styleBoldInriaSans16,
            ),
          )),
    );
  }
}
