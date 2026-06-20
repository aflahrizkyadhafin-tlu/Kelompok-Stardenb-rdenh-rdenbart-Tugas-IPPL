import 'package:get/get.dart';
import 'package:mykurir/controllers/akun_controller.dart';
import 'package:mykurir/controllers/loading_controller.dart';
import 'package:mykurir/db/connection.dart';
import 'package:mykurir/models/akun.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthController extends GetxController {
  LoadingController loadingController = Get.put(LoadingController());
  AkunController akunController = Get.put(AkunController());

  Rxn<User> detailUser = Rxn<User>();
  String sendEmail = "";
  String sendNomorTelepon = "";
  String sendUsername = "";
  String sendPassword = "";
  UserRole sendRole = UserRole.pengguna;

  Future<void> register(String email, String password) async {
    try {
      await db.auth.signUp(password: password, email: email);
      print("[Register] : Kode OTP berhasil dikirim");
      Get.snackbar("Register", "Kode OTP berhasil dikirim");
    } catch (e) {
      print("[Register] #Error: $e");
    } finally {
      loadingController.hide();
    }
  }

  Future<bool> verifOTPEmail(String kodeOTP) async {
    try {
      final response = await db.auth.verifyOTP(
        type: OtpType.email,
        email: sendEmail,
        token: kodeOTP,
      );
      print("[verifOTP] : $response");

      Get.snackbar("Kode OTP", "Kode OTP berhasil diverifikasi");

      Akun sendData = Akun(
        idUser: response.user!.id,
        username: sendUsername,
        role: sendRole,
      );
      akunController.createProfile(sendData);

      return true;
    } catch (e) {
      print("[verifOTP] #Error : $e");
      return false;
    } finally {
      loadingController.hide();
    }
  }

  Future<void> gantiNomorTelepon() async {
    try {
      await db.auth.updateUser(UserAttributes(phone: sendNomorTelepon));
      print("[gantiNomorTelepon] : Kode OTP berhasil dikirim");
    } catch (e) {
      print("[gantiNomorTelepon] #Error : $e");
    } finally {
      loadingController.hide();
    }
  }

  Future<bool> verifOTPTelepon(String kodeOTP) async {
    print(
      "Mencoba verifikasi nomor: [$sendNomorTelepon] dengan OTP: [$kodeOTP]",
    );
    try {
      await db.auth.verifyOTP(
        type: OtpType.phoneChange,
        phone: sendNomorTelepon,
        token: kodeOTP,
      );
      print("[verifOTPTelepon] : Kode OTP berhasil diverifikasi");
      return true;
    } on AuthException catch (e) {
      if (e.message.contains("Invalid OTP") ||
          e.code == "bad_verification_code") {
        Get.snackbar(
          "OTP Salah",
          "Kode yang Anda masukkan tidak sesuai. Silakan periksa kembali.",
        );
      }
      return false;
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
        detailUser.value = response.user;
        akunController.getProfile();
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
      loadingController.hide();
    } catch (e) {
      print("[logout] #Error : $e");
    } finally {
      loadingController.hide();
    }
  }

  Future<void> getUser() async {
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
