import 'dart:async';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'posisi_screen.dart'; 



class PosisiKalibrasi extends StatelessWidget {
  const PosisiKalibrasi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text(
          'Posisi & Kalibrasi',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.green[200],
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildBox(
                  context,
                  FontAwesomeIcons.mapMarkerAlt,
                  'Posisi',
                  const PosisiScreen(), 
                ),
                _buildBox(
                  context,
                  FontAwesomeIcons.tools,
                  'Kalibrasi',
                  const KalibrasiScreen(),
                ),
                _buildBox(
                  context,
                  FontAwesomeIcons.compass,
                  'Deklinasi',
                  const DeklinasiScreen(),
                ),
              ],
            ),
            const Spacer(),
            _buildBackButton(context),
          ],
        ),
      ),
    );
  }

  Widget _buildBox(
    BuildContext context,
    IconData icon,
    String label,
    Widget? page,
  ) {
    return GestureDetector(
      onTap: () {
        if (page != null) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => page),
          );
        }
      },
      child: Container(
        width: 170,
        height: 170,
        decoration: BoxDecoration(
          color: Colors.green.withOpacity(0.3),
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.green, width: 2),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 60, color: Colors.green),
            const SizedBox(height: 15),
            Text(
              label,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBackButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20, left: 0),
      child: Align(
        alignment: Alignment.bottomLeft,
        child: InkWell(
          onTap: () => Navigator.pop(context),
          borderRadius: BorderRadius.circular(12),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 12),
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.green),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Icon(Icons.arrow_back, color: Colors.green, size: 20),
                SizedBox(width: 10),
                Text(
                  'KEMBALI',
                  style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.normal,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class KalibrasiScreen extends StatelessWidget {
  const KalibrasiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Kalibrasi', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.green[200],
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                 _buildBox(FontAwesomeIcons.cogs, 'Kalibrasi', () {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => const KalibrasiSatuScreen(),
    ),
  );
}),

                 _buildBox(FontAwesomeIcons.infoCircle, 'Info Kalibrasi', () {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => const InfoKalibrasiScreen(),
    ),
  );
}),

                ],
              ),
            ),
          ),
          _buildBackButton(context),
        ],
      ),
    );
  }

  Widget _buildBox(IconData icon, String label, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 150,
        height: 150,
        decoration: BoxDecoration(
          color: Colors.green.withOpacity(0.3),
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.green, width: 2),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 60, color: Colors.green),
            const SizedBox(height: 15),
            Text(
              label,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBackButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20, left: 0),
      child: Align(
        alignment: Alignment.bottomLeft,
        child: InkWell(
          onTap: () => Navigator.pop(context),
          borderRadius: BorderRadius.circular(12),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 12),
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.green),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Icon(Icons.arrow_back, color: Colors.green, size: 20),
                SizedBox(width: 10),
                Text(
                  'KEMBALI',
                  style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.normal,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
class KalibrasiSatuScreen extends StatelessWidget {
  const KalibrasiSatuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.green[200],
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: const Text(
          'KALIBRASI 1/3',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Spacer(),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  'ATUR ELEVASI KOMPAS KE POSISI 1',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildButton(
                  icon: Icons.arrow_back,
                  label: 'KEMBALI',
                  onTap: () => Navigator.pop(context),
                ),
                _buildButton(
                  icon: Icons.play_arrow,
                  label: 'MULAI KALIBRASI',
                  onTap: () {
                    
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildButton({required IconData icon, required String label, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.green),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Icon(icon, color: Colors.green),
            const SizedBox(width: 8),
            Text(
              label,
              style: const TextStyle(color: Colors.green, fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}


class InfoKalibrasiScreen extends StatefulWidget {
  const InfoKalibrasiScreen({Key? key}) : super(key: key);

  @override
  _InfoKalibrasiScreenState createState() => _InfoKalibrasiScreenState();
}

class _InfoKalibrasiScreenState extends State<InfoKalibrasiScreen> {
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    
    Timer(const Duration(seconds: 3), () {
      setState(() {
        isLoading = false;
      });
    });
  }

  Widget _buildItem(String title, String value) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(
            color: Colors.green,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: const [
              CircularProgressIndicator(color: Colors.green),
              SizedBox(height: 16),
              Text(
                'Mengirim perintah...',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 24),
            Center(
              child: Text(
                'INFO KALIBRASI',
                style: TextStyle(
                  color: Colors.green,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 32),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildItem('LATITUDE', '-6.96097589'),
                  _buildItem('LONGITUDE', '107.62326050'),
                  _buildItem('ALTITUDE', '67.1999'),
                ],
              ),
            ),
            const SizedBox(height: 32),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildItem('WAKTU', '241002 FEB 2025'),
                  _buildItem('KEBERHASILAN', '100%'),
                  _buildItem('AKURASI', '+/-0.10'),
                ],
              ),
            ),
            const SizedBox(height: 32),
            
            const Expanded(child: SizedBox()),
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.green),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Icon(
                          FontAwesomeIcons.arrowLeft,
                          color: Colors.green,
                          size: 16,
                        ),
                        SizedBox(width: 8),
                        Text(
                          'KEMBALI',
                          style: TextStyle(
                            color: Colors.green,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DeklinasiScreen extends StatefulWidget {
  const DeklinasiScreen({super.key});

  @override
  State<DeklinasiScreen> createState() => _DeklinasiScreenState();
}

class _DeklinasiScreenState extends State<DeklinasiScreen> {
  bool showAtur = false;

  
  bool isSavingMenu = false;
  
  bool showSavedMessageMenu = false;

  
  bool isSavingAtur = false;
  bool showSavedBackButtonAtur = false;
  int deklinasi = 01;

  void _resetDeklinasi() {
    setState(() {
      deklinasi = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title:
            const Text('DEKLINASI', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.green[200],
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: showAtur ? _buildAturDeklinasi() : _buildMenuUtama(),
    );
  }

  Widget _buildMenuUtama() {
    
    if (isSavingMenu) {
      return const Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircularProgressIndicator(color: Colors.green),
            SizedBox(height: 16),
            Text(
              'Mengirim perintah...',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ],
        ),
      );
    }

    
    if (showSavedMessageMenu) {
      return Column(
        children: [
          const Spacer(),
          Center(
            child: Column(
              children: [
                const Text(
                  'DEKLINASI TERSIMPAN',
                  style: TextStyle(
                      color: Colors.green,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                Text(
                  '+${deklinasi.toString().padLeft(2, '0')}°',
                  style: const TextStyle(
                      color: Colors.green,
                      fontSize: 36,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          const Spacer(),
          
          _buildBackButtonMenu(),
        ],
      );
    }

  
    return Column(
      children: [
        const Spacer(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            
            _buildBox(
              icon: FontAwesomeIcons.save,
              label: 'DEKLINASI\nTERSIMPAN',
              onTap: () {
                setState(() {
                  isSavingMenu = true;
                });
                Future.delayed(const Duration(seconds: 2), () {
                  setState(() {
                    isSavingMenu = false;
                    showSavedMessageMenu = true;
                  });
                });
              },
            ),
            
            _buildBox(
              icon: FontAwesomeIcons.screwdriverWrench,
              label: 'ATUR\nDEKLINASI',
              onTap: () {
                setState(() {
                  showAtur = true;
              
                  isSavingAtur = false;
                  showSavedBackButtonAtur = false;
                });
              },
            ),
          ],
        ),
        const Spacer(),
      ],
    );
  }

  Widget _buildAturDeklinasi() {
    return Column(
      children: [
        const Spacer(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_drop_up,
                      color: Colors.green, size: 40),
                  onPressed: () => setState(() => deklinasi++),
                ),
                Container(
                  width: 100,
                  height: 60,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.green),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    '$deklinasi°',
                    style:
                        const TextStyle(color: Colors.green, fontSize: 24),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.arrow_drop_down,
                      color: Colors.green, size: 40),
                  onPressed: () => setState(() => deklinasi--),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 30),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            if (isSavingAtur)
              const CircularProgressIndicator(color: Colors.green)
            else if (showSavedBackButtonAtur)
              _buildActionButton('KEMBALI', () {
                setState(() {
                  showAtur = false;
                  showSavedBackButtonAtur = false;
                });
              })
            else
              _buildActionButton('RESET', _resetDeklinasi),
            _buildActionButton('SIMPAN WAKTU', () {
              setState(() {
                isSavingAtur = true;
              });
              Future.delayed(const Duration(seconds: 2), () {
                setState(() {
                  isSavingAtur = false;
                  showSavedBackButtonAtur = true;
                });
              });
            }),
          ],
        ),
        const Spacer(),
      ],
    );
  }

  Widget _buildBox({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 150,
        height: 150,
        decoration: BoxDecoration(
          color: Colors.green.withOpacity(0.3),
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.green, width: 2),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 60, color: Colors.green),
            const SizedBox(height: 10),
            Text(
              label,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButton(String label, VoidCallback onPressed) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding:
            const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.green),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(
          label,
          style: const TextStyle(color: Colors.green, fontSize: 16),
        ),
      ),
    );
  }

  Widget _buildBackButtonMenu() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: _buildActionButton('KEMBALI', () {
        setState(() {
          showSavedMessageMenu = false;
        });
      }),
    );
  }
}
