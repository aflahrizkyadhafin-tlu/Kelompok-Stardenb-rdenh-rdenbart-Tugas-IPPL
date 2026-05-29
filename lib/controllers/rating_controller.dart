import 'package:get/state_manager.dart';
import 'package:setting_api/controllers/connection.dart';
import 'package:setting_api/models/rating.dart';

class RatingController extends GetxController {
  Future<void> beriRating(
    double rating,
    String pesan,
    String idPelanggan,
    String idKurir,
    String idPengiriman,
  ) async {
    Map<String, dynamic> jsonData = RatingKurir(
      rating: rating,
      pesan: pesan,
      idPelanggan: idPelanggan,
      idKurir: idKurir,
      idPengiriman: idPengiriman,
    ).toJson();

    try {
      await db.from("rating_kurir").insert(jsonData);
      print("RatingController : Rating berhasil ditambahkan");
    } catch (e) {
      print("RatingController #Error : $e");
    }
  }

  Future<void> getRatingByPengiriman(String idPengiriman) async {
    try {
      final response = await db
          .from("rating_kurir")
          .select()
          .eq("id_pengiriman", idPengiriman);
      if (response.isNotEmpty) {
        print("getRatingByPengirim : $response");
      } else {
        print(
          "getRatingByPengirim : Pengguna belum memberikan rating untuk pengiriman $idPengiriman",
        );
      }
    } catch (e) {
      print("getRatingByPengirim #Error : $e");
    }
  }
}
