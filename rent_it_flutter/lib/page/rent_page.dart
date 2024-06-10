import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:rent_it_flutter/widgets/appbar_widget.dart';
import 'package:rent_it_flutter/widgets/dropdown_rent_widget.dart';
import 'package:rent_it_flutter/widgets/top_widget.dart';
import 'package:rent_it_flutter/widgets/data_diri_widget.dart';
import 'package:rent_it_flutter/widgets/upload_document_widget.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';
import 'package:rent_it_flutter/models/facility.dart';
import 'package:rent_it_flutter/services/facility_service.dart';

class RentFacilityScreen extends StatefulWidget {
  const RentFacilityScreen({super.key});

  @override
  _RentFacilityScreenState createState() => _RentFacilityScreenState();
}

class _RentFacilityScreenState extends State<RentFacilityScreen> {
  final _formKey = GlobalKey<FormState>();
  Map<String, dynamic>? _userData;
  Facility? _selectedFacility;
  DateTime? _selectedDate;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _nimController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _noTelController = TextEditingController();
  List<DateTime> _unavailableDates = [];
  List<Facility> _facilities = [];

  @override
  void initState() {
    super.initState();
    _fetchUserData();
    _fetchFacilities();
  }

  Future<void> _fetchUserData() async {
    String? token = await _getToken();
    print("Token: $token"); // Debugging: Print token
    if (token != null) {
      final response = await http.get(
        Uri.parse('https://rent-it.site/api/auth/getData'),
        headers: {
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        setState(() {
          _userData = json.decode(response.body)['data']['user'];
        });
      } else {
        print('Failed to load user data');
      }
    }
  }

  Future<String?> _getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }

  Future<void> _fetchFacilities() async {
    FacilityService facilityService = FacilityService();
    try {
      List<Facility> facilities = await facilityService.fetchFacilities();
      setState(() {
        _facilities = facilities;
        _selectedFacility = facilities.isNotEmpty ? facilities[0] : null;
        if (_selectedFacility != null) {
          _fetchUnavailableDates(_selectedFacility!.id.toString());
        }
      });
    } catch (e) {
      print('Failed to load facilities: $e');
    }
  }

  Future<void> _fetchUnavailableDates(String facilityId) async {
    String? token = await _getToken();
    if (token != null) {
      try {
        final response = await http.get(
          Uri.parse(
              'https://rent-it.site/api/rent/unavailableDates?facility_id=$facilityId'),
          headers: {
            'Authorization': 'Bearer $token',
          },
        );

        if (response.statusCode == 200) {
          List<dynamic> dates = json.decode(response.body)['data'];
          setState(() {
            _unavailableDates =
                dates.map((date) => DateTime.parse(date)).toList();
            print(
                "Unavailable dates: $_unavailableDates"); // Debugging: Print unavailable dates
          });
        } else {
          print(
              'Failed to load unavailable dates: ${response.statusCode} - ${response.reasonPhrase}');
        }
      } catch (e) {
        print('Error occurred while fetching unavailable dates: $e');
      }
    } else {
      print('No token available');
    }
  }

  Future<void> _pickDate() async {
    if (_selectedFacility == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select a facility first')),
      );
      return;
    }

    await _fetchUnavailableDates(_selectedFacility!.id.toString());

    DateTime initialDate = DateTime.now();

    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );

    if (pickedDate != null) {
      if (_unavailableDates.contains(pickedDate)) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              content: Text('Fasilitas tidak tersedia pada tanggal tersebut')),
        );
      } else {
        setState(() {
          _selectedDate = pickedDate;
        });
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Silahkan pilih tanggal terlebih dahulu')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            const RShapeTopWidget(
              child: Column(
                children: <Widget>[RAppBar()],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 120.0), // Adjust the top padding as needed
              child: _userData == null || _facilities.isEmpty
                  ? const Center(child: CircularProgressIndicator())
                  : SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            children: <Widget>[
                              DropdownRentWidget(
                                facilities: _facilities,
                                selectedFacility: _selectedFacility!,
                                onChanged: (newFacility) async {
                                  setState(() {
                                    _selectedFacility = newFacility!;
                                    _selectedDate = null;
                                  });
                                  await _fetchUnavailableDates(
                                      newFacility!.id.toString());
                                },
                              ),
                              const SizedBox(height: 20),
                              GestureDetector(
                                onTap: _pickDate,
                                child: Container(
                                  width: screenWidth * 0.9,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16.0, vertical: 8.0),
                                  decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        _selectedDate == null
                                            ? 'Select Date'
                                            : DateFormat('dd/MM/yyyy')
                                                .format(_selectedDate!),
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 16.0,
                                        ),
                                      ),
                                      const Icon(
                                        Icons.calendar_today,
                                        color: Colors.white,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              DataDiriWidget(
                                nameController: _nameController,
                                nimController: _nimController,
                                emailController: _emailController,
                                noTelController: _noTelController,
                              ),
                              const SizedBox(height: 20),
                              UploadDocumentWidget(
                                formKey: _formKey,
                                selectedFacility: _selectedFacility,
                                selectedDate: _selectedDate,
                                nameController: _nameController,
                                nimController: _nimController,
                                emailController: _emailController,
                                noTelController: _noTelController,
                                userData: _userData,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
