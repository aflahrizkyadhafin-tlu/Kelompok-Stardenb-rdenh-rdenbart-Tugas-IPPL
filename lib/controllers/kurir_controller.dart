import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

enum StatusKurir { offline, available, on_delivery }

final supabase = Supabase.instance.client;

class KurirController extends GetxController {
  Future<void> terimaPesanan() async {}
  Future<void> batalkanPesanan() async {}
  Future<void> perbaruiLokasi() async {}

  Future<void> ubahStatus(String idKurir, StatusKurir status) async {
    String statusKode = status == StatusKurir.offline
        ? "offline"
        : status == StatusKurir.available
        ? "available"
        : "on_delivery";

    print(statusKode);

    try {
      final response = await supabase
          .from("kurir")
          .update({"status_kurir": statusKode})
          .eq("id_kurir", idKurir);

      print(response);
      print("update data kurir id $idKurir berhasil");
    } catch (e) {
      print(e);
    }
  }

  Future<void> selesaikanPesanan() async {}
  Future<void> lihatRating(String idPengguna, idKurir) async {}
}
