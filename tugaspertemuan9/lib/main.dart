import 'dart:async';
import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

// 👇 TAMBAH: Untuk menyimpan file ke direktori lokal
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' show join;


// Deklarasi Global Kamera
late List<CameraDescription> _cameras;

Future<void> main() async {
  // Pastikan binding Flutter sudah terinisialisasi
  WidgetsFlutterBinding.ensureInitialized();

  // Ambil daftar kamera yang tersedia
  try {
    _cameras = await availableCameras();
  } on CameraException catch (e) {
    // ignore: avoid_print
    print('Error accessing cameras: ${e.code} - ${e.description}');
  }
  
  runApp(const CameraApp());
}

/// CameraApp is the Main Application.
class CameraApp extends StatelessWidget {
  /// Default Constructor
  const CameraApp({super.key});

  @override
  Widget build(BuildContext context) {
    // 1. Implementasi Material Design (Sudah tercakup dengan MaterialApp dan Scaffold di CameraScreen)
    return const MaterialApp(
      title: 'Tugas Kamera Flutter',
      home: CameraScreen(),
    );
  }
}

class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key});

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  // Controller Kamera. Pastikan _cameras tidak kosong
  late CameraController controller;
  // Index untuk kamera saat ini
  int selectedCameraIndex = 0;
  // Variabel untuk menyimpan path foto yang baru diambil
  String? lastImagePath;

  @override
  void initState() {
    super.initState();
    // Inisialisasi controller dengan kamera pertama secara default
    if (_cameras.isNotEmpty) {
      _initializeCameraController(_cameras[selectedCameraIndex]);
    }
  }

  // Fungsi untuk inisialisasi dan re-inisialisasi controller kamera
  Future<void> _initializeCameraController(CameraDescription cameraDescription) async {
    // Hapus controller yang lama jika ada
    if (mounted && controller.value.isInitialized) {
      await controller.dispose();
    }

    controller = CameraController(
      cameraDescription, 
      ResolutionPreset.medium,
      imageFormatGroup: ImageFormatGroup.jpeg,
    );

    try {
      await controller.initialize();
    } on CameraException catch (e) {
      // ignore: avoid_print
      print('Camera error: ${e.code}');
      // Tampilkan error di Snackbar jika perlu
      return; 
    }

    if (mounted) {
      setState(() {});
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  // Helper untuk menampilkan notifikasi
  void showInSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  // 3. Tambah fitur untuk berpindah antara kamera depan dan belakang
  void onSwitchCameraPressed() {
    if (_cameras.length > 1) {
      // Ubah index kamera
      selectedCameraIndex = (selectedCameraIndex + 1) % _cameras.length;
      
      // Inisialisasi ulang controller dengan kamera yang baru
      _initializeCameraController(_cameras[selectedCameraIndex]);
      
      showInSnackBar(
        'Beralih ke Kamera ${controller.description.lensDirection == CameraLensDirection.front ? "Depan" : "Belakang"}',
      );
    } else {
       showInSnackBar('Hanya ada satu kamera tersedia.');
    }
  }

  // 2. Mengambil gambar & 5. Simpan hasil foto ke direktori lokal (path_provider)
  Future<void> onTakePictureButtonPressed() async {
    if (!controller.value.isInitialized || controller.value.isTakingPicture) {
      return;
    }

    try {
      // 1. Ambil foto. File sementara disimpan di cache
      final XFile rawFile = await controller.takePicture();

      // 2. Tentukan direktori penyimpanan permanen menggunakan path_provider
      final Directory appDocDir = await getApplicationDocumentsDirectory();
      
      // Buat path permanen untuk penyimpanan
      final String timestamp = DateTime.now().millisecondsSinceEpoch.toString();
      final String newPath = join(appDocDir.path, 'CapturedImages', 'IMG_$timestamp.jpg');
      
      // Pastikan direktori tujuan ada
      final Directory saveDir = Directory(join(appDocDir.path, 'CapturedImages'));
      if (!await saveDir.exists()) {
        await saveDir.create(recursive: true);
      }

      // 3. Pindahkan/salin file dari cache ke path permanen
      await File(rawFile.path).copy(newPath);

      if (mounted) {
        setState(() {
          lastImagePath = newPath;
        });
        
        // 4. Tampilkan hasil path file foto di Snackbar
        showInSnackBar('Foto disimpan di: $newPath');
      }

    } on CameraException catch (e) {
      // ignore: avoid_print
      print('Error taking picture: ${e.code}');
      showInSnackBar('Gagal mengambil foto: ${e.code}');
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!controller.value.isInitialized) {
      // Tampilkan indikator loading jika controller belum siap
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }
    
    // 2. Tampilkan preview kamera
    return Scaffold(
      appBar: AppBar(
        title: const Text('Aplikasi Kamera'),
        backgroundColor: Colors.green,
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          // Camera Preview
          CameraPreview(controller),

          // Control Bar
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                // Tombol Beralih Kamera (Poin 3)
                FloatingActionButton(
                  heroTag: 'switch',
                  onPressed: onSwitchCameraPressed,
                  backgroundColor: Colors.white70,
                  child: const Icon(Icons.flip_camera_ios, color: Colors.black),
                ),

                // Tombol Ambil Foto (Poin 2)
                FloatingActionButton(
                  heroTag: 'capture',
                  onPressed: onTakePictureButtonPressed,
                  backgroundColor: Colors.white,
                  child: const Icon(Icons.camera, color: Colors.black),
                ),

                // Tampilkan Path Foto di Layar (Poin 4 - Alternatif)
                SizedBox(
                  width: 100,
                  child: SingleChildScrollView(
                    child: Text(
                      lastImagePath != null ? 'Path: ${lastImagePath!.split('/').last}' : 'Belum Ambil Foto',
                      style: const TextStyle(color: Colors.white, fontSize: 10),
                      textAlign: TextAlign.right,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}