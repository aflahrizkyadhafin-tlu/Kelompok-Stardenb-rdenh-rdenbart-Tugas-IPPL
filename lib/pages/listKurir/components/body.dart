import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  void _showDriverPopup(BuildContext context, Map<String, dynamic> kurir) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: const Color(0xFFF7EFE5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
            side: const BorderSide(color: Color(0xFF9E1014), width: 2),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      width: 75,
                      height: 75,
                      decoration: BoxDecoration(
                        color: const Color(0xFFF3B7B8),
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: const Color(0xFF9E1014),
                          width: 1.5,
                        ),
                      ),
                      child: const Icon(
                        Icons.person_outline,
                        size: 45,
                        color: Color(0xFF9E1014),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            kurir['nama'],
                            style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Row(
                            children: [
                              const Icon(
                                Icons.star,
                                color: Colors.orange,
                                size: 20,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                kurir['rating'] ?? '-',
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 16),

                Row(
                  children: List.generate(
                    30,
                    (index) => Expanded(
                      child: Container(
                        color: index % 2 == 0
                            ? const Color(0xFF9E1014)
                            : Colors.transparent,
                        height: 2,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 16),

                const Text(
                  'Informasi Kendaraan',
                  style: TextStyle(
                    color: Color(0xFF9E1014),
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),

                const SizedBox(height: 10),

                Row(
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: const Color(0xFFF3B7B8),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: const Color(0xFF9E1014),
                          width: 1.5,
                        ),
                      ),
                      child: const Icon(
                        Icons.motorcycle,
                        size: 30,
                        color: Color(0xFF9E1014),
                      ),
                    ),
                    const SizedBox(width: 14),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          kurir['kendaraan'],
                          style: const TextStyle(
                            color: Color(0xFF9E1014),
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFF5A0C0E),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Text(
                            kurir['plat'] ?? 'JE 1240 BCF',
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                              letterSpacing: 0.5,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          color: Color(0xFF5A0C0E),
                          size: 22,
                        ),
                        SizedBox(width: 6),
                        Text(
                          'Jarak ke Lokasimu',
                          style: TextStyle(
                            color: Color(0xFF5A0C0E),
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      kurir['jarak'] ?? '1,5 km',
                      style: const TextStyle(
                        color: Color(0xFF5A0C0E),
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: OutlinedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(
                        color: Color(0xFFE31E24),
                        width: 1.5,
                      ),
                      backgroundColor: const Color(0xFFF7EFE5),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      elevation: 2,
                      shadowColor: Colors.black,
                    ),
                    child: const Text(
                      'Konfirmasi',
                      style: TextStyle(
                        color: Color(0xFFE31E24),
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> listKurir = [
      {
        'nama': 'Muhammad Rizqi Ar Rafi',
        'rating': '4.3',
        'kendaraan': 'Karisma X 125',
        'plat': 'JE 1240 BCF',
        'jarak': '1,5 km',
        'status': 'Online',
        'initiallyExpanded': false,
      },
      {
        'nama': 'Aflah Rizkyadhafin',
        'rating': '4.5',
        'kendaraan': 'Honda Revo',
        'plat': 'B 4110 KGA',
        'jarak': '2,1 km',
        'status': 'Online',
        'initiallyExpanded': false,
      },
      {
        'nama': 'Hamzah Hafidz Dzaky',
        'rating': '4.8',
        'kendaraan': 'Vario 125',
        'plat': 'R 5532 AA',
        'jarak': '0,8 km',
        'status': 'Offline',
        'initiallyExpanded': false,
      },
      {
        'nama': 'Nadhif Ahnaf Fauzan',
        'rating': '4.2',
        'kendaraan': 'Honda Scoopy',
        'plat': 'AB 8901 NY',
        'jarak': '3,4 km',
        'status': 'Online',
        'initiallyExpanded': false,
      },
      {
        'nama': 'Raffy Dwi Anggara',
        'rating': '4.6',
        'kendaraan': 'Honda Beat',
        'plat': 'D 2231 VBC',
        'jarak': '1,2 km',
        'status': 'Online',
        'initiallyExpanded': false,
      },
      {
        'nama': 'Gilar Saputra',
        'rating': '4.0',
        'kendaraan': 'Yamaha Mio',
        'plat': 'Z 6744 DX',
        'jarak': '4,0 km',
        'status': 'Offline',
        'initiallyExpanded': false,
      },
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        scrolledUnderElevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Color(0xFFE31E24),
            size: 20,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        titleSpacing: 0,
        title: const Text(
          'List Kurir Tersedia',
          style: TextStyle(
            color: Color(0xFFE31E24),
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1.0),
          child: Container(
            color: Colors.black,
            height: 1.0,
            margin: const EdgeInsets.symmetric(horizontal: 16.0),
          ),
        ),
      ),
      body: SafeArea(
        child: ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
          itemCount: listKurir.length,
          itemBuilder: (context, index) {
            final kurir = listKurir[index];

            return Container(
              margin: const EdgeInsets.only(bottom: 14.0),
              decoration: BoxDecoration(
                color: const Color(0xFFD9D9D9),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Theme(
                data: Theme.of(context).copyWith(
                  dividerColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                ),
                child: ExpansionTile(
                  initiallyExpanded: kurir['initiallyExpanded'] ?? false,
                  tilePadding: const EdgeInsets.symmetric(
                    horizontal: 12.0,
                    vertical: 4.0,
                  ),
                  trailing: const Icon(
                    Icons.keyboard_arrow_right,
                    color: Colors.black,
                    size: 30,
                  ),
                  leading: const CircleAvatar(
                    radius: 16,
                    backgroundColor: Color(0xFF5B9BD5),
                    child: Text(
                      'P',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  title: Text(
                    kurir['nama'],
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                  children: [
                    Container(color: Colors.black26, height: 1),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          _buildDetailRow(
                            'Rating',
                            ': ${kurir['rating'] ?? "-"}',
                          ),
                          const SizedBox(height: 8),
                          _buildDetailRow(
                            'Kendaraan',
                            ': ${kurir['kendaraan']}',
                          ),
                          const SizedBox(height: 8),
                          _buildDetailRow(
                            'Status',
                            ': ${kurir['status'] ?? "-"}',
                          ),
                          const SizedBox(height: 16),
                          SizedBox(
                            width: double.infinity,
                            height: 48,
                            child: ElevatedButton(
                              onPressed: () {
                                _showDriverPopup(context, kurir);
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF4ACA2D),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                elevation: 0,
                              ),
                              child: const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.chat,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                  SizedBox(width: 8),
                                  Text(
                                    'Hubungi Kurir',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 90,
          child: Text(
            label,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontSize: 13,
            ),
          ),
        ),
        Expanded(
          child: Text(
            value,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontSize: 13,
            ),
          ),
        ),
      ],
    );
  }
}
