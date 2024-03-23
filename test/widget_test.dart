import 'package:udemy_bloc/data/models/gabungan_model.dart';
import 'package:udemy_bloc/data/providers/user_provider.dart';
import 'package:udemy_bloc/data/providers/wiki_provider.dart';
import 'package:udemy_bloc/data/repositories/gabungan_random_repository.dart';

//Program test untuk memeriksa apakah data dari API berhasil didapatkan atau terjadi error
void main() async {
  //Menggunakan async karena kita memerlukan waktu tunggu disaat pengambilan data API (await)
  UserProvider user = UserProvider();
  WikiProvider wiki = WikiProvider();

  /*
  Await disini bekerja untuk mengambil data dari API sebelum melakukan perintah print getUserProvider, karena terdapat await pada getUserProvidernya.
  Lalu dilanjutkan ke perintah await pada getDataWiki, jika sudah melakukan pengambilan data, maka perintah print getDataWiki akan dijalankan.
  */
  print(await user.getUserProvider());
  print(await wiki.getDataWiki());

  print("===========================================");

  GabunganRandomRepository gabunganRandomRepository =
      GabunganRandomRepository(); //Variabel yang dibutuhkan dataGabungan karena untuk memanggil GabunganRandomRepository
  Map<String, dynamic> dataGabungan = await gabunganRandomRepository
      .getRandomGabunganData(); //Sebuah variabel pemanggilan getRandomGabungan atau data yang ingin di cek. Hasilnya berupa tipe data Map / {JSON}. Biasanya JSON ditampung dengan tipe data Map, karena mirip
  GabunganModel data = dataGabungan[
      "data"]; //Variabel untuk mengakses suatu 'data' atau 'atribut' dari dataGabungan tadi

  print(data
      .toJson()); //Mengubah data yang tadinya berupa Map sekarang menjadi JSON sehingga dapat dibaca di terminal/debug console
}
