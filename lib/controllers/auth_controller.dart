import 'package:get/route_manager.dart';
import 'package:get/state_manager.dart';
import 'package:setting_api/controllers/connection.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthController extends GetxController{
  Future<void> register(String email) async{
    try {
      await db.auth.signInWithOtp(email: email, shouldCreateUser: true);
      print("[Register] : Kode OTP berhasil dikirim");
    } catch (e) {
      print("[Register] #Error: $e");
    }
  }

  Future<void> verifOTP(String OTP, String email) async {
    try {
      final response = await db.auth.verifyOTP(type: OtpType.signup, email: email, token: OTP);
      Get.defaultDialog(middleText: "Kode OTP berhasil di verifikasi");
      print("[verifOTP] : $response");
    } catch (e) {
      print("[verifOTP] #Error : $e");
    }
  }

  Future<void> login(String email, String password) async{
    try {
      final response = await db.auth.signInWithPassword(password: password, email: email);
      
      if (response.user != null) {
        print("[Login] : ${response.user}");
      }else {
        print("[Login] : Akun tidak ditemukan");
      }
    } catch (e) {
      print("[Login] #error: $e");
    }
  }

  Future<void> logout() async{
    try {
      await db.auth.signOut();
    } catch (e) {
      
    }
  }

  Future<void> cekUser() async {
    try {
      final user = await db.auth.currentUser;
      print("[cekUser] : $user");
    } catch (e) {
      print("[CekUser] : $e");
    }
  }

  Future<void> changePassword() async{}
}