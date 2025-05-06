import 'package:flutter/material.dart';

class GarisnolElevasi extends StatefulWidget {
  const GarisnolElevasi({super.key});

  @override
  State<GarisnolElevasi> createState() => _GarisnolElevasiState();
}

class _GarisnolElevasiState extends State<GarisnolElevasi> {
  bool showAturElevasi = false;
  bool showBerhasilSimpan = false;
  double elevasiDerajat = 45.00;
  int elevasiMil = 800;
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

  void _simpanElevasi() {
    setState(() {
      showBerhasilSimpan = true;
      showAturElevasi = false;
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
                'GARIS NOL ELEVASI',
                style: TextStyle(
                  color: Colors.green,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 60),

              if (!showAturElevasi)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      '${elevasiDerajat.toStringAsFixed(2)}° /$elevasiMil mil',
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
                      '${elevasiDerajat.toStringAsFixed(2)}° /$elevasiMil mil',
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
                      if (showAturElevasi) {
                        setState(() {
                          showAturElevasi = false;
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

                  
                  if (showAturElevasi)
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
                      if (showAturElevasi) {
                        _simpanElevasi();
                      } else {
                        setState(() {
                          showAturElevasi = true;
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
                            showAturElevasi ? Icons.save : Icons.settings,
                            color: Colors.green,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            showAturElevasi ? 'SIMPAN WAKTU' : 'ATUR SENSOR',
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
