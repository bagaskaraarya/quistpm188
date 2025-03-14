import 'package:flutter/material.dart';

class LayangLayang extends StatefulWidget {
  @override
  State<LayangLayang> createState() => _LayangLayangState();
}

class _LayangLayangState extends State<LayangLayang> {
  double diagonal1 = 0.0;
  double diagonal2 = 0.0;
  double sisiA = 0.0;
  double sisiB = 0.0;
  double luas = 0.0;
  double keliling = 0.0;
  String errorMessage = "";

  void hitungLayangLayang() {
    if (diagonal1 > 0 && diagonal2 > 0 && sisiA > 0 && sisiB > 0) {
      setState(() {
        luas = 0.5 * diagonal1 * diagonal2;
        keliling = 2 * (sisiA + sisiB);
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
          'Luas & Keliling Layang-Layang',
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
                  "Masukkan ukuran layang-layang",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                _buildTextField("Diagonal 1", (value) {
                  diagonal1 = double.tryParse(value) ?? 0;
                  hitungLayangLayang();
                }),
                const SizedBox(height: 10),
                _buildTextField("Diagonal 2", (value) {
                  diagonal2 = double.tryParse(value) ?? 0;
                  hitungLayangLayang();
                }),
                const SizedBox(height: 10),
                _buildTextField("Sisi A", (value) {
                  sisiA = double.tryParse(value) ?? 0;
                  hitungLayangLayang();
                }),
                const SizedBox(height: 10),
                _buildTextField("Sisi B", (value) {
                  sisiB = double.tryParse(value) ?? 0;
                  hitungLayangLayang();
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
