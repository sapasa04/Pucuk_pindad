import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class InfoSensorScreen extends StatefulWidget {
  const InfoSensorScreen({super.key});

  @override
  State<InfoSensorScreen> createState() => _InfoSensorState();
}

class _InfoSensorState extends State<InfoSensorScreen> {
  String? selectedInfo;
  bool showStatus = false;
  bool showWarning = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: showStatus || showWarning
          ? null
          : AppBar(
              backgroundColor: Colors.green[200],
              centerTitle: true,
              automaticallyImplyLeading: false,
              title: Text(
                selectedInfo == null
                    ? 'INFORMASI SENSOR'
                    : selectedInfo == 'kompas'
                        ? 'INFORMASI KOMPAS'
                        : 'INFORMASI INCLINOMETER',
                style: const TextStyle(color: Colors.white),
              ),
            ),
      body: Stack(
        children: [
          if (selectedInfo == null) _buildMainMenu(),
          if (selectedInfo == 'kompas' && !showStatus && !showWarning)
            _buildKompasInfo(),
          if (selectedInfo == 'inclinometer' && !showStatus && !showWarning)
            _buildInclinometerInfo(),
          if (showStatus && !showWarning) _buildSensorStatus(),
          if (showWarning) _buildPeringatanSensor(),

          
          if (!showWarning)
            Positioned(
              bottom: 40,
              left: 20,
              right: 20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  
                  SizedBox(
                    width: 150,
                    child: OutlinedButton.icon(
                      onPressed: () {
                        if (showStatus) {
                          setState(() {
                            showStatus = false;
                          });
                        } else if (selectedInfo != null) {
                          setState(() {
                            selectedInfo = null;
                          });
                        } else {
                          Navigator.pop(context);
                        }
                      },
                      icon: const Icon(Icons.arrow_back, color: Colors.green),
                      label: const Text('KEMBALI',
                          style: TextStyle(color: Colors.green)),
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Colors.green),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 12),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                      ),
                    ),
                  ),

                  
                  if (showStatus)
                    SizedBox(
                      width: 150,
                      child: OutlinedButton.icon(
                        onPressed: () {
                          setState(() {
                            showWarning = true;
                          });
                        },
                        icon: const Icon(Icons.arrow_forward,
                            color: Colors.green),
                        label: const Text('SELANJUTNYA',
                            style: TextStyle(color: Colors.green)),
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(color: Colors.green),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 12),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                        ),
                      ),
                    ),
                ],
              ),
            ),

          
          
if (selectedInfo == 'kompas' && !showStatus && !showWarning)

            Positioned(
              bottom: 40,
              right: 20,
              child: SizedBox(
                width: 150,
                child: OutlinedButton.icon(
                  onPressed: () {
                    setState(() {
                      showStatus = true;
                    });
                  },
                  icon: const Icon(Icons.check_box, color: Colors.green),
                  label: const Text('CEK STATUS',
                      style: TextStyle(color: Colors.green)),
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Colors.green),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                  ),
                ),
              ),
            ),

          
          if (showWarning)
            Positioned(
              bottom: 40,
              left: 20,
              child: SizedBox(
                width: 150,
                child: OutlinedButton.icon(
                  onPressed: () {
                    setState(() {
                      showWarning = false;
                    });
                  },
                  icon: const Icon(Icons.arrow_back, color: Colors.green),
                  label: const Text('KEMBALI',
                      style: TextStyle(color: Colors.green)),
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Colors.green),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildMainMenu() {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                selectedInfo = 'kompas';
              });
            },
            child: _buildSensorBox(
              icon: FontAwesomeIcons.compass,
              label: 'INFO KOMPAS',
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                selectedInfo = 'inclinometer';
              });
            },
            child: _buildSensorBox(
              icon: FontAwesomeIcons.rulerCombined,
              label: 'INFO INCLINOMETER',
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildKompasInfo() {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Text('AZIMUT',
                  style: TextStyle(color: Colors.white, fontSize: 18)),
              SizedBox(height: 10),
              Text('74.76° / 1329.07 mil',
                  style: TextStyle(color: Colors.green, fontSize: 18)),
            ],
          ),
          const SizedBox(width: 60),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Text('ROLL',
                  style: TextStyle(color: Colors.white, fontSize: 18)),
              SizedBox(height: 10),
              Text('000.00 / 0000 mil',
                  style: TextStyle(color: Colors.green, fontSize: 18)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildInclinometerInfo() {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Text('ELEVASI',
                  style: TextStyle(color: Colors.white, fontSize: 18)),
              SizedBox(height: 10),
              Text('45.00° / 800 mil',
                  style: TextStyle(color: Colors.green, fontSize: 18)),
            ],
          ),
          const SizedBox(width: 60),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Text('ROLL',
                  style: TextStyle(color: Colors.white, fontSize: 18)),
              SizedBox(height: 10),
              Text('000.00° / 0000 mil',
                  style: TextStyle(color: Colors.green, fontSize: 18)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSensorStatus() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: const [
          SizedBox(height: 40),
          Text(
            'KEGAGALAN SENSOR',
            style: TextStyle(
                color: Colors.red, fontSize: 30, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20),
          _StatusRow(title: 'Inisialisasi Awal', status: 'OK'),
          _StatusRow(title: 'IMU', status: 'OK'),
          _StatusRow(title: 'Gyroscope', status: 'OK'),
          _StatusRow(title: 'Accelerometer', status: 'OK'),
          _StatusRow(title: 'Magnetometer', status: 'OK'),
          _StatusRow(title: 'Elektronik Sensor', status: 'OK'),
        ],
      ),
    );
  }

  Widget _buildPeringatanSensor() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          const Text(
            'PERINGATAN SENSOR',
            style: TextStyle(
              color: Colors.yellow,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          _StatusRow(title: 'Sumber Daya Listrik Rendah', status: 'OK', fontSize: 20),
          _StatusRow(title: 'Sumber Daya Listrik Tinggi', status: 'OK', fontSize: 20),
          _StatusRow(title: 'Jangkauan Axis X', status: 'OK', fontSize: 20),
          _StatusRow(title: 'Jangkauan Axis Y', status: 'OK', fontSize: 20),
          _StatusRow(title: 'Jangkauan Axis Z', status: 'OK', fontSize: 20),
          _StatusRow(title: 'Jangkauan Medan Magnet', status: 'OK', fontSize: 20),
          _StatusRow(title: 'Suhu Lingkungan', status: 'OK', fontSize: 20),
        ],
      ),
    );
  }

  Widget _buildSensorBox({required IconData icon, required String label}) {
    return Container(
      width: 150,
      height: 150,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.green, width: 2),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 50, color: Colors.green),
          const SizedBox(height: 10),
          Text(
            label,
            style: const TextStyle(
                color: Colors.green, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class _StatusRow extends StatelessWidget {
  final String title;
  final String status;
  final double fontSize;

  const _StatusRow({
    required this.title,
    required this.status,
    this.fontSize = 25,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Center(
        child: SizedBox(
          width: 300,
          child: Row(
            children: [
              SizedBox(
                width: 180,
                child: Text(
                  title,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: fontSize,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const Spacer(),
              Text(
                status,
                style: TextStyle(
                  color: Colors.green,
                  fontSize: fontSize,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
