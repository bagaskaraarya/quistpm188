import 'package:flutter/material.dart';

class LimasSegiEmpat extends StatefulWidget {
  const LimasSegiEmpat({super.key});

  @override
  State<LimasSegiEmpat> createState() => _LimasSegiEmpatState();
}

class _LimasSegiEmpatState extends State<LimasSegiEmpat> {
  double sisiMiring = 0.0;
  double sisiAlas = 0.0;
  double volume = 0.0;
  double keliling = 0.0;
  String valid = "";

  void hitungLimas() {
    if (sisiMiring > 0 && sisiAlas > 0) {
      setState(() {
        volume = (1 / 3) * sisiMiring * (sisiAlas * sisiAlas);
        keliling = 4 * (sisiMiring + sisiAlas);
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
          'Volume & Keliling Limas',
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
                  "Masukkan panjang sisi",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                _buildTextField("Panjang Sisi Miring", (value) {
                  sisiMiring = double.tryParse(value) ?? 0;
                  hitungLimas();
                }),
                const SizedBox(height: 10),
                _buildTextField("Panjang Sisi Alas", (value) {
                  sisiAlas = double.tryParse(value) ?? 0;
                  hitungLimas();
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
