import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:async';

class InfoKalibrasiScreen extends StatefulWidget {
  const InfoKalibrasiScreen({super.key});

  @override
  _InfoKalibrasiScreenState createState() => _InfoKalibrasiScreenState();
}

class _InfoKalibrasiScreenState extends State<InfoKalibrasiScreen> {
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Info Kalibrasi', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.green[200],
        centerTitle: true,
      ),
      body: Center(
        child: isLoading
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  CircularProgressIndicator(color: Colors.green),
                  SizedBox(height: 20),
                  Text(
                    'Mengirim perintah...',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ],
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text('INFO KALIBRASI', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
                  SizedBox(height: 10),
                  Text('LATITUDE', style: TextStyle(color: Colors.white, fontSize: 18)),
                  Text('-6.96097589', style: TextStyle(color: Colors.green, fontSize: 18, fontWeight: FontWeight.bold)),
                  SizedBox(height: 5),
                  Text('LONGITUDE', style: TextStyle(color: Colors.white, fontSize: 18)),
                  Text('107.62326050', style: TextStyle(color: Colors.green, fontSize: 18, fontWeight: FontWeight.bold)),
                  SizedBox(height: 5),
                  Text('ALTITUDE', style: TextStyle(color: Colors.white, fontSize: 18)),
                  Text('67.1999', style: TextStyle(color: Colors.green, fontSize: 18, fontWeight: FontWeight.bold)),
                  SizedBox(height: 5),
                  Text('WAKTU', style: TextStyle(color: Colors.white, fontSize: 18)),
                  Text('241002 FEB 2025', style: TextStyle(color: Colors.green, fontSize: 18, fontWeight: FontWeight.bold)),
                  SizedBox(height: 5),
                  Text('KEBERHASILAN', style: TextStyle(color: Colors.white, fontSize: 18)),
                  Text('100%', style: TextStyle(color: Colors.green, fontSize: 18, fontWeight: FontWeight.bold)),
                  SizedBox(height: 5),
                  Text('AKURASI', style: TextStyle(color: Colors.white, fontSize: 18)),
                  Text('+/-0.10', style: TextStyle(color: Colors.green, fontSize: 18, fontWeight: FontWeight.bold)),
                ],
              ),
      ),
    );
  }
}
