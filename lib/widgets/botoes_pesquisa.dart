import 'package:clima_app/clima_card/error_card.dart';
import 'package:clima_app/main_menu/location.dart';
import 'package:clima_app/widgets/loading.dart';
import 'package:clima_app/widgets/search_city_dialog.dart';
import 'package:clima_app/widgets/service_response.dart';
import 'package:flutter/material.dart';

class BotoesPesquisa extends StatelessWidget {
  final void Function(Widget) setHomeScreen;

  const BotoesPesquisa(this.setHomeScreen, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _ActionButton(Icons.search, () {
          showDialog(
              context: context,
              builder: (_) {
                return SearchCityDialog(setHomeScreen);
              });
        }, "Pesquisa"),
        _ActionButton(Icons.navigation_outlined, () {
          setHomeScreen(FutureBuilder(
            future: UserLocation.getLocation(),
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.waiting:
                  return const ProgressIndicatorIndeterminado();
                default:
                  if (snapshot.hasError) {
                    return ErrorCard(
                      "Ops, parece que o Gps não está disponivel",
                      setHomeScreen,
                    );
                  } else if (snapshot.hasData) {
                    return ClimaRequest.porLocalidade(
                        snapshot.data, setHomeScreen);
                  } else {
                    return ErrorCard("Algo deu errado", setHomeScreen);
                  }
              }
            },
          ));
        }, "Localização"),
      ],
    );
  }
}

class _ActionButton extends StatelessWidget {
  final IconData icone;
  final void Function() func;
  final String textDescr;

  const _ActionButton(this.icone, this.func, this.textDescr, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RawMaterialButton(
          onPressed: () {
            func();
          },
          shape: const CircleBorder(),
          child: SizedBox(
            width: 60,
            height: 60,
            child: Icon(icone, size: 35),
          ),
        ),
        Text(textDescr),
      ],
    );
  }
}
