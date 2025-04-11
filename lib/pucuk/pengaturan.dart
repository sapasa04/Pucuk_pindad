import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'koneksisensor.dart';
import 'layar&suara.dart';
import 'informasisistem.dart';

class PengaturanScreen extends StatelessWidget {
  const PengaturanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text(
          'PENGATURAN',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.green[200],
        centerTitle: true,
      ),
      body: Stack(
        children: [
          // Menu Utama
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Wrap(
                  alignment: WrapAlignment.center,
                  spacing: 20,
                  runSpacing: 20,
                  children: [
                    _buildMenuBox(
                      icon: FontAwesomeIcons.globe,
                      label: 'KONEKSI & SENSOR',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const KoneksiSensorScreen(),
                          ),
                        );
                      },
                    ),
                    _buildMenuBox(
                      icon: FontAwesomeIcons.laptop,
                      label: 'PENGATURAN\nLAYAR & SUARA',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LayarDanSuaraScreen(),
                          ),
                        );
                      },
                    ),
                    _buildMenuBox(
                      icon: FontAwesomeIcons.infoCircle,
                      label: 'INFORMASI SISTEM',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const InformasiSistemScreen(),
                          ),
                        );
                      },
                    ),
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

  
  Widget _buildMenuBox({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 180,
        height: 150,
        decoration: BoxDecoration(
          color: Colors.grey[900],
          border: Border.all(color: Colors.green, width: 2),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 50, color: Colors.green),
            const SizedBox(height: 10),
            Text(
              label,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.green, fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}
