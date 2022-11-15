import 'package:clima_app/clima_card/welcome_card.dart';
import 'package:clima_app/widgets/information_button.dart';
import 'package:flutter/material.dart';

class HomeApp extends StatefulWidget {
  const HomeApp({super.key});

  @override
  State<HomeApp> createState() => _HomeAppState();
}

class _HomeAppState extends State<HomeApp> {
  late Widget homeScreenWidget = WelcomeCard(setHomeScreenWidget);

  void funcRefresh() {
    setState(() {});
  }

  void setHomeScreenWidget(Widget w) {
    setState(() {
      homeScreenWidget = w;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Clima",
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: const Color.fromARGB(255, 168, 226, 255),
        appBar: AppBar(
          actions: const [
            InformationButton(),
          ],
          backgroundColor: Colors.blue,
          title: const Text("Bem vindo ao Clima App"),
        ),
        body: homeScreenWidget,
      ),
    );
  }
}
