import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Latihan Layout',
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color.fromARGB(255, 255, 255, 255),
      ),
      home: const LatihanLayoutPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class LatihanLayoutPage extends StatelessWidget {
  const LatihanLayoutPage({super.key});

  // Helper widget untuk membuat item navigasi agar tidak duplikasi kode
  Widget _buildBottomNavItem({required IconData icon, required String label}) {
    return Column(
      mainAxisSize: MainAxisSize
          .min, // Penting agar Column tidak memakan banyak ruang vertikal
      children: [
        Icon(icon, color: Colors.white, size: 30),
        const SizedBox(height: 8),
        Text(label, style: const TextStyle(color: Colors.white)),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // KONTEN UTAMA HALAMAN
      // Sekarang body hanya berisi judul yang berada di tengah
      body: const Center(
        child: Text(
          'Latihan Layout Column & Row',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 0, 0, 0),
          ),
        ),
      ),

      // ELEMEN YANG MENEMPEL DI BAWAH
      // Kita pindahkan Container biru ke sini
      bottomNavigationBar: Container(
        // Kita tidak perlu lagi BoxDecoration jika hanya untuk warna
        color: const Color(0xFF007BFF),
        // Padding untuk memberikan ruang di atas dan bawah ikon
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 10.0),
        child: Row(
          // Inilah kunci untuk distribusi merata (seperti justify-content: space-evenly)
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildBottomNavItem(icon: Icons.share, label: 'Share'),
            _buildBottomNavItem(icon: Icons.call, label: 'Call'),
            _buildBottomNavItem(icon: Icons.calculate, label: 'Calculator'),
          ],
        ),
      ),
    );
  }
}
