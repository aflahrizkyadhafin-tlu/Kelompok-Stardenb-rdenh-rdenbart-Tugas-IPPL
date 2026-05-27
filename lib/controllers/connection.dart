import 'package:supabase_flutter/supabase_flutter.dart';

final db = Supabase.instance.client;

class Connection {
  static Future<void> connectDB() async {
    try {
      await Supabase.initialize(
        url: "https://tjlerkwzrfqxoavvfstp.supabase.co",
        anonKey: "sb_publishable_dgBbyZztR5oY0nI5u1GzyA_HL1X1Aae",
      );
      print("[Connection] : Database berhasil terhubung");
    } catch (e) {
      print("[Connection] : Gagal menyambungkan ke database....");
      print("[Connection] : $e");
    }
  }
}
