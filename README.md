<h1>Nama: Wildan Munawwar Habib<br>
NIM: H1D023045</h1>

Penjelasan proses passing data dari form menuju tampilan

1. Model data
   - Di `lib/ui/form_data.dart` dibuat kelas model sederhana `PersonData`:
     - Attributes: `nama` (String), `nim` (String), `tahunLahir` (int)
     - Kelas ini merepresentasikan data yang dimasukkan pengguna.

2. Pengisian dan validasi form
   - Halaman form (`FormDataPage`) menggunakan `Form` dengan beberapa `TextFormField`.
   - Saat tombol "Tampilkan Data" ditekan, form divalidasi.
   - Jika valid, dibuat instance `PersonData`:
     ```
     final data = PersonData(
       nama: _namaCtl.text.trim(),
       nim: _nimCtl.text.trim(),
       tahunLahir: int.parse(_tahunCtl.text.trim()),
     );
     ```

3. Passing data ke halaman tampilan
   - Data diteruskan ke halaman hasil (`TampilDataPage`) dengan mekanisme Navigator dan konstruktor:
     ```
     Navigator.of(context).push(
       MaterialPageRoute(
         builder: (context) => TampilDataPage(data: data),
       ),
     );
     ```
   - Di `TampilDataPage`, konstruktor menerima `PersonData data` dan menampilkannya di UI.

Ringkasan alur
   - Pengguna mengisi form -> dibuat instance `PersonData` -> Navigator push ke halaman hasil dengan `data` sebagai parameter -> halaman hasil membaca `data` dari konstruktor dan menampilkan.

<h1>Screenshot</h1>
<img width="440" height="1010" alt="image" src="https://github.com/user-attachments/assets/1091c370-5aa2-4f28-87b6-f7eec869cb05" />
<img width="440" height="1014" alt="image" src="https://github.com/user-attachments/assets/a16e75d3-7d5d-48e4-a18b-f143542b5c32" />

