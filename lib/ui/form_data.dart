import 'package:flutter/material.dart';
import 'tampil_data.dart';

class PersonData {
  final String nama;
  final String nim;
  final int tahunLahir;

  PersonData({required this.nama, required this.nim, required this.tahunLahir});
}

class FormDataPage extends StatefulWidget {
  const FormDataPage({super.key});

  @override
  State<FormDataPage> createState() => _FormDataPageState();
}

class _FormDataPageState extends State<FormDataPage> {
  final _formKey = GlobalKey<FormState>();
  final _namaCtl = TextEditingController();
  final _nimCtl = TextEditingController();
  final _tahunCtl = TextEditingController();

  @override
  void dispose() {
    _namaCtl.dispose();
    _nimCtl.dispose();
    _tahunCtl.dispose();
    super.dispose();
  }

  void _submit() {
    if (!_formKey.currentState!.validate()) return;

    final data = PersonData(
      nama: _namaCtl.text.trim(),
      nim: _nimCtl.text.trim(),
      tahunLahir: int.parse(_tahunCtl.text.trim()),
    );

    // Passing data by constructor via Navigator.push
    Navigator.of(
      context,
    ).push(MaterialPageRoute(builder: (context) => TampilDataPage(data: data)));
  }

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF0F172A), Color(0xFF0EA5A4)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    children: [
                      const CircleAvatar(
                        radius: 28,
                        backgroundColor: Colors.white24,
                        child: Icon(
                          Icons.person,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Tugas6',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'H1D023045',
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 28),

                  Container(
                    width: double.infinity,
                    constraints: BoxConstraints(minHeight: media.height * 0.5),
                    padding: const EdgeInsets.all(18),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 16,
                          offset: Offset(0, 8),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        const Text(
                          'Form Data Mahasiswa',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          'Isi nama, NIM, dan tahun lahir lalu tekan tombol tampilkan.',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.black54),
                        ),
                        const SizedBox(height: 16),
                        Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              TextFormField(
                                controller: _namaCtl,
                                decoration: InputDecoration(
                                  labelText: 'Nama',
                                  prefixIcon: const Icon(Icons.badge),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                                validator: (v) {
                                  if (v == null || v.trim().isEmpty) {
                                    return 'Nama tidak boleh kosong';
                                  }
                                  if (v.trim().length < 3) {
                                    return 'Nama terlalu pendek';
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(height: 12),
                              TextFormField(
                                controller: _nimCtl,
                                decoration: InputDecoration(
                                  labelText: 'NIM',
                                  prefixIcon: const Icon(
                                    Icons.confirmation_number,
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                                validator: (v) {
                                  if (v == null || v.trim().isEmpty) {
                                    return 'NIM tidak boleh kosong';
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(height: 12),
                              TextFormField(
                                controller: _tahunCtl,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  labelText: 'Tahun Lahir',
                                  prefixIcon: const Icon(Icons.calendar_today),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                                validator: (v) {
                                  if (v == null || v.trim().isEmpty) {
                                    return 'Tahun lahir tidak boleh kosong';
                                  }
                                  final n = int.tryParse(v.trim());
                                  if (n == null) return 'Masukkan angka valid';
                                  if (n < 1900 || n > DateTime.now().year) {
                                    return 'Tahun lahir tidak valid';
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(height: 18),
                              SizedBox(
                                width: double.infinity,
                                child: ElevatedButton.icon(
                                  onPressed: _submit,
                                  icon: const Icon(Icons.send),
                                  label: const Padding(
                                    padding: EdgeInsets.symmetric(vertical: 12),
                                    child: Text(
                                      'Tampilkan Data',
                                      style: TextStyle(fontSize: 16),
                                    ),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 8),
                              OutlinedButton.icon(
                                onPressed: () {
                                  _formKey.currentState?.reset();
                                  _namaCtl.clear();
                                  _nimCtl.clear();
                                  _tahunCtl.clear();
                                },
                                icon: const Icon(Icons.refresh),
                                label: const Text('Reset'),
                                style: OutlinedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 18),
                  const Text(
                    'Catatan: Data akan diteruskan ke halaman tampilan dan ditampilkan secara rapi.',
                    style: TextStyle(color: Colors.white70),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
