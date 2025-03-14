import 'package:flutter/material.dart';
import 'dart:math';

class Tabung extends StatefulWidget {
  const Tabung({super.key});

  @override
  State<Tabung> createState() => _TabungState();
}

class _TabungState extends State<Tabung> {
  double radius = 0.0;
  double tinggi = 0.0;
  double volume = 0.0;
  double keliling = 0.0;
  String valid = "";

  void hitungTabung() {
    if (radius > 0 && tinggi > 0) {
      setState(() {
        volume = pi * pow(radius, 2) * tinggi;
        keliling = 2 * pi * radius;
        valid = "";
      });
    } else {
      setState(() {
        volume = 0;
        keliling = 0;
        valid = "Masukkan angka yang valid!";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent,
        title: const Text(
          'Volume & Keliling Tabung',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          elevation: 5,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  "Masukkan ukuran tabung",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                _buildTextField("Jari-jari Alas", (value) {
                  radius = double.tryParse(value) ?? 0;
                  hitungTabung();
                }),
                const SizedBox(height: 10),
                _buildTextField("Tinggi Tabung", (value) {
                  tinggi = double.tryParse(value) ?? 0;
                  hitungTabung();
                }),
                const SizedBox(height: 20),
                Text(
                  'Volume: ${volume.toStringAsFixed(2)}',
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.blue),
                ),
                Text(
                  'Keliling: ${keliling.toStringAsFixed(2)}',
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.blue),
                ),
                if (valid.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Text(
                      valid,
                      style: const TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String label, Function(String) onChanged) {
    return TextFormField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(),
        prefixIcon: const Icon(Icons.straighten),
      ),
      onChanged: onChanged,
    );
  }
}
