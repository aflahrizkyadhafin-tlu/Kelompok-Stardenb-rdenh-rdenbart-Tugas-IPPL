import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:setting_api/controllers/connection.dart';
import 'package:setting_api/controllers/penawaran_controller.dart';
import 'package:setting_api/controllers/pengiriman_controller.dart';
import 'package:setting_api/controllers/rating_controller.dart';
import 'package:setting_api/models/pengiriman.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized;
  Connection.connectDB();

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    RatingController ratingController = Get.put(RatingController());
    // Data dummy
    Pengiriman dataDummy = Pengiriman(
      nomorResi: 'JNT123456789',
      deskripsiBarang: 'Laptop ASUS Vivobook 14 Inch',
      berat: 2.5,
      biaya: 45000,
      statusPengiriman: StatusPengiriman.pending,
      namaPenerima: "Budi Santoso",
      nomorTeleponPenerima: "081234567890",
      alamatPenerima: "Jl. Jenderal Sudirman No. 45, Purwokerto",
      latPenerima: -7.4140,
      longPenerima: 109.2370,
      alamatPengirim: "Gudang Pusat, Jakarta Selatan",
      latPengirim: -6.2297,
      longPengirim: 106.8295,
      idPelanggan: '3b5080c8-619d-4f6b-82c2-e6ec902d4af4',
    );

    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            children: [
              ElevatedButton(
                onPressed: () {
                  ratingController.beriRating(
                    8.5,
                    "Pelayanan ramah",
                    "3b5080c8-619d-4f6b-82c2-e6ec902d4af4",
                    "a0923d8e-fdbe-4a1d-8b04-013cbef08199",
                    "9ab4f700-c523-4edc-97bb-cb9d9bba8bbb",
                  );
                },
                child: Text("Beri rating"),
              ),
              ElevatedButton(
                onPressed: () {
                  ratingController.getRatingByPengiriman(
                    "9ab4f700-c523-4edc-97bb-cb9d9bba8bbb",
                  );
                },
                child: Text("getRatingByPengiriman"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
