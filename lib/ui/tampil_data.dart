import 'package:flutter/material.dart';
import 'form_data.dart';

class TampilDataPage extends StatelessWidget {
  final PersonData data;

  const TampilDataPage({super.key, required this.data});

  int _hitungUsia() {
    final year = DateTime.now().year;
    return year - data.tahunLahir;
  }

  @override
  Widget build(BuildContext context) {
    final usia = _hitungUsia();
    return Scaffold(
      appBar: AppBar(title: const Text('Hasil Input'), centerTitle: true),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFE6EEF8), Color(0xFFBEE7E9)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Card(
            elevation: 10,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 22, horizontal: 20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const CircleAvatar(
                    radius: 36,
                    backgroundColor: Colors.indigo,
                    child: Icon(Icons.person, color: Colors.white, size: 40),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    data.nama,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    'NIM: ${data.nim}',
                    style: const TextStyle(color: Colors.black54),
                  ),
                  const SizedBox(height: 12),
                  Divider(color: Colors.grey[300]),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Tahun Lahir', style: TextStyle(fontSize: 16)),
                      Text(
                        '${data.tahunLahir}',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Usia (perkiraan)',
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        '$usia tahun',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 18),
                  ElevatedButton.icon(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: const Icon(Icons.arrow_back),
                    label: const Text('Kembali'),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
