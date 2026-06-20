import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mykurir/controllers/auth_controller.dart';
import 'package:mykurir/controllers/loading_controller.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    RxBool _isObscure = true.obs;

    final LoadingController _loadingController = Get.find();
    final AuthController _authController = Get.find();
    TextEditingController _emailController = TextEditingController();
    TextEditingController _passwordController = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Obx(
          () => _loadingController.getLoadingStatus().value
              ? Center(child: CircularProgressIndicator())
              : SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 60),
                      const Text(
                        'Masuk',
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFE31E24),
                        ),
                      ),
                      const Text(
                        'Silahkan masuk ke akun',
                        style: TextStyle(fontSize: 16, color: Colors.black54),
                      ),

                      const SizedBox(height: 40),
                      //Logo
                      Center(
                        child: Container(
                          height: 150,
                          width: 150,
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            shape: BoxShape.circle,
                          ),
                          child: const Center(
                            child: Text(
                              'Logo',
                              style: TextStyle(color: Colors.black45),
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 50),

                      _inputLabel(
                        Icons.person_outline,
                        'Nama Pengguna / Email',
                      ),
                      const SizedBox(height: 8),
                      TextFormField(
                        controller: _emailController,
                        decoration: _inputDecoration(),
                      ),

                      const SizedBox(height: 20),

                      _inputLabel(Icons.lock_outline, 'Password'),
                      const SizedBox(height: 8),
                      TextFormField(
                        controller: _passwordController,
                        obscureText: _isObscure.value,
                        decoration: _inputDecoration(
                          suffixIcon: IconButton(
                            icon: Icon(
                              _isObscure.value
                                  ? Icons.visibility_off_outlined
                                  : Icons.visibility_outlined,
                              color: Colors.black54,
                            ),
                            onPressed: () {
                              _isObscure.value = !_isObscure.value;
                            },
                          ),
                        ),
                      ),

                      const SizedBox(height: 40),
                      //Login Button
                      SizedBox(
                        width: double.infinity,
                        height: 55,
                        child: ElevatedButton(
                          onPressed: () {
                            _loadingController.show();
                            _authController
                                .login(
                                  _emailController.text.trim(),
                                  _passwordController.text.trim(),
                                )
                                .then(
                                  (e) => {
                                    if (_authController.detailUser.value !=
                                        null)
                                      {
                                        Get.snackbar(
                                          "Login berhasil",
                                          "Email : ${_authController.detailUser.value!.email}",
                                        ),
                                        Get.toNamed("/rating_aplikasi"),
                                      },
                                  },
                                );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFE31E24),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: const Text(
                            'Masuk',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 25),
                      //Buat Akun Button
                      Center(
                        child: Column(
                          children: [
                            const Text(
                              'Belum memiliki akun?',
                              style: TextStyle(color: Colors.black54),
                            ),
                            GestureDetector(
                              onTap: () {
                                Get.toNamed("/daftar");
                              },
                              child: const Text(
                                'Buat Akun',
                                style: TextStyle(
                                  color: Color(0xFFE31E24),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
        ),
      ),
    );
  }

  Widget _inputLabel(IconData icon, String label) {
    return Row(
      children: [
        Icon(icon, size: 20, color: Colors.black87),
        const SizedBox(width: 8),
        Text(label, style: const TextStyle(fontWeight: FontWeight.w500)),
      ],
    );
  }

  InputDecoration _inputDecoration({Widget? suffixIcon}) {
    return InputDecoration(
      suffixIcon: suffixIcon,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
    );
  }
}
