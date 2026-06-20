import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> listKurir = [
      {
        'nama': 'Muhammad Rizqi Ar Rafi',
        'rating': '4.3',
        'kendaraan': 'Karisma X 125',
        'status': 'Online',
        'initiallyExpanded': true,
      },
      {
        'nama': 'Aflah Rizkyadhafin',
        'rating': '4.5',
        'kendaraan': 'Honda Revo',
        'status': 'Online',
        'initiallyExpanded': false,
      },
      {
        'nama': 'Hamzah Hafidz Dzaky',
        'rating': '4.8',
        'kendaraan': 'Vario 125',
        'status': 'Offline',
        'initiallyExpanded': false,
      },
      {
        'nama': 'Nadhif Ahnaf Fauzan',
        'rating': '4.2',
        'kendaraan': 'Honda Scoopy',
        'status': 'Online',
        'initiallyExpanded': false,
      },
      {
        'nama': 'Raffy Dwi Anggara',
        'rating': '4.6',
        'kendaraan': 'Honda Beat',
        'status': 'Online',
        'initiallyExpanded': false,
      },
      {
        'nama': 'Gilar Saputra',
        'rating': '4.0',
        'kendaraan': 'Yamaha Mio',
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
                              onPressed: () {},
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
