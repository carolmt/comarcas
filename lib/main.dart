import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:io';



class Comarca {

  String comarca;
  String? capital;
  String? poblacion;
  String? img;
  String? desc;
  double? latitud;
  double? longitud;

  Comarca({ //Constructor con Argumentos por nombre:
    required this.comarca,
    this.capital,
    this.poblacion,
    this.img,
    this.desc,
    this.latitud,
    this.longitud,
  });

  /*Comarca.fromJSON(Map<String , dynamic> json) {
    comarca = json['comarca'] ?? "No disponible" ;
    capital = json['capital'] ?? "No disponible";
    poblacion = json['poblacion'] ?? "No disponible";
    img = json['img']?? "No disponible";
    desc = json['desc'] ?? "No disponible";
    latitud = json['latitud']?.toDouble();
    longitud = json['longitud']?.toDouble();
  }*/


  @override
  String toString() {
    return '''
    \nnombre: $comarca
    \ncapital: $capital
    \npoblación: $poblacion
    \nimagen: $img
    \ndescripción: $desc
    \ncoordenadas: ($latitud, $longitud)
    ''';
  }

}

void main(List<String> args) async {
  var reader = stdin;

  String eleccion;

  do {
    eleccion = menu();

    switch (eleccion) {
      case "1":
        {
          print("Introduce el nombre de la provincia: ");
          String provincia = utf8.decode(stdin.readLineSync()!.codeUnits);

          if (provincia == null || provincia.isEmpty) {
            print("Nombre de provincia inválido.");
            break;
          }

          String url = 'https://node-comarques-rest-server-production.up.railway.app/api/comarques/$provincia';
          var response = await http.get(Uri.parse(url));

          if (response.statusCode == 200) {
            String body = utf8.decode(response.bodyBytes);
            final bodyJSON = jsonDecode(body) as List;
            print(bodyJSON.toString());
          }
          else {
            print("Error, provincia no encontrada.");
          }
          break;
        }

      case "2":
        {
          print("Introduce el nombre de la comarca: ");
          String comarca = utf8.decode(stdin.readLineSync()!.codeUnits);

          if (comarca == null || comarca.isEmpty) {
            print("Nombre de la comarca inválida.");
            break;
          }

          String url = 'https://node-comarques-rest-server-production.up.railway.app/api/comarques/infoComarca/$comarca';
          var response = await http.get(Uri.parse(url));

          if (response.statusCode == 200) {
            String body = utf8.decode(response.bodyBytes);
            final bodyJSON = jsonDecode(body) as Map<String, dynamic>;
            print(bodyJSON.toString());
          }
          else {
            print("Error, comarca no encontrada.");
          }
          break;
        }

      case "3":
        {
          print("Adiós.");
          break;
        }
      default:
        {
          print("Opción no válida.");
          eleccion = menu();
        }
    }
  } while (eleccion != "3");

}

String menu () {
  print("1. Listado de comarcas de una provincia. \n2. Información de una comarca. \n3. Salir");
  var reader = stdin;
  String eleccion = reader.readLineSync()!;

  return eleccion;
}




