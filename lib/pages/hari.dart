import 'package:flutter/material.dart';

class Hari extends StatefulWidget {
  const Hari({super.key});

  @override
  State<Hari> createState() => _HariState();
}

class _HariState extends State<Hari> {
  String hasil = "";
  List<String> hari = ["Senin", "Selasa", "Rabu", "Kamis", "Jumat", "Sabtu", "Minggu"];

  void konversiHari(String value) {
    int? parsedValue = int.tryParse(value);
    if (parsedValue == null || parsedValue == 0) {
      setState(() {
        hasil = "Input tidak valid!";
      });
    } else {
      setState(() {
        int index = (parsedValue - 1) % 7; // Jika >7, dihitung ulang dari Senin
        hasil = hari[index];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent,
        title: const Text('Angka → Hari', style: TextStyle(fontWeight: FontWeight.bold)),
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
                  "Masukkan angka (1 - ∞)",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Angka',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.calendar_today),
                  ),
                  onChanged: konversiHari,
                ),
                const SizedBox(height: 20),
                Text(
                  'Hasil Konversi:',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.grey[700]),
                ),
                const SizedBox(height: 5),
                Text(
                  hasil,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: hasil == "Input tidak valid!" ? Colors.red : Colors.green,
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
