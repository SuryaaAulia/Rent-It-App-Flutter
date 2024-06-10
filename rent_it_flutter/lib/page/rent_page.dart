import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rent_it_flutter/widgets/appbar_widget.dart';
import 'package:rent_it_flutter/widgets/data_diri_widget.dart';
import 'package:rent_it_flutter/widgets/dropdown_rent_widget.dart';
import 'package:rent_it_flutter/widgets/loading_screen.dart';
import 'package:rent_it_flutter/widgets/top_widget.dart';

/// RentPage Class
/// Kelas ini membangun halaman untuk melakukan proses peminjaman.
class RentPage extends StatefulWidget {
  const RentPage({super.key});

  @override
  _RentPageState createState() => _RentPageState();
}

/// _RentPageState Class
/// Kelas state ini berisi logika untuk membangun UI dan mengelola state pada halaman peminjaman.
class _RentPageState extends State<RentPage> {
  String _selectedValue = 'Gedung Serbaguna'; // Nilai default untuk dropdown
  final String _description =
      'Lorem ipsumLorem ipsumLorem ipsumLorem ipsumLorem Lorem ipsumLorem ipsum Lorem ipsumLorem ipsum  ipsumLorem ipsumLorem ipsumLorem ipsum'; // Deskripsi default

  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _nimController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();

  File? _selectedFile; // File yang dipilih
  bool _isProcessing = false; // Status proses

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.grey[400],
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const RShapeTopWidget(
              child: Column(
                children: <Widget>[RAppBar()],
              ),
            ),
            DropdownRentWidget(
              selectedValue: _selectedValue,
              description: _description,
              onChanged: (newValue) {
                setState(() {
                  _selectedValue = newValue!;
                });
              },
            ),
            DataDiriWidget(
              namaController: _namaController,
              nimController: _nimController,
              emailController: _emailController,
              phoneNumberController: _phoneNumberController,
            ),
            _buildUploadDocumentWidget(),
          ],
        ),
      ),
    ));
  }

  /// _buildUploadDocumentWidget Function
  /// Fungsi ini membangun bagian UI yang berhubungan dengan upload dokumen pendukung.
  Widget _buildUploadDocumentWidget() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
      child: Container(
        padding: const EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.4),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              "Upload Dokumen Pendukung",
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5.0),
            _buildFileUploadArea(),
            const SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: _pickFile,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    elevation: 4.0,
                    shadowColor: Colors.black.withOpacity(0.4),
                  ),
                  child: const Text(
                    'Pilih File',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(height: 20.0),
                ElevatedButton(
                  onPressed: _isProcessing ? null : _handleSubmitRequest,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    elevation: 4.0,
                    shadowColor: Colors.black.withOpacity(0.4),
                  ),
                  child: Text(
                    _isProcessing ? 'Sedang Memproses...' : 'Ajukan Permintaan',
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  /// _buildFileUploadArea Function
  /// Fungsi ini membangun area UI yang menampilkan informasi tentang file yang telah diupload.
  Widget _buildFileUploadArea() {
    return Container(
      width: double.infinity,
      height: 200.0,
      margin: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        border: Border.all(color: Colors.grey),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'File yang telah diupload:',
              style: TextStyle(fontSize: 18.0),
            ),
            const SizedBox(height: 10.0),
            _selectedFile != null
                ? Text(_selectedFile!.path.split('/').last)
                : const Text('Tidak ada file yang dipilih'),
          ],
        ),
      ),
    );
  }

  /// _pickFile Function
  /// Fungsi ini dipanggil ketika tombol "Pilih File" ditekan, digunakan untuk memilih file dari galeri.
  void _pickFile() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
    );
    setState(() {
      if (pickedFile != null) {
        _selectedFile = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  /// _handleSubmitRequest Function
  /// Fungsi ini dipanggil ketika tombol "Ajukan Permintaan" ditekan, digunakan untuk memvalidasi input dan memulai proses permintaan.
  void _handleSubmitRequest() {
    if (_validateInputs()) {
      setState(() {
        _isProcessing = true;
      });

      // Simulasi proses pemrosesan selama 5 detik
      Future.delayed(const Duration(seconds: 2), () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => LoadingScreen(
              nama: _namaController.text,
              nim: _nimController.text,
              email: _emailController.text,
              phoneNumber: _phoneNumberController.text,
              tempatDipilih: _selectedValue,
              hargaTempat: _getNominal(_selectedValue),
            ),
          ),
        );
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Permintaan sedang diproses.'),
        ),
      );
    }
  }

  /// _validateInputs Function
  /// Fungsi ini digunakan untuk memvalidasi input yang dimasukkan oleh pengguna sebelum proses permintaan dimulai.
  bool _validateInputs() {
    if (_namaController.text.isEmpty ||
        _nimController.text.isEmpty ||
        _emailController.text.isEmpty ||
        _phoneNumberController.text.isEmpty ||
        _selectedFile == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Mohon lengkapi semua input dan pilih file.'),
        ),
      );
      return false;
    }

    // Validasi email menggunakan RegExp
    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
        .hasMatch(_emailController.text)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Format email tidak valid.'),
        ),
      );
      return false;
    }

    return true;
  }

  /// _getNominal Function
  /// Fungsi ini digunakan untuk mendapatkan nominal harga berdasarkan tempat yang dipilih.
  String _getNominal(String selectedValue) {
    switch (selectedValue) {
      case 'GSG':
        return '50.000';
      case 'Lapangan Tennis':
        return '100.000';
      case 'Lapangan Bulutangkis':
        return '70.000';
      case 'TULT':
        return '350.000';
      default:
        return '0';
    }
  }
}
