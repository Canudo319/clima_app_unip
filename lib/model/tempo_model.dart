class TempoModel {
  final num temperatura;
  final num sensacaoTermica;
  final num tempMaxima;
  final num tempMinima;
  final int humidade;
  final num vento;
  final num ventoDirecao;
  final num nuvens;
  final num visibilidade;
  final String cidade;
  final String climaTexto;
  final String climaDescricao;
  final String urlImagem;

  TempoModel({
    required this.temperatura,
    required this.sensacaoTermica,
    required this.tempMaxima,
    required this.tempMinima,
    required this.humidade,
    required this.vento,
    required this.ventoDirecao,
    required this.nuvens,
    required this.visibilidade,
    required this.cidade,
    required this.climaTexto,
    required this.climaDescricao,
    required this.urlImagem,
  });

  factory TempoModel.fromMap(Map map) {
    return TempoModel(
      temperatura: map["main"]["temp"],
      sensacaoTermica: map["main"]["feels_like"],
      tempMaxima: map["main"]["temp_max"],
      tempMinima: map["main"]["temp_min"],
      humidade: map["main"]["humidity"],
      vento: map["wind"]["speed"],
      ventoDirecao: map["wind"]["deg"],
      nuvens: map["clouds"]["all"],
      visibilidade: map["visibility"],
      cidade: map["name"],
      climaTexto: map["weather"][0]["main"],
      climaDescricao: _capitalize(map["weather"][0]["description"]),
      urlImagem: _getImageBasedOnIcon(map["weather"][0]["icon"]),
    );
  }

  static String _capitalize(String s) {
    return "${s[0].toUpperCase()}${s.substring(1).toLowerCase()}";
  }

  static String _getImageBasedOnIcon(String iconName) {
    return "http://openweathermap.org/img/wn/$iconName@4x.png";
  }
}
