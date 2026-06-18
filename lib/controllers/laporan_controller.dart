import 'package:get/get.dart';
import 'package:setting_api/controllers/connection.dart';
import 'package:setting_api/controllers/loading_controller.dart';
import 'package:setting_api/models/laporan.dart';

class LaporanController extends GetxController {
  LoadingController loadingController = Get.put(LoadingController());
  RxList<Laporan> listLaporan = <Laporan>[].obs;
  RxList<Laporan> laporanSaya = <Laporan>[].obs;
  Rxn<Laporan> detailLaporan = Rxn<Laporan>();

  Future<void> buatLaporan(Laporan laporan) async {
    try {
      await db.from("laporan").insert(laporan.toJson());
      print("[buatLaporan] : Laporan baru berhasil dibuat");
    } catch (e) {
      print("[buatLaporan] #Error : $e");
    } finally {
      loadingController.hide();
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
      loadingController.hide();
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
      loadingController.hide();
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
      loadingController.hide();
    }
  }

  Future<void> hapusLaporan(String idLaporan) async {
    try {
      await db.from("laporan").delete().eq("id_laporan", idLaporan);
      print("[hapusLaporan] : Laporan dengan id $idLaporan berhasil dihapus");
    } catch (e) {
      print("[hapusLaporan] #Error : $e");
    } finally {
      loadingController.hide();
    }
  }
}
