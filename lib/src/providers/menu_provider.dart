import 'dart:convert';
import 'package:flutter/services.dart';

class _MenuProvider {

  List<dynamic> opciones = [];

  // Lectura De Un Archivo JSON
  Future<List<dynamic>> cargarData() async {
    final resp = await rootBundle.loadString('assets/menu_opts.json');
    Map dataMap = json.decode(resp);
    opciones = dataMap['rutas'];
    return opciones;
  }

}

final menuProvider = _MenuProvider();
