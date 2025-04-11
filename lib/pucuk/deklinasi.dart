import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DeklinasiScreen extends StatelessWidget {
  const DeklinasiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('DEKLINASI', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.green[200],
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildBox(FontAwesomeIcons.save, 'DEKLINASI TERSIMPAN'),
                _buildBox(FontAwesomeIcons.tools, 'ATUR DEKLINASI'),
              ],
            ),
            const Spacer(),
            Align(
              alignment: Alignment.bottomLeft,
              child: _buildBackButton(context),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBox(IconData icon, String label) {
    return Container(
      width: 170,
      height: 170,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.green, width: 2),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 50, color: Colors.green),
          const SizedBox(height: 15),
          Text(
            label,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.green,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBackButton(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        width: 110,
        height: 45,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.green, width: 2),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(FontAwesomeIcons.arrowLeft, color: Colors.green, size: 16),
            SizedBox(width: 8),
            Text(
              'KEMBALI',
              style: TextStyle(
                color: Colors.green,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
