import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'zonawaktu.dart';

class PosisiScreen extends StatefulWidget {
  const PosisiScreen({super.key});

  @override
  State<PosisiScreen> createState() => _PosisiScreenState();
}

class _PosisiScreenState extends State<PosisiScreen> {
  bool _showAturModeGps = false;
  bool _showModeControl = false;
  bool _isAktif = true;
  bool _showSuccessMessage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: _showModeControl
            ? _buildModeControlView()
            : _showAturModeGps
                ? _buildAturModeGpsView()
                : _buildDefaultView(),
      ),
    );
  }

  Widget _buildDefaultView() {
    return Column(
      children: [
        const SizedBox(height: 20),
        const Text(
          'POSISI',
          style: TextStyle(color: Colors.green, fontSize: 24, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 30),
        Row(
          children: [
            Expanded(child: _buildDataColumn('LATITUDE', '\n-6.95102240')),
            Expanded(child: _buildDataColumn('LONGITUDE', '\n107.62336405')),
            Expanded(child: _buildDataColumn('ALTITUDE', '\n709.4034')),
          ],
        ),
        const SizedBox(height: 30),
        Row(
          children: [
            Expanded(child: _buildDataColumn('SATELIT', '\n15')),
            Expanded(child: _buildDataColumn('QoS', '\nSedang')),
            Expanded(child: _buildDataColumn('WAKTU', '\n241002 FEB 2025')),
          ],
        ),
        const Spacer(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildButton(FontAwesomeIcons.arrowLeft, 'KEMBALI', () {
              Navigator.pop(context);
            }),
            _buildButton(FontAwesomeIcons.globe, 'ZONA WAKTU', () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ZonaWaktuScreen()),
              );
            }),
            _buildButton(FontAwesomeIcons.cogs, 'ATUR MODE GPS', () {
              setState(() {
                _showAturModeGps = true;
              });
            }),
          ],
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  Widget _buildAturModeGpsView() {
    return Column(
      children: [
        const SizedBox(height: 40),
        const Text(
          'ZONA WAKTU',
          style: TextStyle(color: Colors.green, fontSize: 26, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        const Spacer(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(FontAwesomeIcons.wifi, color: Colors.green, size: 50),
            SizedBox(width: 20),
            Text(
              'AKTIF',
              style: TextStyle(color: Colors.green, fontSize: 36, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        const Spacer(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildButton(FontAwesomeIcons.arrowLeft, 'KEMBALI', () {
              setState(() {
                _showAturModeGps = false;
              });
            }),
            _buildButton(FontAwesomeIcons.cogs, 'ATUR MODE GPS', () {
              setState(() {
                _showModeControl = true;
              });
            }),
          ],
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  Widget _buildModeControlView() {
    return Column(
      children: [
        const SizedBox(height: 40),
        const Text(
          'ZONA WAKTU',
          style: TextStyle(color: Colors.green, fontSize: 26, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        const Spacer(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (!_isAktif)
              _arrowButton(
                icon: FontAwesomeIcons.lessThan,
                onTap: () {
                  setState(() {
                    _isAktif = true;
                    _showSuccessMessage = false;
                  });
                },
              ),
            const SizedBox(width: 20),
            Row(
              children: [
                Icon(
                  _isAktif ? FontAwesomeIcons.wifi : FontAwesomeIcons.lock,
                  color: Colors.green,
                  size: 60,
                ),
                const SizedBox(width: 20),
                Text(
                  _isAktif ? 'AKTIF' : 'KUNCI',
                  style: const TextStyle(
                    color: Colors.green,
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(width: 20),
            if (_isAktif)
              _arrowButton(
                icon: FontAwesomeIcons.greaterThan,
                onTap: () {
                  setState(() {
                    _isAktif = false;
                    _showSuccessMessage = false;
                  });
                },
              ),
          ],
        ),
        const Spacer(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildButton(FontAwesomeIcons.arrowLeft, 'KEMBALI', () {
              setState(() {
                _showModeControl = false;
                _showSuccessMessage = false;
              });
            }),
            if (_showSuccessMessage)
              Column(
                children: const [
                  Icon(FontAwesomeIcons.checkCircle, color: Colors.green, size: 24),
                  SizedBox(height: 4),
                  Text(
                    'Berhasil Disimpan',
                    style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
                  ),
                ],
              )
            else
              const SizedBox(width: 100), 
            _buildButton(FontAwesomeIcons.save, 'SIMPAN WAKTU', () {
              setState(() {
                _showSuccessMessage = true;
              });
              Future.delayed(const Duration(seconds: 2), () {
                if (mounted) {
                  setState(() {
                    _showSuccessMessage = false;
                  });
                }
              });
            }),
          ],
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  Widget _buildDataColumn(String title, String value) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title,
          style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 5),
        Text(
          value,
          style: const TextStyle(color: Colors.green, fontSize: 18, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildButton(IconData icon, String label, VoidCallback onPressed) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.green, width: 2),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 20, color: Colors.green),
            const SizedBox(width: 10),
            Text(label, style: const TextStyle(color: Colors.green, fontSize: 16, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }

  Widget _arrowButton({required IconData icon, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.green, width: 2),
        ),
        child: Icon(icon, color: Colors.green, size: 24),
      ),
    );
  }
}
