import 'package:get/get.dart';
import 'package:mykurir/controllers/akun_controller.dart';
import 'package:mykurir/controllers/kurir_controller.dart';
import 'package:mykurir/db/connection.dart';
import 'package:mykurir/models/akun.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class RegisterPayload {
  String email;
  String nomorTelepon;
  String username;
  String password;
  UserRole role;

  RegisterPayload({
    this.email = "",
    this.nomorTelepon = "",
    this.username = "",
    this.password = "",
    this.role = UserRole.pengguna,
  });
}

class AuthController extends GetxController {
  AkunController akunController = Get.put(AkunController());
  KurirController kurirController = Get.put(KurirController());
  RxBool isLoading = false.obs;

  Rxn<User> detailUser = Rxn<User>();
  RegisterPayload registerData = RegisterPayload();

  Future<void> register() async {
    try {
      await db.auth.signUp(
        password: registerData.password,
        email: registerData.email,
      );
      print("[Register] : Kode OTP berhasil dikirim");
      Get.snackbar("Register", "Kode OTP berhasil dikirim");
    } catch (e) {
      print("[Register] #Error: $e");
    } finally {
      isLoading.value = false;
    }
  }

  Future<bool> verifOTPEmail(String kodeOTP) async {
    try {
      final response = await db.auth.verifyOTP(
        type: OtpType.email,
        email: registerData.email,
        token: kodeOTP,
      );
      print("[verifOTP] : $response");

      Get.snackbar("Kode OTP", "Kode OTP berhasil diverifikasi");

      Akun sendData = Akun(
        idUser: response.user!.id,
        username: registerData.username,
        role: registerData.role,
      );
      akunController.createProfile(sendData);

      refreshData();
      return true;
    } catch (e) {
      print("[verifOTP] #Error : $e");
      return false;
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> requestChangeEmail(String email) async {
    try {
      await db.auth.updateUser(UserAttributes(email: email));
      print("[requestChangeEmail] : Kode OTP dikirim ke $email");
      Get.snackbar(
        "Sukses",
        "Silakan cek email baru Anda untuk mendapatkan kode OTP.",
      );
    } catch (e) {
      print("[requestChangeEmail] #Error : $e");
    }
  }

  Future<bool> verifyOTPChangeEmail(String email, String kodeOTP) async {
    try {
      final response = await db.auth.verifyOTP(
        type: OtpType.emailChange,
        email: email,
        token: kodeOTP,
      );

      print("[verifyOTPChangeEmail] : $response");
      return true;
    } catch (e) {
      print("[verifyOTPChangeEmail] #Error : $e");
      return false;
    }
  }

  Future<void> gantiNomorTelepon() async {
    try {
      await db.auth.updateUser(
        UserAttributes(phone: registerData.nomorTelepon),
      );
      print("[gantiNomorTelepon] : Kode OTP berhasil dikirim");
      Get.offNamed("/verif_otp", arguments: {"type": "telepon"});
    } catch (e) {
      print("[gantiNomorTelepon] #Error : $e");
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> refreshData() async {
    detailUser.value = db.auth.currentUser;
    akunController.getProfile();
    kurirController.getKurirTersedia();
  }

  Future<bool> verifOTPTelepon(String kodeOTP) async {
    print(
      "Mencoba verifikasi nomor: [${registerData.nomorTelepon}] dengan OTP: [$kodeOTP]",
    );
    try {
      await db.auth.verifyOTP(
        type: OtpType.phoneChange,
        phone: registerData.nomorTelepon,
        token: kodeOTP,
      );
      print("[verifOTPTelepon] : Kode OTP berhasil diverifikasi");
      refreshData();
      Get.back();
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
      isLoading.value = false;
    }
  }

  Future<void> login(String email, String password) async {
    try {
      final response = await db.auth.signInWithPassword(
        password: password,
        email: email,
      );

      if (response.user != null) {
        akunController.isLoading.value = true;
        print("[Login] : ${response.user}");
        refreshData();
      } else {
        print("[Login] : Akun tidak ditemukan");
      }
    } catch (e) {
      print("[Login] #error: $e");
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> logout() async {
    try {
      await db.auth.signOut();
      clearData();
      print("[logout] : User telah logout");
    } catch (e) {
      print("[logout] #Error : $e");
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> getUser() async {
    try {
      final user = db.auth.currentUser;
      print("[cekUser] : $user");
    } catch (e) {
      print("[CekUser] #Error : $e");
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> resetPasswordOTP(String email) async {
    try {
      await db.auth.resetPasswordForEmail(email);
      print("[sendOTPPassword] : Kode OTP dikirim");
    } catch (e) {
      print("[sendOTPPassword] #Error : $e");
    } finally {
      isLoading.value = false;
    }
  }

  Future<bool> verifChangePassword(String otp, String email) async {
    try {
      final response = await db.auth.verifyOTP(
        type: OtpType.recovery,
        email: email,
        token: otp,
      );
      if (response.user != null) {
        Get.toNamed(
          "/lupa_password_input_new_password",
          arguments: {"email": email},
        );
        return true;
      }
      return false;
    } catch (e) {
      print("[changePassword] #Error : $e");
      return false;
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> changePassword(String newPassword) async {
    try {
      await db.auth.updateUser(UserAttributes(password: newPassword));
      print("[changePassword] : Password berhasil diubah");
      Get.snackbar("Change password", "Password berhasil diganti");
    } catch (e) {
      print("[changePassword] #Error : $e");
    }
  }

  Future<void> hapusAkun() async {
    try {
      await db.rpc('delete_user_account');
      await db.auth.signOut();
      clearData();
      print("[hapusAkun] : Akun berhasil dihapus");
      Get.snackbar("Hapus Akun", "Akun telah dihapus");
    } catch (e) {
      print("[hapusAkun] #Error : $e");
    }
  }

  void clearData() {
    detailUser.value = null;
    akunController.profileAkun.value = null;
  }
}
