import 'package:get/state_manager.dart';
import 'package:setting_api/controllers/connection.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthController extends GetxController {
  Future<void> register(String email, String password) async {
    try {
      await db.auth.signUp(password: password, email: email);
      print("[Register] : Kode OTP berhasil dikirim");
    } catch (e) {
      print("[Register] #Error: $e");
    }
  }

  Future<void> verifOTPEmail(String kodeOTP, String email) async {
    try {
      final response = await db.auth.verifyOTP(
        type: OtpType.email,
        email: email,
        token: kodeOTP,
      );
      print("[verifOTP] : $response");
    } catch (e) {
      print("[verifOTP] #Error : $e");
    }
  }

  Future<void> gantiNomorTelepon(String nomorTelepon) async {
    try {
      await db.auth.updateUser(UserAttributes(phone: nomorTelepon));
      print("[gantiNomorTelepon] : Kode OTP berhasil dikirim");
    } catch (e) {
      print("[gantiNomorTelepon] #Error : $e");
    }
  }

  Future<bool> verifOTPTelepon(String nomorTelepon, String kodeOTP) async {
    print("Mencoba verifikasi nomor: [$nomorTelepon] dengan OTP: [$kodeOTP]");
    try {
      await db.auth.verifyOTP(
        type: OtpType.phoneChange,
        phone: nomorTelepon,
        token: kodeOTP,
      );
      print("[verifOTPTelepon] : Kode OTP berhasil diverifikasi");
      return true;
    } catch (e) {
      print("[verifOTPTelepon] #Error : $e");
      return false;
    }
  }

  Future<void> login(String email, String password) async {
    try {
      final response = await db.auth.signInWithPassword(
        password: password,
        email: email,
      );

      if (response.user != null) {
        print("[Login] : ${response.user}");
      } else {
        print("[Login] : Akun tidak ditemukan");
      }
    } catch (e) {
      print("[Login] #error: $e");
    }
  }

  Future<void> logout() async {
    try {
      await db.auth.signOut();
      print("[logout] : User telah logout");
    } catch (e) {
      print("[logout] #Error : $e");
    }
  }

  Future<void> cekUser() async {
    try {
      final user = await db.auth.currentUser;
      print("[cekUser] : $user");
    } catch (e) {
      print("[CekUser] #Error : $e");
    }
  }

  Future<void> sendOTPPassword(String email) async {
    try {
      await db.auth.resetPasswordForEmail(email);
      print("[sendOTPPassword] : Kode OTP dikirim");
    } catch (e) {
      print("[sendOTPPassword] #Error : $e");
    }
  }

  Future<void> changePassword(
    String otp,
    String newPassword,
    String email,
  ) async {
    try {
      await db.auth.verifyOTP(type: OtpType.recovery, email: email, token: otp);

      await db.auth.updateUser(UserAttributes(password: newPassword));
      print("[changePassword] : Password berhasil diubah");
    } catch (e) {
      print("[changePassword] #Error : $e");
    }
  }
}
