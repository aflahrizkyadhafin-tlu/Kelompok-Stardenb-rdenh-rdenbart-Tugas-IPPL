import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 20,
        left: 20,  
        right: 20, 
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Tombol Back dan Judul Halaman
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back_ios, color: Color(0xFFB01212)),
                  onPressed: () {},
                ),
                const Text(
                  "Verifikasi Kode OTP",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFFB01212)),
                ),
              ],
            ),
            const SizedBox(height: 8),
            const Text("Kode OTP yang sudah diterima di WhatsApp"),
            const SizedBox(height: 30),

            // Icon Chat/Bubble merah muda
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: const Color(0xFFFCD3D3),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(
                Icons.chat_bubble_outline,
                color: Color(0xFFB01212),
                size: 30,
              ),
            ),
            const SizedBox(height: 20),

            const Text("Kode OTP", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            const Text("Masukkan 6 digit Kode OTP yang sudah kita kirim."),
            const SizedBox(height: 20),

            // Area Timer Kadaluwarsa
            const Center(
              child: Column(
                children: [
                  Text("Kode Kadaluwarsa dalam"),
                  SizedBox(height: 5),
                  Text(
                    "02:00",
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Color(0xFFB01212)),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 25),

            // Input Box Kotak-Kotak 6 Digit OTP
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(
                6,
                (index) {
                  // ← Nilai angka yang ingin ditampilkan
                  final List<String> otpValues = ['5', '0', '0', '3', '6', '1'];

                  return SizedBox(
                    width: 45,
                    child: TextField(
                      controller: TextEditingController(text: otpValues[index]), // ← tambahkan ini
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      maxLength: 1,
                      decoration: InputDecoration(
                        counterText: "",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: Colors.grey),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),

            // Area Kirim Ulang
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Tidak menerima kode? "),
                  GestureDetector(
                    onTap: () {},
                    child: const Text(
                      "Kirim ulang",
                      style: TextStyle(color: Color(0xFFB01212), fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 25),

            // Label Input Nomor Telepon
            const Row(
              children: [
                Icon(Icons.phone, size: 18, color: Colors.black54),
                SizedBox(width: 5),
                Text("Nomor Telepon"),
              ],
            ),
            const SizedBox(height: 5),
            
            // Field Box Nomor Telepon (Disabled)
            TextField(
              enabled: false,
              decoration: InputDecoration(
                hintText: "6281234567890",
                contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.grey),
                ),
              ),
            ),
            const SizedBox(height: 10),

            // Area Tombol Ubah Nomor Telepon (SUDAH DIPERBAIKI SINTAKSNYA)
            GestureDetector(
              onTap: () {},
              child: const Text(
                "Ubah Nomor Telepon",
                style: TextStyle(color: Color(0xFFB01212), fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 40),

            // Tombol Utama Verifikasi
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFB01212),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {},
                child: const Text(
                  "Verifikasi",
                  style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                ), 
              ),
            ),
          ],
        ),
      ),
    );
  }
}