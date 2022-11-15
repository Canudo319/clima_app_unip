import 'package:clima_app/widgets/default_card.dart';
import 'package:clima_app/widgets/search_city_dialog.dart';
import 'package:flutter/material.dart';

class ErrorCard extends StatelessWidget {
  final String texto;

  const ErrorCard(this.texto, {super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultCard(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "$texto\nque tal pesquisar pelo nome da cidade?",
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (_) {
                    return const SearchCityDialog();
                  });
            },
            child: const Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                "Pesquisar",
                style: TextStyle(fontSize: 18),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
