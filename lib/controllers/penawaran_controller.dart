import 'package:get/get.dart';
import 'package:setting_api/controllers/connection.dart';
import 'package:setting_api/controllers/pengiriman_controller.dart';
import 'package:setting_api/models/kurir.dart';
import 'package:setting_api/models/pengiriman.dart';

class PenawaranController extends GetxController {
  Future<void> kirimPermintaan() async {}

  Future<void> getStatusPenawaran(String idPengiriman) async {
    try {
      await db
          .from("pengiriman")
          .select('status_pengiriman')
          .eq("id_pengiriman", idPengiriman)
          .then((data) => print("getStatusPenawaran : ${data[0]}"));
    } catch (e) {
      print("getStatusPenawaran #Error : $e");
    }
  }

  Future<void> kurirTerima(String idPengiriman, String idKurir) async {
    Map<String, dynamic> jsonData = Kurir(statusKurir: StatusKurir.handling_order).toJson();

    try {
      await db
          .from("kurir")
          .update(jsonData)
          .eq("id_kurir", idKurir)
          .then(
            (data) async => await PengirimanController.konfirmasiPengiriman(
              idPengiriman,
              idKurir,
            ),
          );
      print("kurirTerima : Kurir telah menerima pengiriman");
    } catch (e) {
      print("kurirTerima #Error : $e");
    }
  }

  Future<void> pelangganBatal(String idPengiriman) async {
    Map<String, dynamic> jsonData = Pengiriman(statusPengiriman: StatusPengiriman.cancelled).toJson();

    try {
      await db
          .from("pengiriman")
          .update(jsonData)
          .eq("id_pengiriman", idPengiriman);

      print("pelangganBatal : Pengiriman dibatalkan");
    } catch (e) {
      print("pelangganBatal #Error : $e");
    }
  }

  Future<void> kurirTolak() async {}
}
