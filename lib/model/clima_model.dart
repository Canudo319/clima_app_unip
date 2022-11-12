import 'package:flutter/material.dart';

class ClimaModel {
  final int id;
  final String texto;
  final String descricao;
  final Image imagem;

  ClimaModel({
    required this.id,
    required this.texto,
    required this.descricao,
    required this.imagem,
  });

  static Image getImageBasedOnIcon(String iconName) {
    String baseUrl = "http://openweathermap.org/img/wn/$iconName.png";
    return Image.network(baseUrl);
  }
}
