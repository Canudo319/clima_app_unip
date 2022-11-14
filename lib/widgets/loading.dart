import 'package:clima_app/widgets/default_card.dart';
import 'package:flutter/material.dart';

class ProgressIndicatorIndeterminado extends StatelessWidget {
  const ProgressIndicatorIndeterminado({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultCard(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text(
            "Carregando...",
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 15),
          CircularProgressIndicator(),
        ],
      ),
    );
  }
}
