import 'package:get/get.dart';
import 'package:setting_api/models/kurir.dart';
import 'package:setting_api/models/pengiriman.dart';
import 'package:setting_api/models/rating.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final supabase = Supabase.instance.client;

class KurirController extends GetxController {
  Future<void> terimaPesanan(String idPengiriman, idKurir) async {
    try {
      final detailPengiriman = await supabase
          .from("pengiriman")
          .select()
          .eq("id_pengiriman", idPengiriman);
      print(detailPengiriman);
      bool accept = true;

      if (accept) {
        await supabase
            .from("pengiriman")
            .update({
              "status_pengiriman": StatusPengiriman.on_delivery.name,
              "id_kurir": idKurir,
            })
            .eq("id_pengiriman", idPengiriman);
        print("Pesanan akan segera diantar!!!");
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> batalkanPesanan() async {}

  Future<void> perbaruiLokasi(String idKurir, double long, lat) async {
    try {
      final response = await supabase
          .from("kurir")
          .update({"lokasi_long": long, "lokasi_lat": lat})
          .eq("id_kurir", idKurir)
          .select();
      print(response);
    } catch (e) {
      print(e);
    }
  }

  Future<void> ubahStatus(String idKurir, StatusKurir status) async {
    try {
      final response = await supabase
          .from("kurir")
          .update({"status_kurir": status.name})
          .eq("id_kurir", idKurir);

      print(response);
      print("update data kurir id $idKurir berhasil");
    } catch (e) {
      print(e);
    }
  }

  Future<void> selesaikanPesanan(String idPengiriman) async {
    try {
      final checkPesanan = await supabase
          .from("pengiriman")
          .select()
          .eq("id_pengiriman", idPengiriman);

      if (checkPesanan.isNotEmpty) {
        final response = await supabase
            .from("pengiriman")
            .update({"status_pengiriman": StatusPengiriman.delivered.name})
            .eq("id_pengiriman", idPengiriman)
            .select();

        print(response);
      } else {
        print("Pesanan dengan id $idPengiriman tidak ditemukan");
      }
    } catch (e) {
      print(e);
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

      for (int i = 0; i < responseList.length; i++) {
        rating += responseList[i].rating;
      }
      rating = rating / responseList.length;
      print(responseList);
      print(rating);
    } catch (e) {
      print(e);
    }
  }
}
