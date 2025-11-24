import 'package:flutter/material.dart';

class ImageFallback extends StatelessWidget {
  const ImageFallback({super.key, required this.title});

  final String? title;

  @override
  Widget build(BuildContext context) {
    final initial = (title ?? '').trim();
    final displayChar = initial.isNotEmpty ? initial[0].toUpperCase() : '?';
    return Container(
      color: Theme.of(context).colorScheme.surfaceContainerHighest,
      alignment: Alignment.center,
      child: Text(
        displayChar,
        style: Theme.of(context).textTheme.headlineSmall,
      ),
    );
  }
}
