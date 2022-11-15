import 'package:clima_app/clima_card/clima_card.dart';
import 'package:clima_app/clima_card/error_card.dart';
import 'package:clima_app/model/tempo_model.dart';
import 'package:clima_app/widgets/loading.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart';

import '../web_requests/clima_requests.dart';

class ClimaRequest extends StatelessWidget {
  final double? lat;
  final double? lon;
  final String? city;
  final bool searchByName;
  final void Function(Widget) setHomeScreen;

  const ClimaRequest({
    super.key,
    this.lat,
    this.lon,
    this.city,
    required this.searchByName,
    required this.setHomeScreen,
  });

  factory ClimaRequest.porLocalidade(
      LocationData? locationData, void Function(Widget) setHomeScreen) {
    return ClimaRequest(
      lat: locationData?.latitude ?? 0.0,
      lon: locationData?.longitude ?? 0.0,
      searchByName: false,
      setHomeScreen: setHomeScreen,
    );
  }

  factory ClimaRequest.porNome(
      String city, void Function(Widget) setHomeScreen) {
    return ClimaRequest(
      city: city,
      searchByName: true,
      setHomeScreen: setHomeScreen,
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: () {
        if (searchByName) {
          return Services.getClimaByName(city ?? "");
        } else {
          return Services.getClimaByLocation(lat ?? 0.0, lon ?? 0.0);
        }
      }(),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return const ProgressIndicatorIndeterminado();
          default:
            var body = snapshot.data ?? {};
            if (body["cod"] != 200) {
              return ErrorCard(
                  "Cidade informada não encontrada", setHomeScreen);
            }
            var tempo = TempoModel.fromMap(body);
            return ClimaCard(tempo, setHomeScreen);
        }
      },
    );
  }
}
