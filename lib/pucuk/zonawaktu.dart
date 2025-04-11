import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ZonaWaktuScreen extends StatefulWidget {
  const ZonaWaktuScreen({super.key});

  @override
  State<ZonaWaktuScreen> createState() => _ZonaWaktuScreenState();
}

class _ZonaWaktuScreenState extends State<ZonaWaktuScreen> {
  int timezoneOffset = 1;
  bool _isSaved = false;

  void increaseTimezone() {
    if (timezoneOffset < 2) {
      setState(() {
        timezoneOffset++;
        _isSaved = false;
      });
    }
  }

  void decreaseTimezone() {
    if (timezoneOffset > -2) {
      setState(() {
        timezoneOffset--;
        _isSaved = false;
      });
    }
  }

  void saveTimezone() {
    setState(() {
      _isSaved = true;
    });

    
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        setState(() {
          _isSaved = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 20),
            const Center(
              child: Text(
                'ZONA WAKTU',
                style: TextStyle(
                  color: Colors.lightGreen,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const Spacer(),

            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _arrowButton(
                  icon: Icons.arrow_drop_up,
                  onTap: timezoneOffset < 2 ? increaseTimezone : null,
                ),
                const SizedBox(height: 20),
                Text(
                  '${timezoneOffset >= 0 ? '+' : ''}$timezoneOffset',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 50,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 20),
                _arrowButton(
                  icon: Icons.arrow_drop_down,
                  onTap: timezoneOffset > -2 ? decreaseTimezone : null,
                ),
              ],
            ),

            const Spacer(),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildButton(context, FontAwesomeIcons.arrowLeft, 'KEMBALI', () {
                    Navigator.pop(context);
                  }),

                  _isSaved
                      ? Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.lightGreen, width: 2),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            children: const [
                              Icon(Icons.check, color: Colors.lightGreen, size: 18),
                              SizedBox(width: 8),
                              Text(
                                'Berhasil Disimpan',
                                style: TextStyle(color: Colors.white, fontSize: 14),
                              ),
                            ],
                          ),
                        )
                      : const SizedBox(width: 140),

                  _buildButton(context, FontAwesomeIcons.save, 'SIMPAN WAKTU', saveTimezone),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _arrowButton({required IconData icon, VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.lightGreen, width: 2),
          borderRadius: BorderRadius.circular(10),
          color: onTap != null ? Colors.transparent : Colors.grey.withOpacity(0.2),
        ),
        child: Icon(
          icon,
          color: onTap != null ? Colors.lightGreen : Colors.grey,
          size: 35,
        ),
      ),
    );
  }

  Widget _buildButton(BuildContext context, IconData icon, String label, VoidCallback onPressed) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.lightGreen, width: 2),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Icon(icon, color: Colors.lightGreen, size: 18),
            const SizedBox(width: 10),
            Text(
              label,
              style: const TextStyle(
                color: Colors.lightGreen,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
    );
  }
}
