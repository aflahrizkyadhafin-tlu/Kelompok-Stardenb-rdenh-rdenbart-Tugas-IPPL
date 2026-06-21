import 'package:get/get.dart';
import 'package:mykurir/controllers/akun_controller.dart';
import 'package:mykurir/db/connection.dart';
import 'package:mykurir/models/rating_kurir.dart';

class RatingDriverController extends GetxController {
  final AkunController _akunController = Get.put(AkunController());
  RxBool isLoading = false.obs;

  Future<void> beriRating(RatingKurir ratingKurir) async {
    ratingKurir.idAkun = _akunController.profileAkun.value?.idAkun;

    // sementara
    ratingKurir.idKurir = "c0268626-79a0-4316-aabd-7c47545f71f8";
    ratingKurir.idPengiriman = "8752cf22-548a-4bd4-8f13-b56a95d459cb";

    Map<String, dynamic> jsonData = ratingKurir.toJson();

    try {
      await db.from("rating_kurir").insert(jsonData);
      print("RatingController : Rating berhasil ditambahkan");
    } catch (e) {
      print("RatingController #Error : $e");
    } finally {
      isLoading.value = false;
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
