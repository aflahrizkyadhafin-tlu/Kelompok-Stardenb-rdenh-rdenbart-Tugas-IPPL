import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController deskripsiController = TextEditingController();
    final TextEditingController customBeratController = TextEditingController();

    final ValueNotifier<String?> selectedUkuranNotifier = ValueNotifier<String?>(null);
    final ValueNotifier<double?> selectedBeratNotifier = ValueNotifier<double?>(null);
    final ValueNotifier<bool> isCustomSelectedNotifier = ValueNotifier<bool>(false);
    
    final ValueNotifier<String> customBeratTextNotifier = ValueNotifier<String>('');

    customBeratController.addListener(() {
      customBeratTextNotifier.value = customBeratController.text;
    });

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
      body: AnimatedBuilder(
        animation: Listenable.merge([
          selectedUkuranNotifier,
          selectedBeratNotifier,
          isCustomSelectedNotifier,
          customBeratTextNotifier,
        ]),
        builder: (context, _) {
          bool isBeratValid = isCustomSelectedNotifier.value
              ? customBeratController.text.trim().isNotEmpty
              : selectedBeratNotifier.value != null;

          bool isFormValid = selectedUkuranNotifier.value != null && isBeratValid;

          return Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Header
                      RichText(
                        text: TextSpan(
                          text: 'Pilih ukuran dan berat',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                          children: [
                            if (!isFormValid)
                              const TextSpan(
                                text: ' *',
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
                        controller: deskripsiController,
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
                          _buildUkuranCard(context, 'Kecil', 'Maks. 30cm', selectedUkuranNotifier),
                          _buildUkuranCard(context, 'Sedang', 'Maks. 50cm', selectedUkuranNotifier),
                          _buildUkuranCard(context, 'Besar', 'Maks. 100cm', selectedUkuranNotifier),
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
                            if (!isBeratValid)
                              const TextSpan(
                                text: ' *',
                                style: TextStyle(color: Colors.red),
                              ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 12),
                      Row(
                        children: [
                          _buildBeratCard(
                            title: '1 - 5 Kg',
                            value: 5.0,
                            selectedBeratNotifier: selectedBeratNotifier,
                            isCustomSelectedNotifier: isCustomSelectedNotifier,
                            customBeratController: customBeratController,
                          ),
                          const SizedBox(width: 16),
                          _buildBeratCard(
                            title: 'Custom',
                            isCustom: true,
                            selectedBeratNotifier: selectedBeratNotifier,
                            isCustomSelectedNotifier: isCustomSelectedNotifier,
                            customBeratController: customBeratController,
                          ),
                        ],
                      ),

                      if (isCustomSelectedNotifier.value) ...[
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
                              if (customBeratController.text.trim().isEmpty)
                                const TextSpan(
                                  text: ' *',
                                  style: TextStyle(color: Colors.red),
                                ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 6),
                        TextField(
                          controller: customBeratController,
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
                    onPressed: isFormValid
                        ? () {
                            double beratAkhir = isCustomSelectedNotifier.value
                                ? (double.tryParse(customBeratController.text.trim()) ?? 0.0)
                                : (selectedBeratNotifier.value ?? 0.0);

                          }
                        : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: isFormValid ? const Color(0xFFE31E24) : Colors.grey.shade300,
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
                        color: isFormValid ? Colors.white : Colors.grey.shade500,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildUkuranCard(
    BuildContext context,
    String title,
    String subTitle,
    ValueNotifier<String?> notifier,
  ) {
    bool isSelected = notifier.value == title;

    return GestureDetector(
      onTap: () {
        if (isSelected) {
          notifier.value = null;
        } else {
          notifier.value = title;
        }
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
    required ValueNotifier<double?> selectedBeratNotifier,
    required ValueNotifier<bool> isCustomSelectedNotifier,
    required TextEditingController customBeratController,
  }) {
    bool isSelected = isCustom
        ? isCustomSelectedNotifier.value
        : (selectedBeratNotifier.value == value && !isCustomSelectedNotifier.value);

    return GestureDetector(
      onTap: () {
        if (isSelected) {
          selectedBeratNotifier.value = null;
          isCustomSelectedNotifier.value = false;
          customBeratController.clear();
        } else {
          isCustomSelectedNotifier.value = isCustom;
          selectedBeratNotifier.value = value;
          if (!isCustom) {
            customBeratController.clear();
          }
        }
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