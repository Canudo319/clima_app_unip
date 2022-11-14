import 'package:flutter/material.dart';

class DefaultCard extends StatelessWidget {
  final Widget child;

  const DefaultCard({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Card(
        margin: const EdgeInsets.only(
          left: 20.0,
          right: 20.0,
          top: 60.0,
          bottom: 50.0,
        ),
        child: child,
      ),
    );
  }
}
