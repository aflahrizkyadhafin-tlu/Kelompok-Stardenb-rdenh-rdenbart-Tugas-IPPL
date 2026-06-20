import 'package:get/get.dart';
import 'package:mykurir/db/connection.dart';
import 'package:mykurir/models/pengiriman.dart';

class PengirimanController extends GetxController {
  Pengiriman sendData = Pengiriman();

  Future<void> buatDraftPengiriman(Pengiriman dataPengiriman) async {
    Map jsonData = dataPengiriman.toJson();
    print("PengirimanController: $jsonData");

    try {
      await db
          .from("pengiriman")
          .insert(jsonData); //Tambahkan penambahan ke log
      print("PengirimanController : $jsonData berhasil dikirim ke database");
    } catch (e) {
      print("PengirimanController #Error: $e");
    }
  }

  static Future<void> konfirmasiPengiriman(
    String idPengiriman,
    String idKurir,
  ) async {
    Map<String, dynamic> jsonData = Pengiriman(
      idKurir: idKurir,
      statusPengiriman: StatusPengiriman.pickup,
    ).toJson();

    try {
      await db
          .from("pengiriman")
          .update(jsonData)
          .eq("id_pengiriman", idPengiriman); //Tambahkan penambahan ke log
      print("konfirmasiPengiriman : Barang akan segera di pickup");
    } catch (e) {
      print("konfirmasiPengiriman #Error : $e");
    }
  }

  Future<void> riwayatPengiriman(String idAkun) async {
    try {
      final response = await db
          .from("pengiriman")
          .select()
          .eq("id_pelanggan", idAkun);
      print("riwayatPengiriman : $response");
    } catch (e) {
      print("riwayatPengiriman #Error : $e");
    }
  }

  Future<void> detailPengiriman(String idPengiriman) async {
    try {
      final response = await db
          .from("log_pengiriman")
          .select()
          .eq("id_pengiriman", idPengiriman);
      print("detailPengiriman : $response");
    } catch (e) {
      print("detailPengiriman #Error : $e");
    }
  }
}
