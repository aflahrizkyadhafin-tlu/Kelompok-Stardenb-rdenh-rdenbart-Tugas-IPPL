import 'package:get/get.dart';
import 'package:mykurir/db/connection.dart';
import 'package:mykurir/models/laporan.dart';

class LaporanController extends GetxController {
  RxList<Laporan> listLaporan = <Laporan>[].obs;
  RxList<Laporan> laporanSaya = <Laporan>[].obs;
  Rxn<Laporan> detailLaporan = Rxn<Laporan>();

  Laporan dataKirimLaporan = Laporan();
  RxBool isLoading = false.obs;

  Future<void> buatLaporan() async {
    try {
      await db.from("laporan").insert(dataKirimLaporan.toJson());
      print("[buatLaporan] : Laporan baru berhasil dibuat");
    } catch (e) {
      print("[buatLaporan] #Error : $e");
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> getLaporanSaya(String reporterId) async {
    try {
      final response = await db
          .from("laporan")
          .select()
          .eq("reporter_id", reporterId);

      for (var e in response) {
        laporanSaya.add(Laporan.fromJson(e));
      }

      print("[getLaporanSaya] : $response");
    } catch (e) {
      print("[getLaporanSaya] #Error : $e");
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> getAllLaporan() async {
    try {
      final response = await db.from("laporan").select();

      for (var e in response) {
        listLaporan.add(Laporan.fromJson(e));
      }

      print("[getAllLaporan] : $response");
    } catch (e) {
      print("[getAllLaporan] #Error : $e");
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> getDetailLaporan(String idLaporan) async {
    try {
      final response = await db
          .from("laporan")
          .select()
          .eq("id_laporan", idLaporan)
          .maybeSingle();

      if (response != null) {
        detailLaporan.value = Laporan.fromJson(response);
      }

      print("[getDetailLaporan] : $response");
    } catch (e) {
      print("[getDetailLaporan] #Error : $e");
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> hapusLaporan(String idLaporan) async {
    try {
      await db.from("laporan").delete().eq("id_laporan", idLaporan);
      print("[hapusLaporan] : Laporan dengan id $idLaporan berhasil dihapus");
    } catch (e) {
      print("[hapusLaporan] #Error : $e");
    } finally {
      isLoading.value = false;
    }
  }
}
