import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      home: const MasukNoHP(),
    );
  }
}

class MasukNoHP extends StatefulWidget {
  const MasukNoHP({super.key});

  @override
  State<MasukNoHP> createState() => _MasukNoHPState();
}

class _MasukNoHPState extends State<MasukNoHP> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                //HEADER BOX
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(9.7),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.white,
                      style: BorderStyle.solid,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                              //Navigator.pop(context);
                            },
                            borderRadius: BorderRadius.circular(4),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 4.0,
                                horizontal: 2.0,
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    Icons.arrow_back_ios,
                                    size: 18,
                                    color: Colors.red.shade900,
                                  ),
                                  const SizedBox(width: 8),
                                  Text(
                                    'Verifikasi Akun',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.red.shade900,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'Masukkan nomor HP (WhatsApp) untuk verifikasi akun dan berkomunikasi',
                        style: TextStyle(fontSize: 13, color: Colors.black87),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 40),

                //ICON
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.red.shade100,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.phone_in_talk,
                    color: Colors.red.shade400,
                    size: 30,
                  ),
                ),
                const SizedBox(height: 24),

                //JUDUL
                const Text(
                  'Nomor HP Aktif',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Masukan nomor HP yang terhubung di WhatsApp untuk menerima kode OTP',
                  style: TextStyle(fontSize: 14, color: Colors.black54),
                ),

                const SizedBox(height: 32),

                Row(
                  children: [
                    Icon(
                      Icons.phone_outlined,
                      size: 20,
                      color: Colors.grey.shade700,
                    ),
                    const SizedBox(width: 12),
                    const Text(
                      'Masukan nomor HP',
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                  ],
                ),

                const SizedBox(height: 8),
                TextFormField(
                  keyboardType: TextInputType.number,
                  // Input hanya angka
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: Colors.grey),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Colors.grey.shade400),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: Colors.red),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: Colors.red, width: 2),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'harap masukan nomor telepon yang valid';
                    }
                    String nomor = value.trim();

                    // Wajib 08/628, Max panjang 9-13 digit
                    String pattern = r'^(08|628)[0-9]{9,11}$';
                    RegExp regExp = RegExp(pattern);

                    if (!regExp.hasMatch(value)) {
                      return 'harap masukan nomor telepon yang valid';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 8),
                const Text(
                  'Contoh: 62895402632655',
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
                const SizedBox(height: 40),

                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.green.shade100,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.info_outline,
                        color: Colors.green.shade700,
                        size: 20,
                      ),
                      const SizedBox(width: 12),
                      const Expanded(
                        child: Text(
                          'Kode OTP dikirim via WhatsApp, bukan SMS. Pastikan nomor aktif di WhatsApp',
                          style: TextStyle(fontSize: 12, color: Colors.black87),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 40),

                //button kirim
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      // 3. Memvalidasi form saat tombol ditekan
                      if (_formKey.currentState!.validate()) {
                        // Jika valid, jalankan fungsi kirim OTP di sini
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Memproses OTP...')),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red.shade700,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      'Kirim Kode OTP',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
