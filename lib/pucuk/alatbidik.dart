import 'package:flutter/material.dart';

class AlatBidikScreen extends StatelessWidget {
  const AlatBidikScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              
              IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.arrow_back, color: Colors.green),
              ),

              const SizedBox(height: 16),
              const Center(
                child: Text(
                  'PERANGKAT UTAMA ALAT BIDIK',
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),

              const SizedBox(height: 32),
              _buildRow('ROM', '66MB'),
              _buildRow('FREKUENSI', '180 MHz'),
              _buildRow('RAM', '16MB'),
              _buildRow('PROSESSOR', '32 bit Cortex®Arm®M4'),
              _buildRow('BATERAI', 'Li-ion 5000 mAh'),

              const Spacer(),
              Center(
                child: OutlinedButton.icon(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.arrow_back, color: Colors.green),
                  label: const Text('KEMBALI', style: TextStyle(color: Colors.green)),
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Colors.green),
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: const TextStyle(color: Colors.white)),
          Text(value, style: const TextStyle(color: Colors.green)),
        ],
      ),
    );
  }
}
