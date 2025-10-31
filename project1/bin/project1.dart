import 'dart:io';

import 'package:project1/project1.dart' as project1;

const String nama = 'Renald';
void main(List<String> arguments) {
  // print('Hello world: ${project1.calculate()}!');
  //satu line comment
  /*
  multi line comment
  banyak line comment
   */
  //constanta dan final
  final String nama2 = 'Agustinus';
  print("Nama saya $nama $nama2");
  // variabel
  int umur = 20;
  double tinggi = 170;
  bool jenis_kelamin = false; //true = laki-laki, false = perempuan
  String alamat = 'Jl. ikan tombro barat No. 49';
  stdout.writeln("Umur saya $umur tahun");
  stdout.writeln("Tinggi saya $tinggi cm");
  stdout.writeln(
    "Jenis kelamin saya ${jenis_kelamin ? 'Laki-laki' : 'Perempuan'}",
  );
  // if (jenis_kelamin==true) {
  //   stdout.writeln("Jenis kelamin saya Laki-laki");
  // } else {
  //   stdout.writeln("Jenis kelamin saya Perempuan");
  // }
  stdout.writeln("Alamat saya $alamat");
  num nilai = 90.5; //bisa diisi int atau double
  stdout.writeln("Nilai saya $nilai");
  dynamic bebas = "16";
  stdout.writeln("Nilai dari dynamic adalah $bebas");
  // String angka1 = "15";
  // int angka2 = int.parse(angka1);
  // int angka3 = bebas;
  // list
  List<String> hobby = ["Renang", "Tidur", "Bersepeda"];
  hobby.add("Makan");
  stdout.writeln("Hobby saya adalah $hobby");
  Map<String, String> data = {
    "nama": "Renald",
    "alamat": "Malang",
    "jenis_kelamin": "Laki laki",
  };
  data["pekerjaan"] = "Dosen";
  data.addAll({"hobi": "Membaca"});

  stdout.writeln("Data : $data");
  stdout.writeln("Nama yg ada di data ${data['nama']}");

  try {
    // Code that might throw an exception
    int result = 10 ~/ 0; // This will throw an IntegerDivisionByZeroException
  } on IntegerDivisionByZeroException {
    // Handles the specific IntegerDivisionByZeroException
    print("Cannot divide by zero!");
  } catch (e) {
    // Handles any other type of exception and provides the exception object
    print("An unexpected error occurred: $e");
  } finally {
    // Code that always executes, regardless of whether an exception occurred
    print("Exeution complete.");
  }
}