import 'package:clima_app/widgets/botoes_pesquisa.dart';
import 'package:clima_app/widgets/default_card.dart';
import 'package:flutter/material.dart';

class WelcomeCard extends StatelessWidget {
  final void Function(Widget) setHomeScreen;

  const WelcomeCard(this.setHomeScreen, {super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultCard(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            "Selecione um metodo de pesquisa",
            style: TextStyle(fontSize: 24),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          BotoesPesquisa(setHomeScreen),
        ],
      ),
    );
  }
}
