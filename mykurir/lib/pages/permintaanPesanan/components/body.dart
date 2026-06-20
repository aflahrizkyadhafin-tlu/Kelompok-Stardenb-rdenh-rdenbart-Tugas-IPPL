import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mykurir/controllers/loading_controller.dart';
import 'package:mykurir/controllers/pengiriman_controller.dart';
import 'package:mykurir/models/pengiriman.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final TextEditingController _deskripsiController = TextEditingController();
  final TextEditingController _customBeratController = TextEditingController();

  DimensiBarang? _selectedUkuran;
  String? _selectedUkuranName;
  double? _selectedBerat;
  bool _isCustomSelected = false;

  bool get _isFormValid {
    if (_selectedUkuranName == null) return false;
    if (!_isBeratValid) return false;
    return true;
  }

  bool get _isBeratValid {
    if (_isCustomSelected) {
      return _customBeratController.text.trim().isNotEmpty;
    }
    return _selectedBerat != null;
  }

  @override
  void initState() {
    super.initState();
    _customBeratController.addListener(_onCustomBeratChanged);
  }

  void _onCustomBeratChanged() {
    setState(() {});
  }

  @override
  void dispose() {
    _deskripsiController.dispose();
    _customBeratController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    LoadingController loadingController = Get.find();
    PengirimanController pengirimanController = Get.find();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        titleSpacing: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black, size: 20),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Ukuran & berat paket',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: false,
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //Header
                  RichText(
                    text: TextSpan(
                      text: 'Pilih ukuran dan berat',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                      children: [
                        if (!_isFormValid)
                          const TextSpan(
                            text: '*',
                            style: TextStyle(color: Colors.red),
                          ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Pastiin paket kamu udah sesuai sama S&K Barang MyKurir, biar bisa klaim perlindungan paket.',
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.grey.shade700,
                      height: 1.4,
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Deskripsi barang (text box)
                  const Text(
                    'Deskripsi barang',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 6),
                  TextField(
                    controller: _deskripsiController,
                    decoration: InputDecoration(
                      hintText: 'contoh: Cucian Pakaian',
                      hintStyle: const TextStyle(color: Colors.black38),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Colors.black),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Ukuran Barang
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildUkuranCard('Kecil', 'Maks. 30cm'),
                      _buildUkuranCard('Sedang', 'Maks. 50cm'),
                      _buildUkuranCard('Besar', 'Maks. 100cm'),
                    ],
                  ),
                  const SizedBox(height: 24),

                  // Berat Barang
                  RichText(
                    text: TextSpan(
                      text: 'Berapa berat Paketmu?',
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                      children: [
                        if (!_isBeratValid)
                          const TextSpan(
                            text: '*',
                            style: TextStyle(color: Colors.red),
                          ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      //Valie fIX
                      _buildBeratCard(title: '1 - 5 Kg', value: 5.0),
                      const SizedBox(width: 16),
                      _buildBeratCard(title: 'Custom', isCustom: true),
                    ],
                  ),

                  // Form berat custom muncul berdasarkan kondisi boolean _isCustomSelected
                  if (_isCustomSelected) ...[
                    const SizedBox(height: 50),
                    RichText(
                      text: TextSpan(
                        text: 'Berat',
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                        children: [
                          if (_customBeratController.text.trim().isEmpty)
                            const TextSpan(
                              text: '*',
                              style: TextStyle(color: Colors.red),
                            ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 6),
                    TextField(
                      controller: _customBeratController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        hintText: 'Masukan berat...',
                        hintStyle: TextStyle(color: Colors.black26),
                        suffixText: 'Kg',
                        suffixStyle: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),

          // Button Simpan
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(
                top: BorderSide(color: Colors.grey.shade200, width: 1),
              ),
            ),
            child: SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: _isFormValid
                    ? () {
                        double beratAkhir = _isCustomSelected
                            ? (double.tryParse(
                                    _customBeratController.text.trim(),
                                  ) ??
                                  0.0)
                            : (_selectedBerat ?? 0.0);

                        pengirimanController.sendData.deskripsiBarang =
                            _deskripsiController.text.trim();
                        pengirimanController.sendData.ukuran = _selectedUkuran;
                        pengirimanController.sendData.berat = beratAkhir;

                        // Isi buat ke pahge selanjutnya
                      }
                    : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: _isFormValid
                      ? const Color(0xFFE31E24)
                      : Colors.grey.shade300,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  'Simpan',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: _isFormValid ? Colors.white : Colors.grey.shade500,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildUkuranCard(String title, String subTitle) {
    bool isSelected = _selectedUkuranName == title;

    return GestureDetector(
      onTap: () {
        setState(() {
          if (isSelected) {
            _selectedUkuran = null;
            _selectedUkuranName = null;
          } else {
            _selectedUkuranName = title;
            if (title == "Kecil") {
              _selectedUkuran = DimensiBarang.kecil;
            } else if (title == "Sedang") {
              _selectedUkuran = DimensiBarang.sedang;
            } else {
              _selectedUkuran = DimensiBarang.besar;
            }
          }
        });
      },
      child: Container(
        width: MediaQuery.of(context).size.width * 0.28,
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? const Color(0xFFE31E24) : Colors.grey.shade400,
            width: isSelected ? 2 : 1,
          ),
        ),
        child: Column(
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              subTitle,
              style: TextStyle(fontSize: 11, color: Colors.grey.shade600),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBeratCard({
    required String title,
    double? value,
    bool isCustom = false,
  }) {
    bool isSelected = isCustom
        ? _isCustomSelected
        : (_selectedBerat == value && !_isCustomSelected);
    // Logika Value disini
    return GestureDetector(
      onTap: () {
        setState(() {
          if (isSelected) {
            _selectedBerat = null;
            _isCustomSelected = false;
            _customBeratController.clear();
          } else {
            _isCustomSelected = isCustom;
            _selectedBerat = value;
            if (!isCustom) {
              _customBeratController.clear();
            }
          }
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: isSelected ? const Color(0xFFE31E24) : Colors.grey.shade400,
            width: isSelected ? 2 : 1,
          ),
        ),
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
