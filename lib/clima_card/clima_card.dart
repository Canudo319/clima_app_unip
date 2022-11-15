import 'package:cached_network_image/cached_network_image.dart';
import 'package:clima_app/model/tempo_model.dart';
import 'package:clima_app/widgets/botoes_pesquisa.dart';
import 'package:clima_app/widgets/default_card.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

class ClimaCard extends StatelessWidget {
  final TempoModel tempo;
  final void Function(Widget) setHomeScreen;

  const ClimaCard(this.tempo, this.setHomeScreen, {super.key});

  @override
  Widget build(BuildContext context) {
    const style = TextStyle(fontSize: 24);

    return DefaultCard(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 25, 20, 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            _CidadeInfo(tempo.cidade, style),
            const SizedBox(height: 10),
            const Divider(thickness: 2),
            _ClimaInfo(tempo, style),
            const Divider(thickness: 2),
            const SizedBox(height: 10),
            _TemperaturaInfo(tempo),
            const SizedBox(height: 10),
            const Divider(thickness: 2),
            const SizedBox(height: 10),
            _MiscInfo(tempo),
            const SizedBox(height: 5),
            const Divider(thickness: 2),
            Expanded(child: BotoesPesquisa(setHomeScreen)),
          ],
        ),
      ),
    );
  }
}

class _CidadeInfo extends StatelessWidget {
  final String cidade;
  final TextStyle style;

  const _CidadeInfo(this.cidade, this.style);

  @override
  Widget build(BuildContext context) {
    DateTime date = DateTime.now();
    initializeDateFormatting('pt_BR', null);
    var data =
        DateFormat(DateFormat.YEAR_MONTH_DAY, 'pt_Br').format(date.toUtc());

    return Text(
      "$cidade, $data",
      style: style,
      textAlign: TextAlign.center,
    );
  }
}

class _ClimaInfo extends StatelessWidget {
  final TempoModel tempo;
  final TextStyle style;

  const _ClimaInfo(this.tempo, this.style);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(tempo.climaDescricao, style: style),
          CircleAvatar(
            radius: 45,
            backgroundColor: const Color.fromARGB(255, 168, 226, 255),
            child: CachedNetworkImage(
              imageUrl: tempo.urlImagem,
              placeholder: (context, url) => const CircularProgressIndicator(),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
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
          Icons.thermostat,
          "Temp.",
        ),
        _TemperaturaIcon(
          tempo.tempMaxima.toString(),
          Icons.local_fire_department,
          "Max.",
        ),
        _TemperaturaIcon(
          tempo.tempMinima.toString(),
          Icons.severe_cold,
          "Min.",
        ),
        _TemperaturaIcon(
          tempo.sensacaoTermica.toString(),
          Icons.thermostat_auto,
          "Sens.",
        ),
      ],
    );
  }
}

class _TemperaturaIcon extends StatelessWidget {
  final String info;
  final IconData icon;
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
        Icon(icon, size: 40),
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
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _MiscIcon(
              info: "${tempo.vento} Km/h",
              icon: Icons.arrow_forward,
              description: "Vento",
              degress: tempo.ventoDirecao,
            ),
            _MiscIcon(
              info: "${tempo.nuvens}%",
              icon: Icons.cloud,
              description: "Nuvens",
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _MiscIcon(
              info: "${tempo.humidade}%",
              icon: Icons.water,
              description: "Humidade",
            ),
            _MiscIcon(
              info: "${tempo.visibilidade / 1000} Km",
              icon: Icons.remove_red_eye,
              description: "Visibilidade",
            ),
          ],
        ),
      ],
    );
  }
}

class _MiscIcon extends StatelessWidget {
  final String info;
  final IconData icon;
  final String description;
  final num? degress;

  const _MiscIcon({
    required this.info,
    required this.icon,
    required this.description,
    this.degress,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Transform.rotate(
          angle: degress?.toDouble() ?? 0.0,
          child: Icon(icon, size: 48),
        ),
        const SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(info, style: const TextStyle(fontSize: 16)),
            Text(description, style: const TextStyle(fontSize: 12)),
          ],
        )
      ],
    );
  }
}
