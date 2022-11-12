import 'package:clima_app/model/clima_model.dart';
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
          var body = snapshot.data;
          Map weather = body?["weather"][0];
          var clima = ClimaModel(
            id: weather["id"],
            texto: weather["main"],
            descricao: weather["description"],
            imagem: ClimaModel.getImageBasedOnIcon(weather["icon"]),
          );
          return clima.imagem;
        } else {
          return const Text("null");
        }
      },
    );
  }
}
