import 'package:http/http.dart' as http;
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:rent_it_flutter/models/facility.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';

class UploadDocumentWidget extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  final Facility? selectedFacility;
  final DateTime? selectedDate;
  final TextEditingController nameController;
  final TextEditingController nimController;
  final TextEditingController emailController;
  final TextEditingController noTelController;
  final Map<String, dynamic>? userData;

  const UploadDocumentWidget({
    Key? key,
    required this.formKey,
    this.selectedFacility,
    this.selectedDate,
    required this.nameController,
    required this.nimController,
    required this.emailController,
    required this.noTelController,
    this.userData,
  }) : super(key: key);

  @override
  _UploadDocumentWidgetState createState() => _UploadDocumentWidgetState();
}

class _UploadDocumentWidgetState extends State<UploadDocumentWidget> {
  PlatformFile? _pickedFile;

  Future<String?> _getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
      child: Container(
        padding: const EdgeInsets.all(20.0),
        width: screenWidth * 0.9,
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
            const SizedBox(height: 20.0),
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
                ElevatedButton(
                  onPressed: () {
                    if (_pickedFile != null) {
                      _submitForm();
                    } else {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text('Peringatan'),
                            content: const Text('Anda belum memilih file.'),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text('OK'),
                              ),
                            ],
                          );
                        },
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    elevation: 4.0,
                    shadowColor: Colors.black.withOpacity(0.4),
                  ),
                  child: const Text(
                    'Ajukan Permintaan',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFileUploadArea() {
    return Container(
      width: double.infinity,
      height: 100.0,
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
            _pickedFile != null
                ? Text(_pickedFile!.path!.split('/').last)
                : const Text('Tidak ada file yang dipilih'),
          ],
        ),
      ),
    );
  }

  Future<void> _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (result != null) {
      setState(() {
        _pickedFile = result.files.first;
      });
    }
  }

  Future<void> _submitForm() async {
    if (widget.formKey.currentState!.validate() &&
        widget.selectedDate != null &&
        _pickedFile != null) {
      String? token = await _getToken();
      if (token != null) {
        final request = http.MultipartRequest(
          'POST',
          Uri.parse('http://10.0.2.2:8000/api/rent/store'),
        );

        request.headers['Authorization'] = 'Bearer $token';
        request.fields['facility_id'] = widget.selectedFacility!.id.toString();
        request.fields['user_id'] = widget.userData!['id'].toString();
        request.fields['tanggalSewa'] =
            DateFormat('yyyy-MM-dd').format(widget.selectedDate!);
        request.fields['nama'] = widget.nameController.text;
        request.fields['nim'] = widget.nimController.text;
        request.fields['email'] = widget.emailController.text;
        request.fields['noTel'] = widget.noTelController.text;

        request.files.add(await http.MultipartFile.fromPath(
          'inputFile',
          _pickedFile!.path!,
        ));

        final response = await request.send();

        if (response.statusCode == 201) {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Berhasil mengajukan pesanan')));
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Gagal mengajukan pesanan')));
        }
      }
    }
  }
}
