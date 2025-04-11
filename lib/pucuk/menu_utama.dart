import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mortir_pindad/pucuk/infotembak.dart';
import 'posisi_kalibrasi.dart';
import 'garisnol.dart';
import 'amunisi.dart';
import 'infosensor.dart';
import 'infotembak.dart';
import 'pengaturan.dart';



class MenuUtama extends StatelessWidget {
  const MenuUtama({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('MENU UTAMA', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.green[200],
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 80),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildMenuItem(FontAwesomeIcons.mapMarkerAlt, 'POSISI & KALIBRASI', context, const PosisiKalibrasi()),
                    _buildMenuItem(FontAwesomeIcons.locationArrow, 'GARIS NOL', context, const GarisNolScreen()),
                    _buildMenuItem(FontAwesomeIcons.bomb, 'AMUNISI', context, const AmunisiScreen()),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildMenuItem(FontAwesomeIcons.crosshairs, 'INFO TEMBAKAN', context, const InfoTembakScreen()),

                    _buildMenuItem(FontAwesomeIcons.wifi, 'INFO SENSOR', context, const InfoSensorScreen()),
                    _buildMenuItem(FontAwesomeIcons.cogs, 'PENGATURAN', context, const PengaturanScreen()),

                  ],
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildStatusIndicator(FontAwesomeIcons.bomb, '03/02/02', Colors.red),
                    _buildStatusIndicator(FontAwesomeIcons.users, '01-01', Colors.green),
                    _buildStatusIndicator(FontAwesomeIcons.satellite, 'GPS: AKTIF', Colors.yellow),
                    _buildStatusIndicator(FontAwesomeIcons.volumeUp, 'SUARA: AKTIF', Colors.green),
                    _buildStatusIndicator(FontAwesomeIcons.circle, 'PUSTURBAK', Colors.green),
                  ],
                ),
              ],
            ),
          ),
          
          Positioned(
            bottom: 20,
            left: 20,
            child: OutlinedButton.icon(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back, color: Colors.green),
              label: const Text(
                'KEMBALI',
                style: TextStyle(color: Colors.green),
              ),
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: Colors.green),
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem(IconData icon, String label, BuildContext context, Widget? targetPage) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(14),
      width: 150,
      height: 150,
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.green, width: 2),
      ),
      child: GestureDetector(
        onTap: () {
          if (targetPage != null) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => targetPage),
            );
          }
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 50, color: Colors.green),
            const SizedBox(height: 10),
            Text(
              label,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.green, fontSize: 14, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatusIndicator(IconData icon, String text, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          Icon(icon, size: 20, color: color),
          const SizedBox(width: 5),
          Text(
            text,
            style: TextStyle(color: color, fontSize: 14, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
