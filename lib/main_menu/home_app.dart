import 'package:clima_app/main_menu/location.dart';
import 'package:clima_app/web_requests/clima_requests.dart';
import 'package:clima_app/widgets/config_button.dart';
import 'package:flutter/material.dart';

class HomeApp extends StatelessWidget {
  const HomeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Clima",
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          actions: const [
            ConfigButton(),
          ],
          backgroundColor: Colors.blue,
          title: const Text("Bem vindo ao Clima App"),
        ),
        body: FutureBuilder(
          future: UserLocation.getLocation(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            } else if (snapshot.hasData) {
              var lat = snapshot.data?.latitude ?? 0.0;
              var lon = snapshot.data?.longitude ?? 0.0;
              return FutureBuilder(
                future: Services.getClimaByLocation(lat, lon),
                builder: (context, snapshot) {
                  return Text(snapshot.data?.toString() ?? "null");
                },
              );
            } else {
              return const Text("Sem valor");
            }
          },
        ),
      ),
    );
  }
}
