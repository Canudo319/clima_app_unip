import 'package:clima_app/main_menu/location.dart';
import 'package:clima_app/widgets/default_card.dart';
import 'package:clima_app/widgets/information_button.dart';
import 'package:clima_app/widgets/loading.dart';
import 'package:clima_app/widgets/service_response.dart';
import 'package:flutter/material.dart';

class HomeApp extends StatefulWidget {
  const HomeApp({super.key});

  @override
  State<HomeApp> createState() => _HomeAppState();
}

class _HomeAppState extends State<HomeApp> {
  void funcRefresh() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Clima",
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 168, 226, 255),
        appBar: AppBar(
          actions: const [
            InformationButton(),
          ],
          backgroundColor: Colors.blue,
          title: const Text("Bem vindo ao Clima App"),
        ),
        body: FutureBuilder(
          future: UserLocation.getLocation(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return const ProgressIndicatorIndeterminado();
              default:
                if (snapshot.hasError) {
                  return DefaultCard(child: Text(snapshot.error.toString()));
                } else if (snapshot.hasData) {
                  var lat = snapshot.data?.latitude ?? 0.0;
                  var lon = snapshot.data?.longitude ?? 0.0;
                  return ClimaRequest(lat, lon);
                } else {
                  return const ClimaRequest(0.0, 0.0);
                }
            }
          },
        ),
      ),
    );
  }
}
