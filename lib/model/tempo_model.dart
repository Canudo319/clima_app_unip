import 'package:flutter/material.dart';

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
  final Image imagem;

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
    required this.imagem,
  });

  factory TempoModel.fromMap(Map map) {
    return TempoModel(
      temperatura: map["main"]["temp"],
      sensacaoTermica: map["main"]["feels_like"],
      tempMaxima: map["main"]["temp_min"],
      tempMinima: map["main"]["temp_max"],
      humidade: map["main"]["humidity"],
      vento: map["wind"]["speed"],
      cidade: map["name"],
      climaTexto: map["weather"][0]["main"],
      climaDescricao: map["weather"][0]["description"],
      imagem: _getImageBasedOnIcon(map["weather"][0]["icon"]),
    );
  }

  static Image _getImageBasedOnIcon(String iconName) {
    String baseUrl = "http://openweathermap.org/img/wn/$iconName@4x.png";
    return Image.network(baseUrl);
  }
}
