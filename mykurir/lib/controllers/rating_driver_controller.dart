import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:mykurir/controllers/akun_controller.dart';
import 'package:mykurir/db/connection.dart';
import 'package:mykurir/models/rating_kurir.dart';

class RatingDriverController extends GetxController {
  final AkunController _akunController = Get.put(AkunController());

  Future<void> beriRating(RatingKurir ratingKurir) async {
    // ratingKurir.idPelanggan = _akunController.profileAkun.value!.idAkun;
    Map<String, dynamic> jsonData = ratingKurir.toJson();

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
