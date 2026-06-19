import 'package:mykurir/controllers/loading_controller.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:get/get.dart';

final db = Supabase.instance.client;

class Connection {
  LoadingController loadingController = Get.put(LoadingController());
  Future<void> connectDB() async {
    try {
      await Supabase.initialize(
        url: 'https://tjlerkwzrfqxoavvfstp.supabase.co',
        publishableKey: 'sb_publishable_dgBbyZztR5oY0nI5u1GzyA_HL1X1Aae  ',
      );
      print("Connection : Koneksi ke Supabase Berhasil");
    } catch (e) {
      print("Connection #Error : $e");
    } finally {
      loadingController.hide();
    }
  }
}
