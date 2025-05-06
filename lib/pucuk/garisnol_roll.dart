import 'package:flutter/material.dart';

class GarisNolRoll extends StatefulWidget {
  const GarisNolRoll({super.key});

  @override
  State<GarisNolRoll> createState() => _GarisNolRollState();
}

class _GarisNolRollState extends State<GarisNolRoll> {
  bool showAturRoll = false;
  bool showBerhasilSimpan = false;
  double rollDerajat = 0.00;
  int rollMil = 0;
  int offset = 0;

  void _incrementOffset() {
    setState(() {
      offset++;
    });
  }

  void _decrementOffset() {
    setState(() {
      offset--;
    });
  }

  void _resetOffset() {
    setState(() {
      offset = 0;
    });
  }

  void _simpanRoll() {
    setState(() {
      showBerhasilSimpan = true;
      showAturRoll = false;
      offset = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const Text(
                'GARIS NOL ROLL',
                style: TextStyle(
                  color: Colors.green,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 60),

              if (!showAturRoll)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      '${rollDerajat.toStringAsFixed(2)}° /${rollMil.toString().padLeft(2, '0')} mil',
                      style: const TextStyle(color: Colors.white, fontSize: 22),
                    ),
                    Text(
                      '+$offset mil',
                      style: const TextStyle(color: Colors.white, fontSize: 22),
                    ),
                  ],
                )
              else
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      '${rollDerajat.toStringAsFixed(2)}° /${rollMil.toString().padLeft(2, '0')} mil',
                      style: const TextStyle(color: Colors.white, fontSize: 22),
                    ),
                    Column(
                      children: [
                        GestureDetector(
                          onTap: _incrementOffset,
                          child: Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.green, width: 2),
                            ),
                            child: const Icon(Icons.arrow_drop_up,
                                color: Colors.green, size: 40),
                          ),
                        ),
                        Text(
                          '+$offset',
                          style:
                              const TextStyle(color: Colors.white, fontSize: 22),
                        ),
                        GestureDetector(
                          onTap: _decrementOffset,
                          child: Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.green, width: 2),
                            ),
                            child: const Icon(Icons.arrow_drop_down,
                                color: Colors.green, size: 40),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

              const Spacer(),

              if (showBerhasilSimpan)
                Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.check_circle, color: Colors.green),
                      SizedBox(width: 8),
                      Text(
                        'Berhasil Disimpan',
                        style: TextStyle(color: Colors.green, fontSize: 16),
                      ),
                    ],
                  ),
                ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      if (showAturRoll) {
                        setState(() {
                          showAturRoll = false;
                        });
                      } else {
                        Navigator.pop(context);
                      }
                    },
                    child: Container(
                      width: 140,
                      height: 50,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.green, width: 2),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.arrow_back, color: Colors.green),
                          SizedBox(width: 8),
                          Text('KEMBALI',
                              style: TextStyle(
                                  color: Colors.green, fontSize: 16)),
                        ],
                      ),
                    ),
                  ),

                  if (showAturRoll)
                    GestureDetector(
                      onTap: _resetOffset,
                      child: Container(
                        width: 120,
                        height: 50,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.green, width: 2),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.refresh, color: Colors.green),
                            SizedBox(width: 8),
                            Text('RESET',
                                style: TextStyle(
                                    color: Colors.green, fontSize: 16)),
                          ],
                        ),
                      ),
                    )
                  else
                    const SizedBox(width: 120),

                  GestureDetector(
                    onTap: () {
                      if (showAturRoll) {
                        _simpanRoll();
                      } else {
                        setState(() {
                          showAturRoll = true;
                          showBerhasilSimpan = false;
                        });
                      }
                    },
                    child: Container(
                      width: 160,
                      height: 50,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.green, width: 2),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            showAturRoll ? Icons.save : Icons.settings,
                            color: Colors.green,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            showAturRoll ? 'SIMPAN WAKTU' : 'ATUR SENSOR',
                            style: const TextStyle(
                                color: Colors.green, fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
