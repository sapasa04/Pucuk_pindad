import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AmunisiScreen extends StatelessWidget {
  const AmunisiScreen({super.key});

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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const Spacer(flex: 2),

            
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  _AmmoBox(label: 'TAJAM', count: '03', color: Colors.red),
                  _AmmoBox(label: 'ASAP', count: '03', color: Colors.orange),
                  _AmmoBox(label: 'CAHAYA', count: '02', color: Colors.yellow),
                ],
              ),

              const Spacer(flex: 3),

              
              Padding(
                padding: const EdgeInsets.only(bottom: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _AmunisiButton(
                      icon: Icons.arrow_back,
                      label: 'KEMBALI',
                      onTap: () => Navigator.pop(context),
                    ),
                    _AmunisiButton(
                      icon: FontAwesomeIcons.gear,
                      label: 'ATUR AMUNISI',
                      onTap: () {
                        
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
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
