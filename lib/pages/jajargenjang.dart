import 'package:flutter/material.dart';

class JajarGenjang extends StatefulWidget {
  @override
  State<JajarGenjang> createState() => _JajarGenjangState();
}

class _JajarGenjangState extends State<JajarGenjang> {
  double sisiSejajar = 0.0;
  double tinggi = 0.0;
  double miring = 0.0;
  double luas = 0.0;
  double keliling = 0.0;
  String errorMessage = "";

  void hitungJajarGenjang() {
    if (sisiSejajar > 0 && tinggi > 0 && miring > 0) {
      setState(() {
        luas = sisiSejajar * tinggi;
        keliling = 2 * (sisiSejajar + miring);
        errorMessage = "";
      });
    } else {
      setState(() {
        luas = 0;
        keliling = 0;
        errorMessage = "Masukkan angka yang valid untuk semua bidang!";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent,
        title: const Text(
          'Luas & Keliling Jajar Genjang',
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
                  "Masukkan ukuran jajar genjang",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                _buildTextField("Sisi Sejajar", (value) {
                  sisiSejajar = double.tryParse(value) ?? 0;
                  hitungJajarGenjang();
                }),
                const SizedBox(height: 10),
                _buildTextField("Tinggi", (value) {
                  tinggi = double.tryParse(value) ?? 0;
                  hitungJajarGenjang();
                }),
                const SizedBox(height: 10),
                _buildTextField("Sisi Miring", (value) {
                  miring = double.tryParse(value) ?? 0;
                  hitungJajarGenjang();
                }),
                const SizedBox(height: 20),
                Text(
                  'Luas: ${luas.toStringAsFixed(2)}',
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.blue),
                ),
                Text(
                  'Keliling: ${keliling.toStringAsFixed(2)}',
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.blue),
                ),
                if (errorMessage.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Text(
                      errorMessage,
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
