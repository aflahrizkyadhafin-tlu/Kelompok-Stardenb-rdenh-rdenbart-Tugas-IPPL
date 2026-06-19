import 'package:get/get.dart';
import 'package:mykurir/controllers/loading_controller.dart';
import 'package:mykurir/db/connection.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthController extends GetxController {
  LoadingController loadingController = Get.put(LoadingController());

  Future<void> register(String email, String password) async {
    try {
      await db.auth.signUp(password: password, email: email);
      print("[Register] : Kode OTP berhasil dikirim");
    } catch (e) {
      print("[Register] #Error: $e");
    } finally {
      loadingController.hide();
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
    } finally {
      loadingController.hide();
    }
  }

  Future<void> gantiNomorTelepon(String nomorTelepon) async {
    try {
      await db.auth.updateUser(UserAttributes(phone: nomorTelepon));
      print("[gantiNomorTelepon] : Kode OTP berhasil dikirim");
    } catch (e) {
      print("[gantiNomorTelepon] #Error : $e");
    } finally {
      loadingController.hide();
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
      loadingController.hide();
      return true;
    } catch (e) {
      print("[verifOTPTelepon] #Error : $e");
      return false;
    } finally {
      loadingController.hide();
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
    } finally {
      loadingController.hide();
    }
  }

  Future<void> logout() async {
    try {
      await db.auth.signOut();
      print("[logout] : User telah logout");
      loadingController.hide();
    } catch (e) {
      print("[logout] #Error : $e");
    } finally {
      loadingController.hide();
    }
  }

  Future<void> cekUser() async {
    try {
      final user = db.auth.currentUser;
      print("[cekUser] : $user");
    } catch (e) {
      print("[CekUser] #Error : $e");
    } finally {
      loadingController.hide();
    }
  }

  Future<void> sendOTPPassword(String email) async {
    try {
      await db.auth.resetPasswordForEmail(email);
      print("[sendOTPPassword] : Kode OTP dikirim");
    } catch (e) {
      print("[sendOTPPassword] #Error : $e");
    } finally {
      loadingController.hide();
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
    } finally {
      loadingController.hide();
    }
  }
}
