import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      home: const Daftar(),
    );
  }
}

class Daftar extends StatelessWidget {
  const Daftar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              _buildTextField(
                label: 'Nama Pengguna',
                icon: Icons.person_outline,
              ),
              const SizedBox(height: 16),
              _buildTextField(label: 'Email', icon: Icons.email_outlined),
              const SizedBox(height: 16),
              _buildTextField(
                label: 'Password',
                icon: Icons.lock_outline,
                isPassword: true,
              ),
              const SizedBox(height: 16),
              _buildTextField(
                label: 'Konfirmasi Password',
                icon: Icons.lock_reset_outlined,
                isPassword: true,
              ),
              const SizedBox(height: 30),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {},
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
              Center(
                child: Column(
                  children: [
                    const Text('Sudah memiliki akun?'),
                    TextButton(
                      onPressed: () => Navigator.pushNamed(
                        context,
                        '/login',
                      ), // Kembali ke halaman Login
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
    );
  }

  Widget _buildTextField({
    required String label,
    required IconData icon,
    bool isPassword = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(icon, size: 20, color: Colors.grey),
            const SizedBox(width: 8),
            Text(label),
          ],
        ),
        const SizedBox(height: 8),
        TextFormField(
          obscureText: isPassword,
          decoration: InputDecoration(
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
