import 'package:flutter/material.dart';
import 'package:rent_it_flutter/widgets/box_decorations.dart';

class DropdownRentWidget extends StatelessWidget {
  final String selectedValue;
  final String description;
  final ValueChanged<String?> onChanged;

  const DropdownRentWidget({
    super.key,
    required this.selectedValue,
    required this.description,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    // Subjudul sesuai dengan nilai dropdown yang dipilih
    String subTitle = _getSubTitle(selectedValue);
    // Nominal sesuai dengan nilai dropdown yang dipilih
    String nominal = _getNominal(selectedValue);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
          child: Container(
            width: double.infinity,
            height: 50, // Sesuaikan tinggi dengan kebutuhan
            decoration: redRoundedDropdownDecoration, // Menggunakan dekorasi yang telah dideklarasikan
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: selectedValue,
                  isExpanded: true,
                  icon: const Icon(Icons.arrow_drop_down, color: Colors.white), // Teks putih
                  iconSize: 24,
                  elevation: 16,
                  style: const TextStyle(color: Colors.white, fontSize: 16.0), // Teks putih dengan fontsize 16
                  dropdownColor: Colors.red, // Warna merah untuk latar belakang item dropdown list
                  onChanged: onChanged,
                  items: <String>[
                    'Gedung Serbaguna', 
                    'Lapangan Tennis', 
                    'Lapangan Bulutangkis', 
                    'TULT'
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: TextStyle(
                          fontSize: 16.0, // Samakan fontsize dengan deskripsi
                          fontWeight: selectedValue == value ? FontWeight.bold : FontWeight.normal, // Teks yang dipilih menjadi tebal
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
          child: Container(
            padding: const EdgeInsets.all(20.0),
            decoration: getImageRoundedWithShadowDecoration(selectedValue), // Menggunakan dekorasi gambar yang sesuai dengan nilai dropdown
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
Padding(
  padding: const EdgeInsets.only(),
  child: Row(
    children: [
    Expanded(
        child: Container(
          padding: const EdgeInsets.only(), // Padding di dalam kontainer
          alignment: Alignment.centerRight,
          child: Text(
            'Rp$nominal', // Menampilkan nominal
            textAlign: TextAlign.right, // Menempatkan teks ke kanan
            style: const TextStyle(fontSize: 23.0, color: Colors.white, fontWeight: FontWeight.bold), // Warna putih, tebal, dan fontsize 16
          ),
        ),
      ),
    ],
  ),
),

                const SizedBox(
                  height: 120.0,
                ),
                Text(  
                  subTitle, // Menampilkan subjudul
                  style: const TextStyle(fontSize: 20.0, color: Colors.white, fontWeight: FontWeight.bold), // Warna putih, tebal, dan fontsize 20
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 70.0), // Padding hanya sebelah kanan
                  child: Text(
                    description,
                    textAlign: TextAlign.justify, // Teks diratakan kiri dan kanan
                    style: const TextStyle(fontSize: 12.0, color: Colors.white, fontWeight: FontWeight.normal), // Warna putih, fontsize lebih kecil, dan tidak tebal
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  // Fungsi untuk mendapatkan subjudul sesuai dengan nilai dropdown yang dipilih
  String _getSubTitle(String selectedValue) {
    switch (selectedValue) {
      case 'Gedung Serbaguna':
        return 'Gedung Serbaguna';
      case 'Lapangan Tennis':
        return 'Lapangan Tennis';
      case 'Lapangan Bulutangkis':
        return 'Lapangan Bulutangkis';
      case 'TULT':
        return 'TULT';
      default:
        return 'Default';
    }
  }

  // Fungsi untuk mendapatkan nominal sesuai dengan nilai dropdown yang dipilih
  String _getNominal(String selectedValue) {
    switch (selectedValue) {
      case 'Gedung Serbaguna':
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
