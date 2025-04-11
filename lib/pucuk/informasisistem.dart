import 'package:flutter/material.dart';
import 'alatbidik.dart';

class InformasiSistemScreen extends StatefulWidget {
  const InformasiSistemScreen({super.key});

  @override
  State<InformasiSistemScreen> createState() => _InformasiSistemScreenState();
}

class _InformasiSistemScreenState extends State<InformasiSistemScreen> {
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    await Future.delayed(const Duration(seconds: 2)); 
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.green),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'INFORMASI SISTEM',
          style: TextStyle(
            color: Colors.green,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
          ),
        ),
        centerTitle: true,
      ),
      body: _isLoading
          ? const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(color: Colors.green),
                  SizedBox(height: 16),
                  Text(
                    'Mengambil data...',
                    style: TextStyle(color: Colors.green),
                  ),
                ],
              ),
            )
          : Column(
              children: [
                const SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildBox('ALAT BIDIK', Icons.center_focus_strong),
                    const SizedBox(width: 20),
                    _buildBox('KOMPAS', Icons.explore),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildBox('INCLINOMETER', Icons.straighten),
                    const SizedBox(width: 20),
                    _buildBox('METEOROLOGI', Icons.cloud),
                  ],
                ),
              ],
            ),
    );
  }

  Widget _buildBox(String label, IconData icon) {
    return GestureDetector(
      onTap: () {
        if (label == 'ALAT BIDIK') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AlatBidikScreen()),
          );
        }
       
      },
      child: Container(
        width: 140,
        height: 110,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.green, width: 2),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 36, color: Colors.green),
            const SizedBox(height: 8),
            Text(
              label,
              style: const TextStyle(color: Colors.green, fontSize: 14),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
