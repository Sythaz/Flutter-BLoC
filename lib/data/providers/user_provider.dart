import 'dart:convert';

import 'package:http/http.dart'
    as http; //Melakukan request http dan menjadikannya seolah-olah variabel http
import 'package:udemy_bloc/data/models/user_model.dart';

/*  1. Bertindak sebagai perantara antara project dan data JSON atau penghubung data JSON ke project.
    2. Belum menyimpan data JSON. Yang menyimpan adalah userModel
    3. Menyediakan akses ke data JSON.
    4. Terhubung dengan BLoC.
*/
class UserProvider {
  Future<Map<String, dynamic>> getUserProvider() async {
    try {
      Uri url = Uri.parse(
          "https://reqres.in/api/users"); //Sebuah class yang mengubah (parse) string sebuah link menjadi bisa dipakai
      var response = await http.get(
          url); //Sebuah proses meminta pengambilan atau dikirimkan data pada url, sehingga kita memiliki data-datanya pada var response. Namun butuh class model untuk menyimpan data-data tersebut

      if (response.statusCode != 200) {
        //200 adalah suatu kode yang mengisyaratkan bahwa success/berhasil dan selain 200 seperti 404 mengisyaratkan bahwa terdapat kegagalan/error
        return {
          "error": true,
          "message": "${response.statusCode}",
        };
      }

      /*
    Mengubah data JSON menjadi map dart menggunakan jsonDecode, lalu dimasukkan kedalam UserModel menggunakan fromJson
    */

      Map<String, dynamic> body = jsonDecode(response
          .body); //Proses mengubah data awal yang berupa string json (response.body) menjadi Map<String, dynamic> sehingga memudahkan untuk pengaksesan dan disimpan sebagai variabel body

      return {
        "error": false,
        "message": "Berhasil get data user",
        "data": UserModel.fromJson(
            body) //Berkorelasi dengan class user_model yang mana terdapat method / proses disana, yang menyimpan data-data layaknya sebuah object constructor
      };
    } catch (e) {
      return {
        "error": true,
        "message": "$e",
      };
    }
  }
}
