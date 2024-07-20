import 'package:flutter/material.dart';

class NeuBox extends StatelessWidget {
  final Widget? child;

  const NeuBox({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 600,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.background,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: Colors.deepPurple,
            blurRadius: 5,
            offset: Offset(4, 4),
          ),
        ],
      ),
      padding: const EdgeInsets.all(12),
      child: child,
    );
  }
}
