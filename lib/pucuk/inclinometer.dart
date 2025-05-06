import 'package:flutter/material.dart';

class InclinometerScreen extends StatelessWidget {
  const InclinometerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4, 
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          elevation: 0,
          automaticallyImplyLeading: false,
          bottom: const TabBar(
            indicatorColor: Colors.green,
            labelColor: Colors.green,
            unselectedLabelColor: Colors.white,
            indicatorWeight: 3,
            tabs: [
              Tab(icon: Icon(Icons.list), text: 'UTAMA'),
              Tab(icon: Icon(Icons.sensors), text: 'SENSOR'),
              Tab(icon: Icon(Icons.link), text: 'KONEKSI'),
              Tab(icon: Icon(Icons.info_outline), text: 'VERSI'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            InclinometerUtamaTab(),
            InclinometerSensorTab(),
            InclinometerKoneksiTab(),
            InclinometerVersiTab(),
          ],
        ),
      ),
    );
  }
}

class InclinometerUtamaTab extends StatelessWidget {
  const InclinometerUtamaTab({super.key});

  @override
  Widget build(BuildContext context) {
    Widget _buildInfoBox(String title, String value) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: const TextStyle(color: Colors.white, fontSize: 14)),
            const SizedBox(height: 4),
            Text(value, style: const TextStyle(color: Colors.green, fontSize: 16)),
          ],
        );

    return Column(
      children: [
        const SizedBox(height: 20),
        const Text(
          'PERANGKAT UTAMA INCLINOMETER',
          style: TextStyle(
            color: Colors.green,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildInfoBox('ROM', '66MB'),
                  _buildInfoBox('FREKUENSI', '180 MHz'),
                  _buildInfoBox('RAM', '16MB'),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildInfoBox('PROSESOR', 'Arm®32 bit Cortex®M4'),
                  _buildInfoBox('BATERAI', 'Li-ion 5000 mAh'),
                  const SizedBox(width: 100), // alignment spacer
                ],
              ),
            ],
          ),
        ),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              side: const BorderSide(color: Colors.green, width: 2),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
            ),
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back, color: Colors.green),
            label: const Text('KEMBALI', style: TextStyle(color: Colors.green, fontSize: 16)),
          ),
        ),
      ],
    );
  }
}

class InclinometerSensorTab extends StatelessWidget {
  const InclinometerSensorTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        const Text(
          'SENSOR INCLINOMETER',
          style: TextStyle(color: Colors.green, fontSize: 20, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 20),
        const Text(
          'RENTANG PENGUKURAN',
          style: TextStyle(color: Colors.white, fontSize: 16),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 10),
        const Text(
          '-95° s/d +95°',
          style: TextStyle(color: Colors.green, fontSize: 24, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ElevatedButton.icon(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.arrow_back, color: Colors.green),
                label: const Text('KEMBALI', style: TextStyle(color: Colors.green)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  side: const BorderSide(color: Colors.green, width: 2),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class InclinometerKoneksiTab extends StatelessWidget {
  const InclinometerKoneksiTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        const Text(
          'KONEKSI INCLINOMETER',
          style: TextStyle(color: Colors.green, fontSize: 20, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 20),
        const Text('RADIO ISM', style: TextStyle(color: Colors.white, fontSize: 16)),
        const SizedBox(height: 20),
        const Text.rich(
          TextSpan(
            style: TextStyle(fontSize: 16),
            children: [
              TextSpan(text: 'Tipe Koneksi: ', style: TextStyle(color: Colors.white)),
              TextSpan(text: 'Nirkabel', style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold)),
            ],
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 10),
        const Text.rich(
          TextSpan(
            style: TextStyle(fontSize: 16),
            children: [
              TextSpan(text: 'Frekuensi: ', style: TextStyle(color: Colors.white)),
              TextSpan(text: '2.4 GHz', style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold)),
            ],
          ),
          textAlign: TextAlign.center,
        ),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ElevatedButton.icon(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.arrow_back, color: Colors.green),
                label: const Text('KEMBALI', style: TextStyle(color: Colors.green)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  side: const BorderSide(color: Colors.green, width: 2),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class InclinometerVersiTab extends StatefulWidget {
  const InclinometerVersiTab({super.key});

  @override
  State<InclinometerVersiTab> createState() => _InclinometerVersiTabState();
}

class _InclinometerVersiTabState extends State<InclinometerVersiTab> {
  bool isLoading = false;
  String buildValue = '-';
  String versionValue = '-';

  Future<void> _periksaVersi() async {
    setState(() {
      isLoading = true;
    });

    
    await Future.delayed(const Duration(seconds: 2));

    
    setState(() {
      isLoading = false;
      buildValue = '2024.04.05/08:45:58';
      versionValue = '24.04.05';
    });
  }

  Widget _buildInfo(String label, String value) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: const TextStyle(color: Colors.white, fontSize: 16)),
          const SizedBox(height: 6),
          Text(value, style: const TextStyle(color: Colors.green, fontSize: 18, fontWeight: FontWeight.bold)),
        ],
      );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'VERSI INCLINOMETER',
            style: TextStyle(color: Colors.green, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildInfo('BUILD', buildValue),
              const SizedBox(width: 20), 
              _buildInfo('VERSI', versionValue),
            ],
          ),
          const SizedBox(height: 30),
          if (isLoading)
            const Padding(
              padding: EdgeInsets.only(bottom: 20),
              child: Text(
                'Mengirim perintah...',
                style: TextStyle(color: Colors.green, fontSize: 16),
              ),
            ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton.icon(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.arrow_back, color: Colors.green),
                label: const Text('KEMBALI', style: TextStyle(color: Colors.green)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  side: const BorderSide(color: Colors.green, width: 2),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                ),
              ),
              ElevatedButton.icon(
                onPressed: isLoading ? null : _periksaVersi,
                icon: const Icon(Icons.refresh, color: Colors.green),
                label: const Text('PERIKSA VERSI', style: TextStyle(color: Colors.green)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  side: const BorderSide(color: Colors.green, width: 2),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
