class TempoModel {
  final double temperatura;
  final double sensacaoTermica;
  final double tempMaxima;
  final double tempMinima;
  final int humidade;
  final double vento;
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
