import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController usernameController = TextEditingController();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final TextEditingController confirmPasswordController = TextEditingController();

    final ValueNotifier<bool> isObscurePassword = ValueNotifier<bool>(true);
    final ValueNotifier<bool> isObscureConfirmPassword = ValueNotifier<bool>(true);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 40),
                const Text(
                  'Buat Akun',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFE31E24),
                  ),
                ),
                const Text('Buat akun untuk masuk ke aplikasi'),
                const SizedBox(height: 30),

                // Input Nama Pengguna
                _buildTextField(
                  label: 'Nama Pengguna',
                  icon: Icons.person_outline,
                  controller: usernameController,
                ),
                const SizedBox(height: 16),

                // Input Email
                _buildTextField(
                  label: 'Email',
                  icon: Icons.email_outlined,
                  controller: emailController,
                ),
                const SizedBox(height: 16),

                ValueListenableBuilder<bool>(
                  valueListenable: isObscurePassword,
                  builder: (context, obscure, child) {
                    return _buildTextField(
                      label: 'Password',
                      icon: Icons.lock_outline,
                      controller: passwordController,
                      isPassword: true,
                      obscureText: obscure,
                      suffixIcon: IconButton(
                        icon: Icon(
                          obscure ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                          color: Colors.grey,
                        ),
                        onPressed: () => isObscurePassword.value = !isObscurePassword.value,
                      ),
                    );
                  },
                ),
                const SizedBox(height: 16),

                ValueListenableBuilder<bool>(
                  valueListenable: isObscureConfirmPassword,
                  builder: (context, obscure, child) {
                    return _buildTextField(
                      label: 'Konfirmasi Password',
                      icon: Icons.lock_reset_outlined,
                      controller: confirmPasswordController,
                      isPassword: true,
                      obscureText: obscure,
                      suffixIcon: IconButton(
                        icon: Icon(
                          obscure ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                          color: Colors.grey,
                        ),
                        onPressed: () => isObscureConfirmPassword.value = !isObscureConfirmPassword.value,
                      ),
                    );
                  },
                ),
                const SizedBox(height: 30),

                // Tombol Daftar
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      // Taruh logika pendaftaran di sini
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFE31E24),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      'Daftar',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // Navigasi ke Halaman Masuk
                Center(
                  child: Column(
                    children: [
                      const Text('Sudah memiliki akun?'),
                      TextButton(
                        onPressed: () => Navigator.pushNamed(context, '/login'),
                        child: const Text(
                          'Masuk',
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

  Widget _buildTextField({
    required String label,
    required IconData icon,
    required TextEditingController controller,
    bool isPassword = false,
    bool obscureText = false,
    Widget? suffixIcon,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(icon, size: 20, color: Colors.grey),
            const SizedBox(width: 8),
            Text(label, style: const TextStyle(fontWeight: FontWeight.w500)),
          ],
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          obscureText: isPassword ? obscureText : false,
          decoration: InputDecoration(
            suffixIcon: suffixIcon,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 12,
            ),
          ),
        ),
      ],
    );
  }
}