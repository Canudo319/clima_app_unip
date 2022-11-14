import 'package:clima_app/clima_card/clima_card.dart';
import 'package:clima_app/model/tempo_model.dart';
import 'package:clima_app/widgets/loading.dart';
import 'package:flutter/material.dart';

import '../web_requests/clima_requests.dart';

class ClimaRequest extends StatefulWidget {
  final double lat, lon;

  const ClimaRequest(this.lat, this.lon, {super.key});

  @override
  State<ClimaRequest> createState() => _ClimaRequestState();
}

class _ClimaRequestState extends State<ClimaRequest> {
  void funcRefresh() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Services.getClimaByLocation(widget.lat, widget.lon),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return const ProgressIndicatorIndeterminado();
          default:
            var body = snapshot.data ?? {};
            var tempo = TempoModel.fromMap(body);
            return ClimaCard(tempo, funcRefresh);
        }
      },
    );
  }
}
