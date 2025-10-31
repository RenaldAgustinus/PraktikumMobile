import 'package:flutter/material.dart';
// PASTIKAN PATH IMPORT INI BENAR
import 'drawerpage/profile_page.dart'; 
import 'drawerpage/counter_page.dart';

void main() {
  runApp(const RenaldApp());
}

class RenaldApp extends StatelessWidget {
  const RenaldApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Profile & Counter App',
      // Kita tetapkan halaman awal yang sederhana dengan Drawer sebagai Home
      home: Builder(
        builder: (context) => Scaffold(
          appBar: AppBar(
            title: const Text("Home App"), // Judul di halaman awal
            backgroundColor: const Color.fromARGB(255, 34, 126, 246),
            actions: const [
              Icon(Icons.settings),
            ],
          ),
          body: const Center(
            child: Text("Tekan ikon menu di atas kiri untuk navigasi."),
          ),
          drawer: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                const DrawerHeader(
                  decoration: BoxDecoration(color: Colors.blue),
                  child: Text(
                    'Drawer Header',
                    style: TextStyle(color: Colors.white, fontSize: 24),
                  ),
                ),
                // Navigasi ke ProfilePage
                ListTile(
                  leading: const Icon(Icons.account_circle),
                  title: const Text("Profile"),
                  onTap: () {
                    Navigator.pop(context); // Tutup drawer
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ProfilePage(), // Pindah ke ProfilePage
                      ),
                    );
                  },
                ),
                // Navigasi ke CounterPage
                ListTile(
                  leading: const Icon(Icons.onetwothree),
                  title: const Text("Counter"),
                  onTap: () {
                    Navigator.pop(context); // Tutup drawer
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CounterPage(), // Pindah ke CounterPage
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}