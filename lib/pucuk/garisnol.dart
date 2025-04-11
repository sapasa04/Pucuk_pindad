import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class GarisNolScreen extends StatelessWidget {
  const GarisNolScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('GARIS NOL', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        automaticallyImplyLeading: false, 
        backgroundColor: Colors.green[200],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                _MenuBox(
                  icon: FontAwesomeIcons.projectDiagram,
                  label: 'AZIMUT',
                ),
                _MenuBox(
                  icon: FontAwesomeIcons.tachometerAlt,
                  label: 'ELEVASI',
                ),
                _MenuBox(
                  icon: FontAwesomeIcons.compassDrafting,
                  label: 'ROLL',
                ),
              ],
            ),
            const Spacer(),
            Align(
              alignment: Alignment.bottomLeft,
              child: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Container(
                  width: 140,
                  height: 50,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.green, width: 2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.arrow_back, color: Colors.green),
                      SizedBox(width: 8),
                      Text(
                        'KEMBALI',
                        style: TextStyle(color: Colors.green, fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _MenuBox extends StatelessWidget {
  final IconData icon;
  final String label;

  const _MenuBox({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130,
      height: 130,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.green, width: 2.5),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 50, color: Colors.green),
          const SizedBox(height: 12),
          Text(
            label,
            style: const TextStyle(
              color: Colors.green,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
