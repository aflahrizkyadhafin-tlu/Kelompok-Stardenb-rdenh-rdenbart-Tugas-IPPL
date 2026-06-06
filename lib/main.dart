import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:setting_api/controllers/auth_controller.dart';
import 'package:setting_api/controllers/connection.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized;
  Connection.connectDB();

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    AuthController controller = Get.put(AuthController());
    // Data dummy
    // Pengiriman dataDummy = Pengiriman(
    //   nomorResi: 'JNT123456789',
    //   deskripsiBarang: 'Laptop ASUS Vivobook 14 Inch',
    //   berat: 2.5,
    //   biaya: 45000,
    //   statusPengiriman: StatusPengiriman.pending,
    //   namaPenerima: "Budi Santoso",
    //   nomorTeleponPenerima: "081234567890",
    //   alamatPenerima: "Jl. Jenderal Sudirman No. 45, Purwokerto",
    //   latPenerima: -7.4140,
    //   longPenerima: 109.2370,
    //   alamatPengirim: "Gudang Pusat, Jakarta Selatan",
    //   latPengirim: -6.2297,
    //   longPengirim: 106.8295,
    //   idPelanggan: '3b5080c8-619d-4f6b-82c2-e6ec902d4af4',
    // );

    String email = "rinepac727@brixozu.com";
    TextEditingController kodeOTP = TextEditingController();

    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Center(
            child: Column(
              children: [
                ElevatedButton(onPressed: (){
                  controller.register(email);
                }, child: Text("Cek Register")),
                SizedBox(height: 25),
                TextField(decoration: InputDecoration(hintText: "Kode OTP"),controller: kodeOTP,),
                ElevatedButton(onPressed: (){
                  controller.verifOTP(kodeOTP.text.trim(), email);
                }, child: Text("Verifikasi Token")),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
