import 'package:get/get.dart';
import 'package:mykurir/db/connection.dart';
import 'package:mykurir/models/pengiriman.dart';

class PengirimanController extends GetxController {
  Pengiriman sendData = Pengiriman();
  RxList<Map> pengirimanBerlangsung = <Map>[].obs;
  RxList<Map> pengirimanSebelumnya = <Map>[].obs;
  RxBool isLoading = false.obs;
  RxMap dataPengiriman = {}.obs;

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

  Future<void> updateStatusPengiriman(
    String idPengiriman,
    String idKurir,
    StatusPengiriman status,
  ) async {
    Map<String, dynamic> jsonData = Pengiriman(
      idKurir: idKurir,
      statusPengiriman: status,
    ).toJson();

    try {
      await db
          .from("pengiriman")
          .update(jsonData)
          .eq("id_pengiriman", idPengiriman);
      print("konfirmasiPengiriman : Status barang di update");
    } catch (e) {
      print("konfirmasiPengiriman #Error : $e");
    } finally {
      isLoading.value = false;
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
            kurir!id_kurir(
            kendaraan,
            plat_nomor,
            akun!id_akun(nama_lengkap, foto_profile)
            ))''')
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

  Future<void> getDetailPengiriman(String idPengiriman) async {
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
            kurir!id_kurir(
            kendaraan,
            plat_nomor,
            akun!id_akun(nama_lengkap, foto_profile)
            ))''')
          .eq("id_pengiriman", idPengiriman)
          .maybeSingle();

      dataPengiriman.value = response!;
      print("detailPengiriman : $response");
    } catch (e) {
      print("detailPengiriman #Error : $e");
    } finally {
      isLoading.value = false;
    }
  }
}
