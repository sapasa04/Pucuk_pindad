import 'package:flutter/material.dart';

class LayarDanSuaraScreen extends StatefulWidget {
  const LayarDanSuaraScreen({super.key});

  @override
  State<LayarDanSuaraScreen> createState() => _LayarDanSuaraScreenState();
}

class _LayarDanSuaraScreenState extends State<LayarDanSuaraScreen> {
  double _brightness = 100;
  bool _autoOff = false;
  bool _notification = true;
  bool _isSaving = false;
  bool _saved = false;

  Future<void> _saveSettings() async {
    setState(() {
      _isSaving = true;
      _saved = false;
    });

    await Future.delayed(const Duration(seconds: 2));

    setState(() {
      _isSaving = false;
      _saved = true;
    });

   
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const SizedBox(height: 20),
            const Text(
              "LAYAR DAN SUARA",
              style: TextStyle(
                color: Colors.green,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 30),

            // Slider
            SizedBox(
              width: 250,
              child: Slider(
                value: _brightness,
                min: 0,
                max: 100,
                activeColor: Colors.green,
                onChanged: (value) {
                  setState(() {
                    _brightness = value;
                  });
                },
              ),
            ),
            Text(
              "Tingkat Kecerahan : ${_brightness.toInt()} %",
              style: const TextStyle(color: Colors.white, fontSize: 18),
            ),
            const SizedBox(height: 40),

            
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildToggleBox(
                  icon: Icons.brightness_2,
                  label: "Otomatis Layar Mati",
                  status: _autoOff ? "Aktif" : "Non-Aktif",
                  isActive: _autoOff,
                  activeColor: Colors.yellow,
                  inactiveColor: Colors.green,
                  onTap: () {
                    setState(() {
                      _autoOff = !_autoOff;
                    });
                  },
                ),
                _buildToggleBox(
                  icon: Icons.volume_up,
                  label: "Pemberitahuan",
                  status: _notification ? "Aktif" : "Non-Aktif",
                  isActive: _notification,
                  activeColor: Colors.green,
                  inactiveColor: Colors.red,
                  onTap: () {
                    setState(() {
                      _notification = !_notification;
                    });
                  },
                ),
              ],
            ),
            const Spacer(),

            
            if (_isSaving)
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  CircularProgressIndicator(color: Colors.green),
                  SizedBox(width: 12),
                  Text(
                    "Proses Menyimpan",
                    style: TextStyle(color: Colors.green, fontSize: 16),
                  ),
                ],
              )
            else if (_saved)
              const Center(
                child: Text(
                  "✅ Berhasil Disimpan",
                  style: TextStyle(color: Colors.green, fontSize: 18),
                ),
              )
            else
              const SizedBox(height: 24),

            const SizedBox(height: 20),

            
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                OutlinedButton.icon(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.arrow_back, color: Colors.green),
                  label: const Text(
                    "KEMBALI",
                    style: TextStyle(color: Colors.green),
                  ),
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Colors.green),
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  ),
                ),
                OutlinedButton.icon(
                  onPressed: _isSaving ? null : _saveSettings,
                  icon: const Icon(Icons.save, color: Colors.green),
                  label: const Text(
                    "SIMPAN PENGATURAN",
                    style: TextStyle(color: Colors.green),
                  ),
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Colors.green),
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildToggleBox({
    required IconData icon,
    required String label,
    required String status,
    required bool isActive,
    required Color activeColor,
    required Color inactiveColor,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 150,
        height: 100,
        decoration: BoxDecoration(
          color: Colors.grey[900],
          border: Border.all(
            color: isActive ? activeColor : inactiveColor,
            width: 2,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: isActive ? activeColor : inactiveColor, size: 30),
            const SizedBox(height: 8),
            Text(
              "$label :\n$status",
              textAlign: TextAlign.center,
              style: TextStyle(color: isActive ? activeColor : inactiveColor),
            ),
          ],
        ),
      ),
    );
  }
}
