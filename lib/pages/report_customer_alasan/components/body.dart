import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
          children: [                              // <-- ini yang hilang
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
                  onPressed: () {},
                ),
                Text(
                  "Laporkan Akun",
                  style: GoogleFonts.poppins(
                    fontSize: 26, 
                    fontWeight: FontWeight.bold, 
                    color: Color(0xFF000000)
                    ),
                ),
              ],
            ),
            const SizedBox(height: 24),

            Text(
              "Alasan Lapor",
              style: GoogleFonts.poppins(
                fontSize: 15, 
                fontWeight: FontWeight.bold, 
                color: Color(0xFF000000)
                ),
            ),

            // Area Text Field
          Padding(
            padding: const EdgeInsets.only(top: 70),
            child: SizedBox(
              height: 300,
              child: TextField(
                maxLines: null,
                expands: true,
                textAlignVertical: TextAlignVertical.top,
                decoration: InputDecoration(
                  hintText: "Saya melaporkan akun ini karena telah melakukan pembatalan pesanan secara sepihak tanpa adanya konfirmasi maupun alasan yang jelas sebelumnya. Tindakan tersebut menyebabkan kerugian dari segi waktu dan proses transaksi yang sudah berjalan. Selain itu, komunikasi dari pihak akun juga kurang responsif sehingga penyelesaian pesanan tidak dapat dilakukan dengan baik. Oleh karena itu, saya berharap laporan ini dapat ditindaklanjuti agar kejadian serupa tidak terulang kembali kepada pengguna lain.",
                  hintStyle: GoogleFonts.poppins(
                    color: Color(0xFF000000), 
                    fontSize: 12
                    ),
                  contentPadding: const EdgeInsets.all(16),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Colors.black, width: 1),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Colors.black, width: 1),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Colors.black, width: 1.5),
                  ),
                ),
              ),
            ),
          ),
            const SizedBox(height: 24),

            // Tombol Submit
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFD32F2F),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                onPressed: () {},
                child: Text(
                  "Laporkan",
                  style: GoogleFonts.poppins(
                    color: Colors.white, 
                    fontSize: 16, 
                    fontWeight: FontWeight.bold
                    ),
                ),
              ),
            ),
            const SizedBox(height: 32),
          ],                                      // <-- penutup children Column
        ),
      ),
    );
  }
}