import 'package:flutter/material.dart';

class IntegrantesView extends StatelessWidget {
  const IntegrantesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Integrantes"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          _IntegrantesLabel("CAINÃ R. CONTARIN", "N418DG3"),
          _IntegrantesLabel("EDUARDO RICHARD", "N4577E8"),
          _IntegrantesLabel("FILIPE FEITOSA", "D945467"),
          _IntegrantesLabel("GUILHERME CHINI", "D906FA0"),
          _IntegrantesLabel("GUILHERME MESQUITA", "N443FG2"),
        ],
      ),
    );
  }
}

class _IntegrantesLabel extends StatelessWidget {
  final String nome;
  final String ra;

  const _IntegrantesLabel(this.nome, this.ra);

  @override
  Widget build(BuildContext context) {
    const style = TextStyle(fontSize: 22);

    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                nome,
                style: style,
              ),
              Text(
                ra,
                style: style,
              ),
            ],
          ),
          const SizedBox(height: 15)
        ],
      ),
    );
  }
}
