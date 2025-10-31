import 'dart:io';

import 'package:pertemuan4/pertemuan4.dart' as pertemuan4;

void main(List<String> arguments) {
  // print('Hello world: ${pertemuan4.calculate()}!');

//   var fl = List<int>.filled(4,0);

//   fl[0] = 1;
//   fl[1] = 2;
//   fl[2] = 3;
//   fl[3] = 4;
//   fl[4] = 5;

//   cetak
//   stdout.writeln(fl);

//   var gl = [1,2,3];
//   gl.add(23);

//   gl.remove(23);
//   stdout.writeln(gl);

// var setnilai1 = <int>{1,2,3,4};
// var setnilai2 = {3,3,4,5}; 

// print (setnilai2);
// print (setnilai1.union(setnilai2));
// print(setnilai1.intersection(setnilai2));

//Buat
// var setnilai1 = <int>{};
// var setnilai2 = <int>{1,2,3};
// stdout.writeln("jumlah data setNilai1 = ");
// String? input1 = stdin.readLineSync();
// int jumlah1 = (int.tryParse(input1 ?? ''))?? 0;
// for(var i = 0; i < jumlah1; i++) {
//   stdout.writeln("Masukkan nilai ke -${i + 1} = ");
//   String? inputNilai = stdin.readLineSync();
//   int nilai = (int.tryParse(inputNilai ?? ''))?? 0;
//   setnilai1.add(nilai);
// }
// print(setnilai1);

//Buat String
// var setnilai1 = <String>{};
// stdout.writeln("jumlah data setNilai1 = ");
// String? input1 = stdin.readLineSync();
// int jumlah1 = (int.tryParse(input1 ?? ''))?? 0;
// for(var i = 0; i < jumlah1; i++) {
//   stdout.writeln("Masukkan nilai ke -${i + 1} = ");
//   String? inputNilai = stdin.readLineSync();
//   String nilai = inputNilai ?? '';
//   setnilai1.add(nilai);
// }
// print(setnilai1);

// var setnilai1 = <String>{};
// stdout.writeln("jumlah data setNilai1 = ");
// String? input1 = stdin.readLineSync();
// int jumlah1 = (int.tryParse(input1 ?? ''))?? 0;
// for(var i = 0; i < jumlah1; i++) {
//   stdout.writeln("Masukkan nilai ke -${i + 1} = ");
//   String? inputNilai = stdin.readLineSync();
//   String nilai = inputNilai ?? '';
//   setnilai1.add(nilai);
// }
// var NilaiList = setnilai1.toList();
// print(NilaiList[1]);

//MAP
// var sudah = {"nim":"101","nama":"Renald","umur":20};
// print(sudah);
// print(sudah["nama"]);

var opo = {
  'nim' : ['102','103'],
  'nama': ["renald","rizky"],
  'umur': [20,21]
};
print(opo);
print(opo['nama']![1]);
}
