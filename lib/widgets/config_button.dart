import 'package:clima_app/integrantes_menu/integrantes_view.dart';
import 'package:flutter/material.dart';

class ConfigButton extends StatelessWidget {
  const ConfigButton({super.key});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute<void>(
              builder: (BuildContext context) => const IntegrantesView()),
        );
      },
      shape: const CircleBorder(),
      child: const Icon(
        Icons.info_outline,
        color: Colors.white,
        size: 30,
      ),
    );
  }
}
