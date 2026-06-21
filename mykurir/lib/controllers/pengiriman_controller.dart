import 'package:get/get.dart';
import 'package:mykurir/db/connection.dart';
import 'package:mykurir/models/pengiriman.dart';

class PengirimanController extends GetxController {
  Pengiriman sendData = Pengiriman();
  RxList<Map> pengirimanBerlangsung = <Map>[].obs;
  RxList<Map> pengirimanSebelumnya = <Map>[].obs;
  RxBool isLoading = false.obs;

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
          .eq("id_pengiriman", idPengiriman);
      print("konfirmasiPengiriman : Barang akan segera di pickup");
    } catch (e) {
      print("konfirmasiPengiriman #Error : $e");
    }
  }

  Future<void> riwayatPengiriman(String idAkun) async {
    try {
      final response = await db
          .from("pengiriman")
          .select('''id_pengiriman,
            nomor_resi,
            deskripsi_barang,
            alamat_pengirim,
            alamat_penerima,
            nama_penerima,
            nomor_telepon_penerima,
            berat,
            biaya,
            status_pengiriman,
            created_at,
            id_akun,
            id_kurir,
            long_pengirim,
            lat_pengirim,
            long_penerima,
            lat_penerima,
            ukuran,
            akun!id_akun(nama_lengkap, foto_profile)''')
          .eq("id_akun", idAkun);

      List<Map<String, dynamic>> berlangsung = [];
      List<Map<String, dynamic>> riwayat = [];

      for (var e in response) {
        print("Response = $e");
        if (e["status_pengiriman"] == StatusPengiriman.on_delivery.name ||
            e["status_pengiriman"] == StatusPengiriman.pending.name ||
            e["status_pengiriman"] == StatusPengiriman.pickup.name) {
          berlangsung.add(e);
        } else {
          riwayat.add(e);
        }
      }

      pengirimanBerlangsung.value = berlangsung;
      pengirimanSebelumnya.value = riwayat;
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
