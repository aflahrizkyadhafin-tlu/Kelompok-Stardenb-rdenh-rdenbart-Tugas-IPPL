import 'package:get/get.dart';
import 'package:setting_api/controllers/connection.dart';
import 'package:setting_api/controllers/log_pengiriman_controller.dart';
import 'package:setting_api/controllers/pengiriman_controller.dart';
import 'package:setting_api/models/kurir.dart';
import 'package:setting_api/models/pengiriman.dart';
import 'package:setting_api/models/rating.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final supabase = Supabase.instance.client;

class KurirController extends GetxController {
  Future<void> terimaPesanan(String idPengiriman, idKurir) async {
    try {
      Pengiriman? checkPengiriman =
          await PengirimanController.getPengirimanById(idPengiriman);
      bool accept =
          checkPengiriman != null &&
          checkPengiriman.statusPengiriman ==
              StatusPengiriman.pending; //Ini ubah sesuai status di aplikasi

      if (accept) {
        await supabase
            .from("pengiriman")
            .update({
              "status_pengiriman": StatusPengiriman.on_delivery.name,
              "id_kurir": idKurir,
            })
            .eq("id_pengiriman", idPengiriman);
        print("[Pengiriman - terimaPesanan] : Pesanan akan segera diantar!!!");
      } else {
        print("[Pengiriman - terimaPesanan] : Pesanan tidak ditemukan");
      }
    } catch (e) {
      print("[Pengiriman - terimaPesanan] : $e");
    }
  }

  Future<void> batalkanPesanan(String idPengiriman) async {
    try {
      Pengiriman? checkPengiriman =
          await PengirimanController.getPengirimanById(idPengiriman);

      if (checkPengiriman != null) {
        await supabase
            .from("pengiriman")
            .update({"status_pengiriman": StatusPengiriman.cancelled.name})
            .eq("id_pengiriman", idPengiriman)
            .then(
              (e) async => await LogPengirimanController.catatLog(idPengiriman),
            );
      }
      print("[Pengiriman - batalkanPesanan] : Pembatalan pesanan berhasil");
    } catch (e) {
      print("[Pengiriman - batalkanPesanan] : $e");
    }
  }

  Future<void> perbaruiLokasi(String idKurir, double long, lat) async {
    try {
      final response = await supabase
          .from("kurir")
          .update({"lokasi_long": long, "lokasi_lat": lat})
          .eq("id_kurir", idKurir)
          .select();
      print("[Pengiriman - perbaruiLokasi] : $response");
    } catch (e) {
      print("[Pengiriman - perbaruiLokasi] : $e");
    }
  }

  Future<void> ubahStatus(String idKurir, StatusKurir status) async {
    try {
      final response = await supabase
          .from("kurir")
          .update({"status_kurir": status.name})
          .eq("id_kurir", idKurir);

      print("[Pengiriman - ubahStatus] : $response");
      print(
        "[Pengiriman - ubahStatus] : update data kurir id $idKurir berhasil",
      );
    } catch (e) {
      print("[Pengiriman - ubahStatus] : $e");
    }
  }

  Future<void> selesaikanPesanan(String idPengiriman) async {
    try {
      Pengiriman? checkPesanan = await PengirimanController.getPengirimanById(
        idPengiriman,
      );

      if (checkPesanan != null) {
        await supabase
            .from("pengiriman")
            .update({"status_pengiriman": StatusPengiriman.delivered.name})
            .eq("id_pengiriman", idPengiriman)
            // .select()
            .then(
              (value) async => {
                ubahStatus(checkPesanan.idKurir, StatusKurir.available),
                print("[Pengiriman - selesaikanPesanan] : $value"),
              },
            );
      } else {
        print(
          "[Pengiriman - selesaikanPesanan] : Pesanan dengan id $idPengiriman tidak ditemukan",
        );
      }
    } catch (e) {
      print("[Pengiriman - selesaikanPesanan] : $e");
    }
  }

  Future<void> lihatRating(String idKurir) async {
    try {
      final response = await supabase
          .from("rating_kurir")
          .select()
          .eq("id_kurir", idKurir);

      List<RatingKurir> responseList = [];
      for (var data in response) {
        responseList.add(RatingKurir.fromJson(data));
      }

      double rating = 0.0;

      if (responseList.isNotEmpty) {
        for (int i = 0; i < responseList.length; i++) {
          rating += responseList[i].rating;
        }
        rating = rating / responseList.length;
      }

      print("[Pengiriman - lihatRating] : $responseList");
      print("[Pengiriman - lihatRating] : $rating");
    } catch (e) {
      print("[Pengiriman - lihatRating] : $e");
    }
  }
}
