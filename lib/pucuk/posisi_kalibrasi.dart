import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'posisi_screen.dart';
import 'deklinasi.dart';

class PosisiKalibrasi extends StatelessWidget {
  const PosisiKalibrasi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Posisi & Kalibrasi', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.green[200],
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildBox(context, FontAwesomeIcons.mapMarkerAlt, 'Posisi', const PosisiScreen()),
                _buildBox(context, FontAwesomeIcons.tools, 'Kalibrasi', const KalibrasiScreen()),
                _buildBox(context, FontAwesomeIcons.compass, 'Deklinasi', const DeklinasiScreen()),
              ],
            ),
            const Spacer(),
            _buildBackButton(context),
          ],
        ),
      ),
    );
  }

  Widget _buildBox(BuildContext context, IconData icon, String label, Widget? page) {
    return GestureDetector(
      onTap: () {
        if (page != null) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => page),
          );
        }
      },
      child: Container(
        width: 170,
        height: 170,
        decoration: BoxDecoration(
          color: Colors.green.withOpacity(0.3),
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.green, width: 2),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 60, color: Colors.green),
            const SizedBox(height: 15),
            Text(
              label,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBackButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20, left: 0),
      child: Align(
        alignment: Alignment.bottomLeft,
        child: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          borderRadius: BorderRadius.circular(12),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 12),
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.green),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Icon(Icons.arrow_back, color: Colors.green, size: 20),
                SizedBox(width: 10),
                Text(
                  'KEMBALI',
                  style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.normal,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class KalibrasiScreen extends StatelessWidget {
  const KalibrasiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Kalibrasi', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.green[200],
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildBox(FontAwesomeIcons.cogs, 'Kalibrasi'),
                  _buildBox(FontAwesomeIcons.infoCircle, 'Info Kalibrasi'),
                ],
              ),
            ),
          ),
          _buildBackButton(context),
        ],
      ),
    );
  }

  Widget _buildBox(IconData icon, String label) {
    return Container(
      width: 150,
      height: 150,
      decoration: BoxDecoration(
        color: Colors.green.withOpacity(0.3),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.green, width: 2),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 60, color: Colors.green),
          const SizedBox(height: 15),
          Text(
            label,
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget _buildBackButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20, left: 0),
      child: Align(
        alignment: Alignment.bottomLeft,
        child: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          borderRadius: BorderRadius.circular(12),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 12),
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.green),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Icon(Icons.arrow_back, color: Colors.green, size: 20),
                SizedBox(width: 10),
                Text(
                  'KEMBALI',
                  style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.normal,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
