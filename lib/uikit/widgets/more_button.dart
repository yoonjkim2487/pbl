import 'package:flutter/material.dart';

class MoreButton extends StatelessWidget {
  final VoidCallback onPressed;

  const MoreButton({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.more_horiz),
      onPressed: onPressed,
    );
  }
}
