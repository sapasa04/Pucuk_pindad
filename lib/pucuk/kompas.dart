import 'package:flutter/material.dart';

class KompasScreen extends StatefulWidget {
  const KompasScreen({super.key});

  @override
  State<KompasScreen> createState() => _KompasScreenState();
}

class _KompasScreenState extends State<KompasScreen> {
  String _selectedMenu = 'UTAMA';
  bool _isCheckingVersion = false;
  String _buildVersion = '-';
  String _appVersion = '-';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          const SizedBox(height: 20),
          _buildTopMenu(),
          const SizedBox(height: 20),
          _buildHeader(),
          const SizedBox(height: 30),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: _buildContent(),
            ),
          ),
          if (_selectedMenu == 'VERSI')
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  
                  ElevatedButton.icon(
                    onPressed: () => Navigator.pop(context),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      side: const BorderSide(color: Colors.green, width: 2),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                    ),
                    icon: const Icon(Icons.arrow_back, color: Colors.green),
                    label: const Text('KEMBALI', style: TextStyle(color: Colors.green, fontSize: 16)),
                  ),
                  
                  ElevatedButton.icon(
                    onPressed: _checkVersion,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      side: const BorderSide(color: Colors.green, width: 2),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                    ),
                    icon: const Icon(Icons.update, color: Colors.green),
                    label: const Text('PERIKSA VERSI', style: TextStyle(color: Colors.green, fontSize: 16)),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildTopMenu() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildMenuItem(Icons.menu, 'UTAMA'),
        _buildMenuItem(Icons.sensors, 'SENSOR'),
        _buildMenuItem(Icons.hub, 'KONEKSI'),
        _buildMenuItem(Icons.settings, 'VERSI'),
      ],
    );
  }

  Widget _buildMenuItem(IconData icon, String label) {
    final isSelected = _selectedMenu == label;
    return GestureDetector(
      onTap: () => setState(() => _selectedMenu = label),
      child: Column(
        children: [
          Icon(icon, color: Colors.white),
          const SizedBox(height: 4),
          Text(label, style: const TextStyle(color: Colors.white, fontSize: 12)),
          const SizedBox(height: 4),
          Container(width: 40, height: 2, color: isSelected ? Colors.green : Colors.transparent),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    switch (_selectedMenu) {
      case 'SENSOR':
        return Column(
          children: const [
            Text('SENSOR KOMPAS', style: TextStyle(color: Colors.green, fontSize: 20, fontWeight: FontWeight.bold, letterSpacing: 1.2)),
            SizedBox(height: 8),
            Text('RENTANG PENGUKURAN', style: TextStyle(color: Colors.white, fontSize: 16)),
            SizedBox(height: 4),
            Text('0° s/d 360°', style: TextStyle(color: Colors.green, fontSize: 18, fontWeight: FontWeight.bold)),
          ],
        );
      case 'KONEKSI':
        return Column(
          children: const [
            Text('KONEKSI KOMPAS', style: TextStyle(color: Colors.green, fontSize: 20, fontWeight: FontWeight.bold, letterSpacing: 1.2)),
            SizedBox(height: 8),
            Text('RADIO ISM', style: TextStyle(color: Colors.white, fontSize: 16)),
            SizedBox(height: 4),
            Text('Tipe Koneksi: Nirkabel', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text('Frekuensi: 2.4 GHz', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
          ],
        );
      case 'VERSI':
        return Column(
          children: [
            const Text('VERSI KOMPAS', style: TextStyle(color: Colors.green, fontSize: 20, fontWeight: FontWeight.bold, letterSpacing: 1.2)),
            const SizedBox(height: 8),
            if (_isCheckingVersion)
              const CircularProgressIndicator(color: Colors.green)
            else
              _buildVersionInfo(),
            const SizedBox(height: 8),
          ],
        );
      default:
        return const Text('PERANGKAT UTAMA KOMPAS', style: TextStyle(color: Colors.green, fontSize: 20, fontWeight: FontWeight.bold, letterSpacing: 1.2));
    }
  }

  Widget _buildContent() {
    switch (_selectedMenu) {
      case 'SENSOR':
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text('JENIS SENSOR', style: TextStyle(color: Colors.white, fontSize: 16)),
                  SizedBox(height: 8),
                  Text('Kompas Digital Magnetic', style: TextStyle(color: Colors.green, fontSize: 16, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: const [
                  Text('AKURASI', style: TextStyle(color: Colors.white, fontSize: 16)),
                  SizedBox(height: 8),
                  Text('0.6°', style: TextStyle(color: Colors.green, fontSize: 16, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          ],
        );
      case 'KONEKSI':
        return const SizedBox.shrink();
      case 'VERSI':
        return const SizedBox.shrink();
      default:
        return Column(
          children: [
            _buildInfoRow('ROM', '66MB', 'RAM', '16MB', 'FREKUENSI', '180 MHz'),
            const SizedBox(height: 30),
            _buildInfoRow('PROSESSOR', 'Arm®32 bit Cortex®M4', 'BATERAI', 'Li-ion 5000 mAh', '', ''),
          ],
        );
    }
  }

  Widget _buildVersionInfo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            const Text('BUILD', style: TextStyle(color: Colors.white, fontSize: 16)),
            const SizedBox(width: 10),
            Text(_buildVersion, style: const TextStyle(color: Colors.white, fontSize: 16)),
          ],
        ),
        Row(
          children: [
            const Text('VERSI', style: TextStyle(color: Colors.white, fontSize: 16)),
            const SizedBox(width: 10),
            Text(_appVersion, style: const TextStyle(color: Colors.white, fontSize: 16)),
          ],
        ),
      ],
    );
  }

  void _checkVersion() async {
    setState(() => _isCheckingVersion = true);
    await Future.delayed(const Duration(seconds: 2));
    setState(() {
      _isCheckingVersion = false;
      _appVersion = '24.04.05'; 
      _buildVersion = '2024.04.05/08:45:58'; 
      print("Versi dan Build telah diperbarui!"); 
    });
  }

  Widget _buildInfoRow(String label1, String value1, String label2, String value2, String label3, String value3) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildInfoBox(label1, value1),
        _buildInfoBox(label2, value2),
        if (label3.isNotEmpty) _buildInfoBox(label3, value3),
      ],
    );
  }

  Widget _buildInfoBox(String label, String value) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(label, style: const TextStyle(color: Colors.white, fontSize: 16)),
          const SizedBox(height: 8),
          Text(value, style: const TextStyle(color: Colors.green, fontSize: 16, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
