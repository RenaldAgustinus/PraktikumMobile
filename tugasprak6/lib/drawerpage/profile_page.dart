import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  // Helper Widget untuk Baris Informasi (Ditempatkan di dalam kelas)
  Widget _buildInfoText(String label, String value, {bool isTitle = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            width: 100,
            child: Text(
              "$label:",
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Colors.black54,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: TextStyle(
                fontSize: isTitle ? 20 : 16,
                fontWeight: isTitle ? FontWeight.w900 : FontWeight.normal,
                color: isTitle ? Colors.indigo : Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Helper Widget untuk Baris Kontak
  Widget _buildContactRow(IconData icon, String label, String value) {
    return Row(
      children: <Widget>[
        Icon(icon, color: Colors.indigo, size: 24),
        const SizedBox(width: 15),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              label,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.black54,
              ),
            ),
            Text(
              value,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    // Data dummy Anda
    const String nama = "Renald Agustinus";
    const String nim = "2341760090";
    const String jurusan = "Sistem Informasi Bisnis";
    const String email = "renaldagustinus41@gmail.com";
    const String telepon = "0812-4977-9636";

    // Path gambar yang sudah didaftarkan di pubspec.yaml
    const String profileImagePath = 'assets/images/foto_profil.jpeg'; 

    return Scaffold(
      appBar: AppBar(
        title: const Text("Profil Mahasiswa"),
        backgroundColor: Colors.indigo,
      ),
      body: Container(
        color: Colors.grey[100],
        padding: const EdgeInsets.all(20.0),
        margin: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            // 1. FlutterLogo dan Foto Profil
            Container(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  // const FlutterLogo(size: 80.0),
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.indigo, width: 3),
                    ),
                    child: ClipOval(
                      // *** PERUBAHAN DI SINI: GANTI Placeholder dengan Image.asset ***
                      child: Image.asset(
                        profileImagePath,
                        fit: BoxFit.cover, // Penting agar gambar mengisi lingkaran
                      ),
                      // ***************************************************************
                    ),
                  ),
                ],
              ),
            ),
            const Divider(height: 1, thickness: 1),

            // 2. Info Nama, NIM, dan Jurusan
            const SizedBox(height: 20),
            _buildInfoText("Nama", nama, isTitle: true),
            _buildInfoText("NIM", nim),
            _buildInfoText("Jurusan", jurusan),
            const SizedBox(height: 30),
            const Divider(height: 1, thickness: 1),

            // 3. Icon dan Kontak
            const SizedBox(height: 20),
            _buildContactRow(Icons.email, "Email", email),
            const SizedBox(height: 10),
            _buildContactRow(Icons.phone, "Telepon", telepon),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}