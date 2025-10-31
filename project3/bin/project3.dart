import 'package:project3/project3.dart' as project3;

void main(List<String> arguments) {
  //print('Hello world: ${project3.calculate()}!');

  //Daftar Mahasiswa 

  // Membuat growable list untuk menyimpan nama mahasiswa
  List<String> daftarMahasiswa = [];

  // Menambahkan nama-nama mahasiswa ke dalam list
  daftarMahasiswa.add('Renald');
  daftarMahasiswa.add('Dzulfikar');
  daftarMahasiswa.add('Bagas');
  daftarMahasiswa.add('Sufyan');

  // Menampilkan semua nama mahasiswa
  print('Daftar Nama Mahasiswa:');
  for (var nama in daftarMahasiswa) {
    print('- $nama');
  }

  // Menampilkan jumlah total mahasiswa
  print('\nJumlah total mahasiswa: ${daftarMahasiswa.length}');

  //Union & Intersection 

  // Membuat dua set yang berisi data string
  Set<String> set1 = {'Apel', 'Jeruk', 'Mangga', 'Anggur'};
  Set<String> set2 = {'Jeruk', 'Nanas', 'Apel', 'Durian'};

  // Menghitung union (gabungan) dari dua set
  Set<String> unionSet = set1.union(set2);
  print('Union dari dua set: $unionSet');

  // Menghitung intersection (irisan) dari dua set
  Set<String> intersectionSet = set1.intersection(set2);
  print('Intersection dari dua set: $intersectionSet');

  //Data Barang dengan Map

  // Menggunakan Map untuk menyimpan data barang
  // Key: kode barang, Value: Map dengan nama dan harga
  Map<String, Map<String, dynamic>> daftarBarang = {};

  // Menambahkan minimal 3 data barang
  daftarBarang['BRG001'] = {'nama': 'Laptop', 'harga': 12000000};
  daftarBarang['BRG002'] = {'nama': 'Mouse', 'harga': 250000};
  daftarBarang['BRG003'] = {'nama': 'Keyboard', 'harga': 500000};

  // Menampilkan semua data barang
  print('Daftar Data Barang:');
  daftarBarang.forEach((kode, data) {
    print('--------------------------');
    print('Kode  : $kode');
    print('Nama  : ${data['nama']}');
    print('Harga : Rp${data['harga']}');
  });

//Function Closure untuk Diskon Bertingkat

  // Function closure untuk membuat penghitung diskon
Function buatPenghitungDiskon() {
  double diskonSaatIni = 0.0; // Variabel yang akan "diingat" oleh closure

  // Mengembalikan sebuah fungsi anonim
  return (double hargaAwal) {
    diskonSaatIni += 0.05; // Diskon bertambah 5% setiap kali dipanggil
    if (diskonSaatIni > 1.0) {
      diskonSaatIni = 1.0; // Maksimum diskon adalah 100%
    }
    double hargaSetelahDiskon = hargaAwal * (1 - diskonSaatIni);
    return {
      'diskon': diskonSaatIni * 100,
      'hargaAkhir': hargaSetelahDiskon
    };
  };
}

  // Membuat instance dari penghitung diskon
  var hitungDiskon = buatPenghitungDiskon();

  double hargaProduk = 100000.0;

  // Memanggil fungsi hitungDiskon beberapa kali
  var hasil1 = hitungDiskon(hargaProduk);
  print('Panggilan ke-1: Diskon ${hasil1['diskon']}%,'
      ' harga akhir: ${hasil1['hargaAkhir']}');

  var hasil2 = hitungDiskon(hargaProduk);
  print('Panggilan ke-2: Diskon ${hasil2['diskon']}%,'
      ' harga akhir: ${hasil2['hargaAkhir']}');

  var hasil3 = hitungDiskon(hargaProduk);
  print('Panggilan ke-3: Diskon ${hasil3['diskon']}%,'
      ' harga akhir: ${hasil3['hargaAkhir']}');
}

