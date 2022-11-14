import 'package:cached_network_image/cached_network_image.dart';
import 'package:clima_app/model/tempo_model.dart';
import 'package:clima_app/widgets/default_card.dart';
import 'package:flutter/material.dart';

class ClimaCard extends StatelessWidget {
  final TempoModel tempo;

  const ClimaCard(this.tempo, {super.key});

  @override
  Widget build(BuildContext context) {
    const style = TextStyle(fontSize: 24);

    return DefaultCard(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 25, 20, 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(tempo.cidade, style: style),
            const SizedBox(height: 10),
            const Divider(thickness: 2),
            _ClimaInfo(tempo, style),
            const Divider(thickness: 2),
            const SizedBox(height: 10),
            _TemperaturaInfo(tempo),
            const SizedBox(height: 10),
            const Divider(thickness: 2),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}

class _ClimaInfo extends StatelessWidget {
  final TempoModel tempo;
  final TextStyle style;

  const _ClimaInfo(this.tempo, this.style);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 175,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(tempo.climaDescricao, style: style),
          CachedNetworkImage(
            imageUrl: tempo.urlImagem,
            placeholder: (context, url) => const CircularProgressIndicator(),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
        ],
      ),
    );
  }
}

class _TemperaturaInfo extends StatelessWidget {
  final TempoModel tempo;
  const _TemperaturaInfo(this.tempo);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _TemperaturaIcon(
          tempo.temperatura.toString(),
          const Icon(Icons.thermostat, size: 40),
          "Temp.",
        ),
        _TemperaturaIcon(
          tempo.tempMaxima.toString(),
          const Icon(Icons.local_fire_department, size: 40),
          "Max.",
        ),
        _TemperaturaIcon(
          tempo.tempMinima.toString(),
          const Icon(Icons.severe_cold, size: 40),
          "Min.",
        ),
        _TemperaturaIcon(
          tempo.sensacaoTermica.toString(),
          const Icon(Icons.thermostat_auto, size: 40),
          "Sens.",
        ),
      ],
    );
  }
}

class _TemperaturaIcon extends StatelessWidget {
  final String info;
  final Icon icon;
  final String description;

  const _TemperaturaIcon(this.info, this.icon, this.description);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "$info °C",
          style: const TextStyle(fontSize: 14),
        ),
        icon,
        Text(description),
      ],
    );
  }
}

class _MiscInfo extends StatelessWidget {
  final TempoModel tempo;

  const _MiscInfo(this.tempo);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
