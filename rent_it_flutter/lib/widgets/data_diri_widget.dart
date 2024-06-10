import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DataDiriWidget extends StatelessWidget {
  final TextEditingController namaController;
  final TextEditingController nimController;
  final TextEditingController emailController;
  final TextEditingController phoneNumberController;

  const DataDiriWidget({
    Key? key,
    required this.namaController,
    required this.nimController,
    required this.emailController,
    required this.phoneNumberController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              "Data Diri Peminjam",
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20.0),
            _buildTextInputField(
              label: 'Nama',
              controller: namaController,
            ),
            const SizedBox(height: 20.0),
            _buildTextInputField(
              label: 'NIM',
              controller: nimController,
              isNumericOnly: true,
            ),
            const SizedBox(height: 20.0),
            _buildEmailInputField(
              controller: emailController,
            ),
            const SizedBox(height: 20.0),
            _buildTextInputField(
              label: 'Nomor Telepon',
              controller: phoneNumberController,
              isNumericOnly: true,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextInputField({
    required String label,
    required TextEditingController controller,
    bool isNumericOnly = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
          ),
        ),
        const SizedBox(height: 5.0),
        TextFormField(
          controller: controller,
          inputFormatters:
              isNumericOnly ? [FilteringTextInputFormatter.digitsOnly] : [],
          keyboardType:
              isNumericOnly ? TextInputType.number : TextInputType.text,
          decoration: InputDecoration(
            hintText: 'Masukkan $label',
            border: const UnderlineInputBorder(),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return '$label harus diisi';
            }
            return null;
          },
        ),
      ],
    );
  }

  Widget _buildEmailInputField({
    required TextEditingController controller,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Email',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
          ),
        ),
        const SizedBox(height: 5.0),
        TextFormField(
          controller: controller,
          keyboardType: TextInputType.emailAddress,
          decoration: const InputDecoration(
            labelText: 'Masukkan Email',
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Email harus diisi';
            }
            bool isValidEmail =
                RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value);
            if (!isValidEmail) {
              return 'Email tidak valid';
            }
            return null;
          },
        ),
      ],
    );
  }
}
