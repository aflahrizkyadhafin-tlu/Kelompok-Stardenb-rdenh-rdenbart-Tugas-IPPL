import 'package:get/get.dart';
import 'package:setting_api/controllers/connection.dart';
import 'package:setting_api/models/kurir.dart';
import 'package:setting_api/models/pengiriman.dart';

class KurirController extends GetxController{
  Future<void> setStatusKurir(String idKurir, StatusKurir status) async{
    Map<String, dynamic> jsonData = Kurir(statusKurir: status).toJson();

    try {
      await db.from("kurir").update(jsonData).eq("id_kurir", idKurir);
      print("[Kurir Controller] : Status kurir dengan id $idKurir berhasil di update");
    } catch (e) {
      print("[Kurir Controller] #Error : $e");
    }
  }

  Future<void> getTugasSaya(String idPengiriman) async{
    try {
      final response = await db.from("pengiriman").select().eq("id_pengiriman", idPengiriman);
      print("[getTugasSaya] : $response");
    } catch (e) {
      print("[getTugasSaya] #Error : $e");
    }
  }

  Future<void> updateLokasiKurir(String idKurir, double long, double lat) async{
    Map<String, dynamic> jsonData = Kurir(lokasiLat: lat,lokasiLong: long).toJson();

    try {
      await db.from("kurir").update(jsonData).eq("id_kurir", idKurir);
      print("[Kurir Controller] : Status kurir dengan id $idKurir berhasil di update");
    } catch (e) {
      print("[Kurir Controller] #Error : $e");
    }
  }
  
  Future<void> updateStatusPengiriman(String idPengiriman, StatusPengiriman status) async{
    try {
      await db.from("pengiriman").update({"status_pengiriman": status.name}).eq("id_pengiriman", idPengiriman);
      print("[updateStatusPengiriman] : Status pengiriman dengan id $idPengiriman telah diubah menjadi ${status.name}");
    } catch (e) {
      print("[updateStatusPengiriman] #Error : $e}");
    }

  }

  Future<void> getRiwayatKurir(String idKurir) async{
    try {
      final response = await db.from("pengiriman").select().eq("id_kurir", idKurir);
      print("[getRiwayatKurir] : $response");
    } catch (e) {
      print("[getRiwayatKurir] #Error : $e");
    }
  }

  Future<void> getPermintaanMasuk(String idPengiriman) async{}
}