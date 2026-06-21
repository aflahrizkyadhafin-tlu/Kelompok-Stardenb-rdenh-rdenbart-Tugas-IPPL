import 'package:get/get.dart';
import 'package:mykurir/controllers/loading_controller.dart';
import 'package:mykurir/db/connection.dart';
import 'package:mykurir/models/rating_aplikasi.dart';

class RatingAplikasiController {
  RxList<RatingAplikasi> ratingSaya = <RatingAplikasi>[].obs;
  RxList<RatingAplikasi> allRating = <RatingAplikasi>[].obs;
  RxMap statistikAplikasi = {"average": 0.0}.obs;
  RxBool isLoading = false.obs;

  Future<void> tambahRatingAplikasi(RatingAplikasi ratingAplikasi) async {
    try {
      await db
          .from("rating_aplikasi")
          .insert(ratingAplikasi.toJson())
          .then((e) => getAllRatingAplikasi());
      print("[tambahRatingAplikasi] : Rating baru berhasil ditambahkan");
    } catch (e) {
      print("[tambahRatingAplikasi] #Error : $e");
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> getRatingSaya(String idAkun) async {
    try {
      final response = await db
          .from("rating_aplikasi")
          .select()
          .eq("id_akun", idAkun);
      for (var e in response) {
        ratingSaya.add(RatingAplikasi.fromJson(e));
      }
    } catch (e) {
      print("[getRatingSaya] #Error : $e");
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> getAllRatingAplikasi() async {
    try {
      final response = await db.from("rating_aplikasi").select();
      for (var e in response) {
        allRating.add(RatingAplikasi.fromJson(e));
      }
    } catch (e) {
      print("[getAllRating] #Error : $e");
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> getStatistikRatingAplikasi() async {
    double average = 0.0;

    try {
      allRating.clear();
      await getAllRatingAplikasi();

      for (var data in allRating) {
        average += data.skor!.toDouble();
      }

      statistikAplikasi["average"] = average / allRating.length;
    } catch (e) {
      print("[getStatistikRating] #Error : $e");
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> hapusRatingAplikasi(String idRatingAplikasi) async {
    try {
      await db
          .from("rating_aplikasi")
          .delete()
          .eq("id_rating_aplikasi", idRatingAplikasi)
          .then((e) => getAllRatingAplikasi());
    } catch (e) {
      print("[getStatistikRating] #Error : $e");
    }
  }
}
