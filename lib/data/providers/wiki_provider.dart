import 'dart:convert';

import 'package:http/http.dart'
    as http; //Melakukan request http dan menjadikannya seolah-olah variabel http
import 'package:udemy_bloc/data/models/wiki_model.dart';

class WikiProvider {
  Future<Map<String, dynamic>> getDataWiki() async {
    try {
      Uri url = Uri.parse("https://cinnabar.icaksh.my.id/public/daily/tawiki");
      var response = await http.get(url);

      if (response.statusCode != 200) {
        //200 adalah suatu kode yang mengisyaratkan bahwa success/berhasil dan selain 200 seperti 404 mengisyaratkan bahwa terdapat kegagalan/error
        return {
          "error": true,
          "message": "${response.statusCode}",
        };
      }

      Map<String, dynamic> body = jsonDecode(response
          .body); //Proses mengubah data awal yang berupa string json (response.body) menjadi Map<String, dynamic> sehingga memudahkan untuk pengaksesan dan disimpan sebagai variabel body

      return {
        "error": false,
        "message": "Berhasil get data wiki",
        "info": WikiModel.fromJson(
            body), //Berkorelasi dengan class user_model yang mana terdapat method / proses disana, yang menyimpan data-data layaknya sebuah object constructor
      };
    } catch (e) {
      return {
        "error": true,
        "message": "$e",
      };
    }
  }
}
