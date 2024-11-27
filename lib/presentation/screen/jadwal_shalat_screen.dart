import 'dart:convert';

import 'package:bitaqwa_app/presentation/widget/time.dart';
import 'package:bitaqwa_app/utils/color_constant.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:permission_handler/permission_handler.dart';

class JadwalShalatScreen extends StatefulWidget {
  const JadwalShalatScreen({super.key});

  @override
  State<JadwalShalatScreen> createState() => _JadwalShalatScreenState();
}

class _JadwalShalatScreenState extends State<JadwalShalatScreen> {
  // variable untuk menyimpan jadwal shalat
  List<dynamic>? _jadwalShalat;

  // variable untuk menyimpan data lokasi user
  String? _locationName;

  // variable untuk cek apakah datanya berhasil di inisialisasi
  bool _isLoading = true;

  Future<List<dynamic>> fetchJadwalShalat(
    String city,
    String month,
    String year,
  ) async {
    final url =
        "https://raw.githubusercontent.com/lakuapik/jadwalsholatorg/master/adzan/$city/$year/$month.json";

    final response = await http.get(Uri.parse(url));

    // cek jika berhasil get data jadwal shalat
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load Jadwal Shalat');
    }
  }

  Future<void> fetchLocationAndJadwalShalat() async {
    var status = await Permission.location.request();

    // kalau request lokasinya diizinkan oleh user
    if (status.isGranted) {
      try {
        // get posisi sekarang
        Position position = await Geolocator.getCurrentPosition();

        // get lotitude dan longitude
        List<Placemark> placemark = await placemarkFromCoordinates(
            position.latitude, position.longitude);
        Placemark place = placemark.first;

        // default location
        String city = "cirebon";
        String month = DateFormat("MM").format(DateTime.now());
        String year = DateFormat("yyyy").format(DateTime.now());

        List<dynamic> jadwalShalat = await fetchJadwalShalat(city, month, year);

        setState(() {
          _jadwalShalat = jadwalShalat;
          _locationName = "${place.administrativeArea}, ${place.locality}";
          _isLoading = false;
        });
      } catch (e) {
        setState(() {
          _isLoading = false;
        });
        print('Error fetching location or jadwal shalat : $e');
      }
    } else {
      print('location permission not granted');
    }
  }

  // init state berfungsi untuk menginisialisasi method/function ketika screen jadwal shalat pertama kali dibuka
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchLocationAndJadwalShalat();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConstant.colorPrimary,
        title: const Text(
          'Jadwal Shalat',
          style: TextStyle(
            fontFamily: 'PoppinsMedium',
            color: Colors.white,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.white,
          ),
        ),
      ),
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : _jadwalShalat == null
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Container(
                  color: Colors.blue[50],
                  height: double.infinity,
                  child: Stack(
                    children: [
                      Image.asset('assets/images/bg_header_jadwal_sholat.png'),
                      Column(
                        spacing: 12,
                        children: [
                          const SizedBox(
                            height: 42,
                          ),
                          Text(
                            DateFormat('EEEE, d MMM yyyy', 'id_ID')
                                .format(DateTime.now()),
                            style: const TextStyle(
                              fontFamily: 'PoppinsBold',
                              fontSize: 24,
                              color: Colors.white,
                            ),
                          ),
                          Row(
                            spacing: 8,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.location_on_rounded,
                                color: Colors.red[400],
                              ),
                              Text(
                                _locationName ?? '',
                                style: const TextStyle(
                                  fontFamily: 'PoppinsMedium',
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          Container(
                            margin: const EdgeInsets.only(
                                top: 50, left: 30, right: 30),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 32,
                              vertical: 24,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Column(
                              spacing: 16,
                              children: [
                                Time(
                                  pray: 'Shubuh',
                                  time: _jadwalShalat![0]['shubuh'] ?? '-',
                                  image: 'assets/images/img_clock.png',
                                ),
                                Container(
                                  color: const Color(0xffCBE5DD),
                                  height: 2,
                                ),
                                Time(
                                  pray: 'Dzuhur',
                                  time: _jadwalShalat![0]['dzuhur'] ?? '-',
                                  image: 'assets/images/img_clock.png',
                                ),
                                Container(
                                  color: const Color(0xffCBE5DD),
                                  height: 2,
                                ),
                                Time(
                                  pray: 'Ashar',
                                  time: _jadwalShalat![0]['ashr'] ?? '-',
                                  image: 'assets/images/img_clock.png',
                                ),
                                Container(
                                  color: const Color(0xffCBE5DD),
                                  height: 2,
                                ),
                                Time(
                                  pray: 'Maghrib',
                                  time: _jadwalShalat![0]['magrib'] ?? '-',
                                  image: 'assets/images/img_clock.png',
                                ),
                                Container(
                                  color: const Color(0xffCBE5DD),
                                  height: 2,
                                ),
                                Time(
                                  pray: 'Isya',
                                  time: _jadwalShalat![0]['isya'] ?? '-',
                                  image: 'assets/images/img_clock.png',
                                ),
                              ],
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
    );
  }
}
