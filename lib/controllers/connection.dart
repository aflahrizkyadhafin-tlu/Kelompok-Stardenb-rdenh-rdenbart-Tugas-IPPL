import 'package:supabase_flutter/supabase_flutter.dart';

class Connection {
  static connectDB() async {
    try {
      await Supabase.initialize(
        url: "https://tjlerkwzrfqxoavvfstp.supabase.co",
        anonKey: "sb_publishable_dgBbyZztR5oY0nI5u1GzyA_HL1X1Aae",
      );
      print("Database berhasil terhubung");
    } catch (e) {
      print("Gagal menyambungkan ke database....");
    }
  }
}
