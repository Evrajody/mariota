import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as httptool;
import 'package:mariota/Tools/mariota_constant.dart';

// cette classe propose des services https
// Elle a une methode qui se charge de poster les informations ;
/* String name, String surname, String email, String password,
      String matricule, String filiere */

class HttpService {
  // Recupération brute des données ;
  static fetchedJokes() async {
    final reponse = await httptool.get(Uri.parse(baseUrl));
    var data = "data";
    if (reponse.statusCode == 200) {
      data = reponse.body;
      //debugPrint(data);
    }
    return jsonDecode(data);
  }
}
