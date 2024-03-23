import 'dart:math';

import 'package:udemy_bloc/data/models/gabungan_model.dart';
import 'package:udemy_bloc/data/models/user_model.dart';
import 'package:udemy_bloc/data/models/wiki_model.dart';
import 'package:udemy_bloc/data/providers/user_provider.dart';
import 'package:udemy_bloc/data/providers/wiki_provider.dart';

/*
Sebuah file/class yang berfungsi sebagai pengambil dan penggabung antara data User dan data Wiki, sehingga
kedua data tersebut menjadi satu di dalam model baru yaitu {gabungan_model} class ini juga terdapat extension class sehingga
di dalam class ini bisa memanggil/mendapatkan sebuah data secara acak (random).

Kegunaan: 1. Penggabungan data user dan data wiki di 1 model
          2. Mengacak data mana yang akan dipanggil dengan extension
*/

class GabunganRandomRepository {
  /*
  Sebuah instance atau class yang berfungsi untuk memanggil data, pada konteks ini mengambil data UserProvider dan WikiProvider
  yang mana telah menyimpan data dari API kedalam modelnya masing-masing
  */
  UserProvider userProvider = UserProvider();
  WikiProvider wikiProvider = WikiProvider();

  getRandomGabunganData() async {
    /*
    Setelah kita berhasil membuat akses kedalam {UserProvider}, kita bisa mendapatkan data dari method
    class {UserProvider} tersebut. Sekarang kita bisa membuat variabel untuk menyimpan data yang telah kita panggil ke {userData}.
     */
    Map<String, dynamic> userData = await userProvider.getUserProvider();
    Map<String, dynamic> wikiData = await wikiProvider.getDataWiki();

    /*
    Pada getUserProvider terdapat field "error" yang bertipe boolean, saat melakukan pemanggilan diatas
    terisi pula field tersebut, disini kita mengecek field jika true maka akan mengembalikan field itu sendiri
    dan pesan gagal. Untuk validasi data API yang dipanggil.
    */
    if (userData["error"] == true || wikiData["error"] == true) {
      return {
        "error": true,
        "message": "Gagal mengambil data user dan wiki",
      };
    }

    /*
    Peng-parse-an data disini berfungsi sebagai pemudahan dalam pemanggilan sehingga saat dipanggil
    kita tidak perlu mengetikkan userData["data"] tiap memanggil. Panjang dan susah bukan?
    Pemilihan tipe data dari Map<>(userData) menjadi class object UserModel adalah untuk pemudahan pemanggilan itu sendiri
    
    Jika menggunakan tipe data String, maka akan menjadi:
        String emailUser = userData["data"]["email"];
    Ribet, dan tidak efisien karean kita hanya memanggilnya sekali
    */
    UserModel userModel = userData["data"] as UserModel;
    WikiModel wikiModel = wikiData["info"] as WikiModel;

    late DataUser randomDataUser;
    if (userModel.dataUser != null) {
      randomDataUser = userModel.dataUser!
          .randomUser(); //randomUser berfungsi sebagai pengganti [] secara manual, sehingga sekarang dapat memiliki random index menggunakan elemenAt
    } else {
      randomDataUser = DataUser();
    }

    late Info randomDataWiki;
    if (wikiModel.data!.info != null) {
      randomDataWiki = wikiModel.data!.info!.randomWiki();
    } else {
      randomDataWiki = Info();
    }

    return {
      "error": false,
      "message": "Berhasil mengambil data user dan wiki",
      "data": GabunganModel(
          fullname: "${randomDataUser.firstName} ${randomDataUser.lastName}",
          profile: randomDataUser.avatar,
          email: "${randomDataUser.email}",
          fyi: "${randomDataWiki.tahukahAnda}")
    };
  }
}

/*
Extension adalah sebuah method/fungsi tambahan untuk suatu class, sehingga kita bisa memanggilnya selayaknya sebuah method.
Disini kita menggunakan extension untuk mencari dan menggunakan data user secara random

Tipe data nya kita bisa dapatkan dan samakan dari atribut class yaitu dataUser ataupun info
*/
extension RandomUser on List<DataUser> {
  DataUser randomUser() {
    return elementAt(Random().nextInt(length - 1));
  }
}

extension RandomWiki on List<Info> {
  Info randomWiki() {
    return elementAt(Random().nextInt(length - 1));
  }
}
