import 'package:flutter/material.dart';
import 'hari.dart';
import 'jajargenjang.dart';
import 'limassegiempat.dart';
import 'datadiri.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent,
        title: const Text('Menu', style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Kuis Teknologi Pemrograman Mobile',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            _buildMenuButton(context, 'Hitung Jajar Genjang', JajarGenjang()),
            _buildMenuButton(context, 'Hitung Limas Segi Empat', LimasSegiEmpat()),
            _buildMenuButton(context, 'Hitung Hari', Hari()),
            _buildMenuButton(context, 'Data Diri', DataDiri()),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuButton(BuildContext context, String title, Widget page) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        title: Text(title, textAlign: TextAlign.center, style: const TextStyle(fontWeight: FontWeight.bold)),
        tileColor: Colors.greenAccent.shade100,
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        ),
      ),
    );
  }
}
