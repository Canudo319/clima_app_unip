import 'package:clima_app/widgets/service_response.dart';
import 'package:flutter/material.dart';

class SearchCityDialog extends StatelessWidget {
  final void Function(Widget) setHomeScreen;

  const SearchCityDialog(this.setHomeScreen, {super.key});

  @override
  Widget build(BuildContext context) {
    String cidade = "";

    return AlertDialog(
      title: const Text("Pesquisar por cidade"),
      content: TextFormField(
        style: const TextStyle(
          fontSize: 20,
        ),
        onChanged: (String s) {
          cidade = s;
        },
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text("Cancelar"),
        ),
        TextButton(
          onPressed: () {
            if (cidade.isEmpty) {
              showDialog(
                  context: context,
                  builder: (_) {
                    return const AlertDialog(
                      content: Text(
                        "Cidade não pode ser váiza",
                      ),
                    );
                  });
            } else {
              setHomeScreen(ClimaRequest.porNome(cidade, setHomeScreen));
              Navigator.pop(context);
            }
          },
          child: const Text("Ok"),
        ),
      ],
    );
  }
}
