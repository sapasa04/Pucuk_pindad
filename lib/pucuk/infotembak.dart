import 'package:flutter/material.dart';

class InfoTembakScreen extends StatefulWidget {
  const InfoTembakScreen({super.key});

  @override
  State<InfoTembakScreen> createState() => _InfoTembakScreenState();
}

class _InfoTembakScreenState extends State<InfoTembakScreen> {
  List<Map<String, String>> dataTembakan = [
    {
      'waktu': '181924 JAN 2022\n1702902256995',
      'koreksi': '00',
      'elevasi': '1161',
      'azimut': '738',
      'isian': '06',
      'jenis': 'TAJAM',
    },
    {
      'waktu': '181005 JAN 2022\n1515845750867',
      'koreksi': '00',
      'elevasi': '1396',
      'azimut': '235',
      'isian': '01',
      'jenis': 'ASAP',
    },
    {
      'waktu': '180800 JAN 2022\n1515845750999',
      'koreksi': '-',
      'elevasi': '-',
      'azimut': '-',
      'isian': '-',
      'jenis': '-',
    },
  ];

  void _hapusDataTerakhir() {
    if (dataTembakan.isNotEmpty) {
      setState(() {
        dataTembakan.removeLast();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text(
          'INFORMASI TEMBAKAN',
          style: TextStyle(color: Colors.green),
        ),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 10),
              padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.green),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  _cell('NO', flex: 1),
                  _cell('WAKTU', flex: 4),
                  _cell('KOREKSI', flex: 1),
                  _cell('ELEVASI', flex: 2),
                  _cell('AZIMUT', flex: 2),
                  _cell('ISIAN', flex: 1),
                  _cell('JENIS AMUNISI', flex: 2),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: dataTembakan.length,
                itemBuilder: (context, index) {
                  final item = dataTembakan[index];
                  return _buildDataRow(index + 1, item);
                },
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                OutlinedButton.icon(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back, color: Colors.green),
                  label: const Text('KEMBALI', style: TextStyle(color: Colors.green)),
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Colors.green),
                  ),
                ),
                const Spacer(),
                ElevatedButton.icon(
                  onPressed: _hapusDataTerakhir,
                  icon: const Icon(Icons.delete, color: Colors.red),
                  label: const Text('HAPUS', style: TextStyle(color: Colors.red)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    side: const BorderSide(color: Colors.red),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDataRow(int nomor, Map<String, String> data) {
    final jenis = data['jenis'] ?? '-';

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.green),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          _cell('$nomor', flex: 1),
          _cell(data['waktu'] ?? '-', flex: 4),
          _cell(data['koreksi'] ?? '-', flex: 1),
          _cell(data['elevasi'] ?? '-', flex: 2),
          _cell(data['azimut'] ?? '-', flex: 2),
          _cell(data['isian'] ?? '-', flex: 1),
          _cell(
            jenis,
            flex: 2,
            color: jenis == 'TAJAM'
                ? Colors.red
                : (jenis == 'ASAP' ? Colors.orange : Colors.green),
          ),
        ],
      ),
    );
  }

  Widget _cell(String text, {int flex = 1, Color color = Colors.green}) {
    return Expanded(
      flex: flex,
      child: Text(
        text,
        style: TextStyle(
          color: color,
          fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
