import 'package:flutter/material.dart';

class AlatBidikScreen extends StatefulWidget {
  const AlatBidikScreen({super.key});

  @override
  _AlatBidikScreenState createState() => _AlatBidikScreenState();
}

class _AlatBidikScreenState extends State<AlatBidikScreen> {
  int _selectedTab = 0;

  void _onTabSelected(int index) => setState(() => _selectedTab = index);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _MenuItem(
                    icon: Icons.menu,
                    label: 'UTAMA',
                    active: _selectedTab == 0,
                    onTap: () => _onTabSelected(0),
                  ),
                  _MenuItem(
                    icon: Icons.fullscreen,
                    label: 'LAYAR',
                    active: _selectedTab == 1,
                    onTap: () => _onTabSelected(1),
                  ),
                  _MenuItem(
                    icon: Icons.gps_fixed,
                    label: 'GPS',
                    active: _selectedTab == 2,
                    onTap: () => _onTabSelected(2),
                  ),
                  _MenuItem(
                    icon: Icons.hub,
                    label: 'KONEKSI',
                    active: _selectedTab == 3,
                    onTap: () => _onTabSelected(3),
                  ),
                  _MenuItem(
                    icon: Icons.article,
                    label: 'VERSI',
                    active: _selectedTab == 4,
                    onTap: () => _onTabSelected(4),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 12),

            
            if (_selectedTab == 0) ...[
              const Text(
                'PERANGKAT UTAMA ALAT BIDIK',
                style: TextStyle(
                  color: Colors.lightGreen,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ] else if (_selectedTab == 1) ...[
              const Text(
                'LAYAR ALAT BIDIK',
                style: TextStyle(
                  color: Colors.lightGreen,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ] else if (_selectedTab == 2) ...[
              const Text(
                'GPS ALAT BIDIK',
                style: TextStyle(
                  color: Colors.lightGreen,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ] else if (_selectedTab == 3) ...[
              const Text(
                'KONEKSI ALAT BIDIK',
                style: TextStyle(
                  color: Colors.lightGreen,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ] else if (_selectedTab == 4) ...[
              const Text(
                'VERSI ALAT BIDIK',
                style: TextStyle(
                  color: Colors.lightGreen,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ],

            const SizedBox(height: 40),

            
            if (_selectedTab == 0) ...[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Column(
                  children: const [
                    
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(child: _InfoItem(label: 'ROM', value: '66MB')),
                        SizedBox(width: 40),
                        Expanded(child: _InfoItem(label: 'FREKUENSI', value: '180 MHz')),
                      ],
                    ),
                    SizedBox(height: 24),
                    
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(child: _InfoItem(label: 'RAM', value: '16MB')),
                        SizedBox(width: 40),
                        Expanded(child: _InfoItem(label: 'BATERAI', value: 'Li-ion 5000 mAh')),
                      ],
                    ),
                    SizedBox(height: 24),
                    
                    _InfoItem(label: 'PROSESSOR', value: '32 bit Cortex®Arm®M4'),
                  ],
                ),
              ),
            ],

            
            if (_selectedTab == 1) ...[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Column(
                  children: const [
                    _DetailItem(title: 'DIMENSI LAYAR', value: '4,3 inch'),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _DetailItem(title: 'TIPE LAYAR', value: 'LAYAR SENTUH'),
                        SizedBox(width: 40),
                        _DetailItem(title: 'RESOLUSI', value: '800×400 Pixel'),
                      ],
                    ),
                  ],
                ),
              ),
            ],

            
            if (_selectedTab == 2) ...[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Column(
                  children: const [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _DetailItem(title: 'TIPE GPS', value: 'L1/L2'),
                        SizedBox(width: 40),
                        _DetailItem(title: 'AKURASI', value: '4M'),
                      ],
                    ),
                  ],
                ),
              ),
            ],

            
            if (_selectedTab == 3) ...[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Column(
                  children: const [
                    
                    _DetailItem(title: 'Radio ISM', value: ''),
                    SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(child: _DetailItem(title: 'TIPE KONEKSI', value: 'Nirkabel')),
                        SizedBox(width: 40),
                        Expanded(child: _DetailItem(title: 'FREKUENSI', value: '2.4 GHz')),
                      ],
                    ),
                    SizedBox(height: 24),
                    
                    _DetailItem(title: 'Radio SR', value: ''),
                    SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(child: _DetailItem(title: 'TIPE KONEKSI', value: 'Nirkabel')),
                        SizedBox(width: 40),
                        Expanded(child: _DetailItem(title: 'FREKUENSI', value: '420-460 MHz')),
                      ],
                    ),
                  ],
                ),
              ),
            ],

            
            if (_selectedTab == 4) ...[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Column(
                  children: const [
                    _DetailItem(title: 'BUILD', value: '2024.04.05/08:45:58'),
                    SizedBox(height: 20),
                    _DetailItem(title: 'VERSI', value: '24.04.05'),
                  ],
                ),
              ),
            ],

            const Spacer(),
            
            
            Padding(
              padding: const EdgeInsets.only(bottom: 24),
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
            ),
          ],
        ),
      ),
    );
  }
}

class _InfoItem extends StatelessWidget {
  final String label, value;
  const _InfoItem({required this.label, required this.value});
  @override
  Widget build(BuildContext context) => Column(
    children: [
      Text(label, style: const TextStyle(color: Colors.white, fontSize: 14), textAlign: TextAlign.center),
      const SizedBox(height: 6),
      Text(value, style: const TextStyle(color: Colors.green, fontSize: 14), textAlign: TextAlign.center),
    ],
  );
}

class _DetailItem extends StatelessWidget {
  final String title, value;
  const _DetailItem({required this.title, required this.value});
  @override
  Widget build(BuildContext context) => Column(
    children: [
      Text(title, style: const TextStyle(color: Colors.white, fontSize: 14), textAlign: TextAlign.center),
      const SizedBox(height: 6),
      Text(value, style: const TextStyle(color: Colors.green, fontSize: 14), textAlign: TextAlign.center),
    ],
  );
}

class _MenuItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool active;
  final VoidCallback onTap;

  const _MenuItem({
    required this.icon,
    required this.label,
    required this.active,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) => GestureDetector(
    onTap: onTap,
    child: Column(
      children: [
        Icon(icon, color: Colors.white),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            color: active ? Colors.lightGreen : Colors.white,
            fontSize: 12,
            fontWeight: active ? FontWeight.bold : FontWeight.normal,
          ),
        ),
        if (active)
          Container(
            margin: const EdgeInsets.only(top: 2),
            height: 2,
            width: 40,
            color: Colors.lightGreen,
          ),
      ],
    ),
  );
}
