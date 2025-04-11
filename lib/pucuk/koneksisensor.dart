import 'package:flutter/material.dart';

class KoneksiSensorScreen extends StatefulWidget {
  const KoneksiSensorScreen({super.key});

  @override
  State<KoneksiSensorScreen> createState() => _KoneksiSensorScreenState();
}

class _KoneksiSensorScreenState extends State<KoneksiSensorScreen> {
  bool showAturID = false;

  int grupIndex = 0;
  int idIndex = 0;
  int chIndex = 0;

  final List<String> grupList = ['02', '03', '04', '13'];
  final List<String> idList = ['01', '02', '03'];
  final List<String> chList = ['01', '02', '15'];

  void _showSinkronisasiScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const SinkronisasiIDScreen()),
    );
  }

  Widget _buildSensorTile(String nama, bool tersambung) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("ID\n10-10", style: TextStyle(color: Colors.white)),
              const SizedBox(height: 4),
              Text(nama, style: const TextStyle(color: Colors.white)),
              const SizedBox(height: 4),
              Text(
                tersambung ? "TERSAMBUNG" : "TIDAK TERHUBUNG",
                style: TextStyle(
                  color: tersambung ? Colors.green : Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const Spacer(),
          const Icon(Icons.battery_full, color: Colors.green, size: 30),
        ],
      ),
    );
  }

  Widget _buildArrowButton(IconData icon, VoidCallback onPressed) {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.green),
      ),
      child: IconButton(
        icon: Icon(icon, color: Colors.green),
        onPressed: onPressed,
      ),
    );
  }

  Widget _buildIDGridInfo() {
    return Column(
      children: [
        _buildIDRow("ID GRUP", grupList[grupIndex]),
        _buildIDRow("ID PUCUK", idList[idIndex]),
        _buildIDRow("CHANNEL", chList[chIndex]),
      ],
    );
  }

  Widget _buildIDRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Expanded(
              flex: 2,
              child: Text(label, style: const TextStyle(color: Colors.white))),
          Expanded(
              flex: 1,
              child: Text(value,
                  textAlign: TextAlign.right,
                  style: const TextStyle(color: Colors.green))),
        ],
      ),
    );
  }

  Widget _buildAturIDLayout() {
    return Column(
      children: [
        const Text(
          "PENGATURAN ID PERANGKAT",
          style: TextStyle(color: Colors.green, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildArrowButton(Icons.arrow_drop_up, () => setState(() {
              if (grupIndex > 0) grupIndex--;
            })),
            _buildArrowButton(Icons.arrow_drop_up, () => setState(() {
              if (idIndex > 0) idIndex--;
            })),
            _buildArrowButton(Icons.arrow_drop_up, () => setState(() {
              if (chIndex > 0) chIndex--;
            })),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const [
            Text("GRUP", style: TextStyle(color: Colors.white)),
            Text("ID", style: TextStyle(color: Colors.white)),
            Text("CH", style: TextStyle(color: Colors.white)),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(grupList[grupIndex], style: const TextStyle(color: Colors.green, fontSize: 18)),
            Text(idList[idIndex], style: const TextStyle(color: Colors.green, fontSize: 18)),
            Text(chList[chIndex], style: const TextStyle(color: Colors.green, fontSize: 18)),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildArrowButton(Icons.arrow_drop_down, () => setState(() {
              if (grupIndex < grupList.length - 1) grupIndex++;
            })),
            _buildArrowButton(Icons.arrow_drop_down, () => setState(() {
              if (idIndex < idList.length - 1) idIndex++;
            })),
            _buildArrowButton(Icons.arrow_drop_down, () => setState(() {
              if (chIndex < chList.length - 1) chIndex++;
            })),
          ],
        ),
        const Spacer(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            OutlinedButton.icon(
              onPressed: () => setState(() => showAturID = false),
              icon: const Icon(Icons.arrow_back, color: Colors.green),
              label: const Text("KEMBALI", style: TextStyle(color: Colors.green)),
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: Colors.green),
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              ),
            ),
            OutlinedButton.icon(
              onPressed: () {
                setState(() {
                  showAturID = false;
                });
                _showSinkronisasiScreen();
              },
              icon: const Icon(Icons.save, color: Colors.green),
              label: const Text("SIMPAN ID", style: TextStyle(color: Colors.green)),
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: Colors.green),
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildMainLayout() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text("SENSOR PERANGKAT", style: TextStyle(color: Colors.white)),
            Text("ID PERANGKAT", style: TextStyle(color: Colors.white)),
          ],
        ),
        const Divider(color: Colors.green, thickness: 1),
        Expanded(
          child: Row(
            children: [
              Expanded(
                flex: 3,
                child: Column(
                  children: [
                    _buildSensorTile("KOMPAS", true),
                    _buildSensorTile("ICLINOMETER", true),
                    _buildSensorTile("METEOROLOGI", true),
                  ],
                ),
              ),
              const VerticalDivider(color: Colors.green, thickness: 1, width: 30),
              Expanded(
                flex: 2,
                child: _buildIDGridInfo(),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            OutlinedButton.icon(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.arrow_back, color: Colors.green),
              label: const Text("KEMBALI", style: TextStyle(color: Colors.green)),
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: Colors.green),
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              ),
            ),
            ElevatedButton.icon(
              onPressed: () => setState(() => showAturID = true),
              icon: const Icon(Icons.settings, color: Colors.black),
              label: const Text("ATUR ID", style: TextStyle(color: Colors.black)),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              ),
            ),
          ],
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        automaticallyImplyLeading: false,
        title: const Text("SENSOR & ID PERANGKAT", style: TextStyle(color: Colors.green)),
        iconTheme: const IconThemeData(color: Colors.green),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Row(
              children: const [
                Icon(Icons.radio, color: Colors.green),
                SizedBox(width: 6),
                Text("RADIO SR", style: TextStyle(color: Colors.green)),
              ],
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: showAturID
            ? Column(
                children: [
                  Expanded(child: _buildAturIDLayout()),
                ],
              )
            : _buildMainLayout(),
      ),
    );
  }
}

class SinkronisasiIDScreen extends StatefulWidget {
  const SinkronisasiIDScreen({super.key});

  @override
  State<SinkronisasiIDScreen> createState() => _SinkronisasiIDScreenState();
}

class _SinkronisasiIDScreenState extends State<SinkronisasiIDScreen> {
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        isLoading = false;
      });
    });
  }

  Widget _buildRow(String sensor, String status, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(sensor, style: const TextStyle(color: Colors.white, fontSize: 18)),
          Text(status, style: TextStyle(color: color, fontSize: 18, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        automaticallyImplyLeading: false, // Hilangkan icon back
        title: const Text("SINKRONISASI ID", style: TextStyle(color: Colors.green)),
        iconTheme: const IconThemeData(color: Colors.green),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            _buildRow("SENSOR ICLINOMETER", isLoading ? "PROSES" : "BERHASIL", isLoading ? Colors.yellow : Colors.green),
            _buildRow("SENSOR KOMPAS", isLoading ? "PROSES" : "BERHASIL", isLoading ? Colors.yellow : Colors.green),
            _buildRow("SENSOR METEOROLOGI", isLoading ? "PROSES" : "BERHASIL", isLoading ? Colors.yellow : Colors.green),
            const SizedBox(height: 30),
            if (isLoading)
              Row(
                children: const [
                  CircularProgressIndicator(color: Colors.green, strokeWidth: 3),
                  SizedBox(width: 10),
                  Text("Proses Menyimpan", style: TextStyle(color: Colors.white)),
                ],
              )
            else
              const Row(
                children: [
                  Icon(Icons.check_circle, color: Colors.green),
                  SizedBox(width: 10),
                  Text("Berhasil Disimpan", style: TextStyle(color: Colors.white)),
                ],
              ),
            const Spacer(),
            if (!isLoading)
              Align(
                alignment: Alignment.bottomLeft,
                child: OutlinedButton.icon(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.arrow_back, color: Colors.green),
                  label: const Text("KEMBALI", style: TextStyle(color: Colors.green)),
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Colors.green),
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
