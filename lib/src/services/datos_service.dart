import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:oms_app/src/models/datos_models.dart';


final _URL_COVID = 'https://api.covid19api.com';

class DatosPaisService with ChangeNotifier {

  List<Country> paises = [];

  Global mundo;

  DatosPaisService() {

    this.getPaises();
  }

  getPaises() async {
    
    final url = '$_URL_COVID/summary';
    final resp = await http.get(url);

    final datosResponse = datosPaisFromJson( resp.body );

    this.paises.addAll(datosResponse.countries);

    mundo = datosResponse.global;


    notifyListeners();
  }

}