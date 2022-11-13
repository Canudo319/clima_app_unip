import 'package:clima_app/model/tempo_model.dart';
import 'package:clima_app/widgets/default_card.dart';
import 'package:clima_app/widgets/loading.dart';
import 'package:flutter/material.dart';

import '../web_requests/clima_requests.dart';

class ClimaRequest extends StatelessWidget {
  final double lat, lon;

  const ClimaRequest(this.lat, this.lon, {super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Services.getClimaByLocation(lat, lon),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          var body = snapshot.data ?? {};
          var clima = TempoModel.fromMap(body);
          return DefaultCard(child: clima.imagem);
        } else {
          return const ProgressIndicatorIndeterminado();
        }
      },
    );
  }
}
