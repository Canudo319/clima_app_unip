import 'package:flutter/material.dart';

class ProgressIndicatorIndeterminado extends StatelessWidget {
  const ProgressIndicatorIndeterminado({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: const Color.fromRGBO(66, 192, 255, 0.2),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text(
            "Carregando...",
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 15),
          CircularProgressIndicator(
            semanticsLabel: 'Circular progress indicator',
          ),
        ],
      ),
    );
  }
}
