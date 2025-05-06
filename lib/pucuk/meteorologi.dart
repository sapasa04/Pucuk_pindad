import 'package:flutter/material.dart';

class MeteorologiScreen extends StatefulWidget {
  const MeteorologiScreen({super.key});

  @override
  State<MeteorologiScreen> createState() => _MeteorologiScreenState();
}

class _MeteorologiScreenState extends State<MeteorologiScreen> {
  int sensorPageIndex = 0;
  bool isLoading = false;
  String buildVersion = '-';
  String formattedVersion = '-';

  final List<String> sensorTitles = [
    'SUHU',
    'KELEMBAPAN UDARA',
    'TEKANAN UDARA',
    'KECEPATAN ANGIN',
    'ARAH ANGIN',
  ];
  final List<String> sensorRanges = [
    '-40° s/d 85°',
    '0 s/d 100 % RH',
    '300 s/d 1000 hPa',
    '0 s/d 60 m/s',
    '0 s/d 360°',
  ];
  final List<String> sensorAccuracies = [
    '±1.0 °C',
    '±1.0 RH',
    '±1.0 hPa',
    '±3% di 10m/s',
    '±3.0° di 10m/s',
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        backgroundColor: const Color(0xFF1E1E1E),
        body: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                child: Row(
                  children: [
                    Expanded(
                      child: TabBar(
                        isScrollable: true,
                        indicatorColor: Colors.green,
                        labelColor: Colors.green,
                        unselectedLabelColor: Colors.white,
                        tabs: const [
                          Tab(icon: Icon(Icons.menu), child: Text('UTAMA')),
                          Tab(icon: Icon(Icons.screen_rotation_alt), child: Text('LAYAR')),
                          Tab(icon: Icon(Icons.sensors), child: Text('SENSOR')),
                          Tab(icon: Icon(Icons.settings_input_component), child: Text('KONEKSI')),
                          Tab(icon: Icon(Icons.settings), child: Text('VERSI')),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    _buildUtamaContent(context),
                    _buildLayarContent(context),
                    _buildSensorContent(context),
                    _buildKoneksiContent(context),
                    _buildVersiContent(context),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  static Widget _buildUtamaContent(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        children: [
          const SizedBox(height: 30),
          const Text(
            'PERANGKAT UTAMA METEOROLOGI',
            style: TextStyle(color: Colors.green, fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildInfoItem('ROM', '66MB'),
              _buildInfoItem('FREKUENSI', '180 MHz'),
              _buildInfoItem('RAM', '16MB'),
            ],
          ),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildInfoItem('PROSESSOR', 'Arm®32 bit Cortex®M4'),
              _buildInfoItem('BATERAI', 'Li-ion 5000 mAh'),
            ],
          ),
          const Spacer(),
          _buildKembaliButton(context),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  static Widget _buildLayarContent(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        children: [
          const SizedBox(height: 30),
          const Text(
            'LAYAR METEOROLOGI',
            style: TextStyle(color: Colors.green, fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 30),
          const Text('DIMENSI LAYAR', style: TextStyle(color: Colors.white)),
          const SizedBox(height: 10),
          const Text('4.3 Inch', style: TextStyle(color: Colors.lightGreen)),
          const SizedBox(height: 30),
          const Text('RESOLUSI', style: TextStyle(color: Colors.white)),
          const SizedBox(height: 10),
          const Text('16x2 Karakter', style: TextStyle(color: Colors.lightGreen)),
          const Spacer(),
          _buildKembaliButton(context),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildSensorContent(BuildContext context) {
    String title = sensorTitles[sensorPageIndex];
    String range = sensorRanges[sensorPageIndex];
    String accuracy = sensorAccuracies[sensorPageIndex];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        children: [
          const SizedBox(height: 30),
          const Text(
            'SENSOR METEOROLOGI',
            style: TextStyle(color: Colors.green, fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 30),
          Text(title, style: const TextStyle(color: Colors.white, fontSize: 20)),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Rentang Pengukuran:', style: TextStyle(color: Colors.white)),
              Text(range, style: const TextStyle(color: Colors.lightGreen)),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Akurasi:', style: TextStyle(color: Colors.white)),
              Text(accuracy, style: const TextStyle(color: Colors.lightGreen)),
            ],
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              sensorPageIndex > 0
                  ? TextButton.icon(
                      onPressed: () => setState(() => sensorPageIndex--),
                      icon: const Icon(Icons.arrow_left, color: Colors.green),
                      label: Text(sensorTitles[sensorPageIndex - 1], style: const TextStyle(color: Colors.green)),
                    )
                  : const SizedBox(width: 100),
              sensorPageIndex < sensorTitles.length - 1
                  ? TextButton.icon(
                      onPressed: () => setState(() => sensorPageIndex++),
                      icon: Text(sensorTitles[sensorPageIndex + 1], style: const TextStyle(color: Colors.green)),
                      label: const Icon(Icons.arrow_right, color: Colors.green),
                    )
                  : const SizedBox(width: 100),
            ],
          ),
          const SizedBox(height: 10),
          _buildKembaliButton(context),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildKoneksiContent(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        children: [
          const SizedBox(height: 30),
          const Text(
            'KONEKSI METEOROLOGI',
            style: TextStyle(color: Colors.green, fontSize: 22, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          const Text(
            'RADIO ISM',
            style: TextStyle(color: Colors.white, fontSize: 16),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text('Tipe Koneksi : ', style: TextStyle(color: Colors.white)),
              Text('Nirkabel', style: TextStyle(color: Colors.lightGreen)),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text('Frekuensi : ', style: TextStyle(color: Colors.white)),
              Text('2.4 GHz', style: TextStyle(color: Colors.lightGreen)),
            ],
          ),
          const Spacer(),
          _buildKembaliButton(context),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildVersiContent(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        children: [
          const SizedBox(height: 30),
          
          const Text(
            'VERSI METEOROLOGI',
            style: TextStyle(color: Colors.green, fontSize: 22, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  const Text('BUILD', style: TextStyle(color: Colors.white)),
                  const SizedBox(height: 10),
                  isLoading
                      ? const SizedBox(
                          width: 18,
                          height: 18,
                          child: CircularProgressIndicator(strokeWidth: 2, color: Colors.green),
                        )
                      : Text(buildVersion, style: const TextStyle(color: Colors.lightGreen)),
                ],
              ),
              Column(
                children: [
                  const Text('VERSI', style: TextStyle(color: Colors.white)),
                  const SizedBox(height: 10),
                  isLoading
                      ? const SizedBox(
                          width: 18,
                          height: 18,
                          child: CircularProgressIndicator(strokeWidth: 2, color: Colors.green),
                        )
                      : Text(formattedVersion, style: const TextStyle(color: Colors.lightGreen)),
                ],
              ),
            ],
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 140,
                child: _buildKembaliButton(context),
              ),
              const SizedBox(width: 20),
              SizedBox(
                width: 160,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    side: const BorderSide(color: Colors.green),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  onPressed: isLoading ? null : _periksaVersi,
                  child: isLoading
                      ? const SizedBox(
                          width: 18,
                          height: 18,
                          child: CircularProgressIndicator(strokeWidth: 2, color: Colors.green),
                        )
                      : const Text('PERIKSA VERSI', style: TextStyle(color: Colors.green)),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  static Widget _buildInfoItem(String title, String value) {
    return Column(
      children: [
        Text(title, style: const TextStyle(color: Colors.white)),
        const SizedBox(height: 10),
        Text(value, style: const TextStyle(color: Colors.lightGreen)),
      ],
    );
  }

  static Widget _buildKembaliButton(BuildContext context) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.transparent,
        side: const BorderSide(color: Colors.green),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      ),
      onPressed: () => Navigator.pop(context),
      icon: const Icon(Icons.arrow_back, color: Colors.green, size: 20),
      label: const Text('KEMBALI', style: TextStyle(color: Colors.green, fontSize: 14)),
    );
  }

  void _periksaVersi() async {
    setState(() {
      isLoading = true;
    });

    await Future.delayed(const Duration(seconds: 2));

    setState(() {
      isLoading = false;
      buildVersion = '2024.04.05/08:45:58';
      formattedVersion = '24.04.05';
    });
  }
}
