import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:async';

class AmunisiScreen extends StatefulWidget {
  const AmunisiScreen({super.key});

  @override
  State<AmunisiScreen> createState() => _AmunisiScreenState();
}

class _AmunisiScreenState extends State<AmunisiScreen> {
  bool isAturMode = false;
  bool showSavedMessage = false;

  int tajam = 1;
  int asap = 1;
  int cahaya = 1;

  void increase(String type) {
    setState(() {
      if (type == 'tajam' && tajam < 3) tajam++;
      if (type == 'asap' && asap < 3) asap++;
      if (type == 'cahaya' && cahaya < 3) cahaya++;
    });
  }

  void decrease(String type) {
    setState(() {
      if (type == 'tajam' && tajam > 1) tajam--;
      if (type == 'asap' && asap > 1) asap--;
      if (type == 'cahaya' && cahaya > 1) cahaya--;
    });
  }

  void simpanData() {
    setState(() {
      showSavedMessage = true;
    });
    
  }

  String formatCount(int value) => value.toString().padLeft(2, '0');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('AMUNISI', style: TextStyle(color: Colors.green)),
        backgroundColor: Colors.black,
        centerTitle: true,
        elevation: 0,
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  const Spacer(flex: 2),
                  isAturMode ? buildAturMode() : buildDisplayMode(),
                  const Spacer(flex: 3),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 24),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _AmunisiButton(
                          icon: Icons.arrow_back,
                          label: 'KEMBALI',
                          onTap: () {
                            if (isAturMode) {
                              setState(() {
                                isAturMode = false;
                                showSavedMessage = false;
                              });
                            } else {
                              Navigator.pop(context);
                            }
                          },
                        ),
                        _AmunisiButton(
                          icon: isAturMode
                              ? FontAwesomeIcons.floppyDisk
                              : FontAwesomeIcons.gear,
                          label: isAturMode ? 'SIMPAN WAKTU' : 'ATUR AMUNISI',
                          onTap: () {
                            if (isAturMode) {
                              simpanData();
                            } else {
                              setState(() => isAturMode = true);
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            if (showSavedMessage)
              Positioned(
                bottom: 80,
                left: 0,
                right: 0,
                child: Center(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Icon(Icons.check_circle, color: Colors.green, size: 24),
                      SizedBox(width: 8),
                      Text(
                        'BERHASIL DISIMPAN',
                        style: TextStyle(
                          color: Colors.green,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget buildDisplayMode() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _AmmoBox(label: 'TAJAM', count: formatCount(tajam), color: Colors.red),
        _AmmoBox(label: 'ASAP', count: formatCount(asap), color: Colors.orange),
        _AmmoBox(label: 'CAHAYA', count: formatCount(cahaya), color: Colors.yellow),
      ],
    );
  }

  Widget buildAturMode() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _AturAmmoBox(
          label: 'TAJAM',
          count: formatCount(tajam),
          color: Colors.red,
          onUp: () => increase('tajam'),
          onDown: () => decrease('tajam'),
        ),
        _AturAmmoBox(
          label: 'ASAP',
          count: formatCount(asap),
          color: Colors.orange,
          onUp: () => increase('asap'),
          onDown: () => decrease('asap'),
        ),
        _AturAmmoBox(
          label: 'CAHAYA',
          count: formatCount(cahaya),
          color: Colors.yellow,
          onUp: () => increase('cahaya'),
          onDown: () => decrease('cahaya'),
        ),
      ],
    );
  }
}

class _AmmoBox extends StatelessWidget {
  final String label;
  final String count;
  final Color color;

  const _AmmoBox({
    required this.label,
    required this.count,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          label,
          style: TextStyle(
            color: color,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          count,
          style: TextStyle(
            color: color,
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

class _AturAmmoBox extends StatelessWidget {
  final String label;
  final String count;
  final Color color;
  final VoidCallback onUp;
  final VoidCallback onDown;

  const _AturAmmoBox({
    required this.label,
    required this.count,
    required this.color,
    required this.onUp,
    required this.onDown,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _ArrowButton(icon: Icons.keyboard_arrow_up, onTap: onUp),
        const SizedBox(height: 10),
        Text(
          '$label $count',
          style: TextStyle(
            color: color,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        _ArrowButton(icon: Icons.keyboard_arrow_down, onTap: onDown),
      ],
    );
  }
}

class _ArrowButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _ArrowButton({required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          color: Colors.grey[900],
          border: Border.all(color: Colors.green, width: 2),
        ),
        child: Icon(icon, color: Colors.green, size: 30),
      ),
    );
  }
}

class _AmunisiButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const _AmunisiButton({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.green, width: 2),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Icon(icon, color: Colors.green, size: 20),
            const SizedBox(width: 8),
            Text(label, style: const TextStyle(color: Colors.green)),
          ],
        ),
      ),
    );
  }
}
