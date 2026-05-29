import 'package:get/get.dart';
import 'package:setting_api/controllers/connection.dart';
import 'package:setting_api/controllers/pengiriman_controller.dart';
import 'package:setting_api/models/log_pengiriman.dart';
import 'package:setting_api/models/pengiriman.dart';

class LogPengirimanController extends GetxController {
  static Future<void> catatLog(String idPengiriman) async {
    try {
      Pengiriman? checkPengiriman =
          await PengirimanController.getPengirimanById(idPengiriman);

      if (checkPengiriman != null) {
        Map jsonData = LogPengiriman(
          idLog: "",
          statusPengiriman: checkPengiriman.statusPengiriman,
          waktuUpdate: DateTime.now(),
          idPengiriman: idPengiriman,
        ).toJson();
        await db.from('log_pengiriman').insert(jsonData);
        print("[Log Pengiriman] : Log pengiriman berhasil dikirm");
      } else {
        print("[Log Pengiriman] : Data Pengiriman tidak ditemukan");
      }
    } catch (e) {
      print("[Log Pengiriman] : $e");
    }
  }
}
