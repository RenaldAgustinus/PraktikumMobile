import 'package:flutter/material.dart';

void main() {
  runApp(RenaldApp());
}

class RenaldApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Lirik Lagu Domination by Pantera",
      home: Scaffold( //Struktur halaman dasar
        backgroundColor: Colors.white, 
        appBar: AppBar(
          title: Text(
            "Domination", //Judul yang ditampilkan di AppBar
            style: TextStyle( // Styling untuk teks judul
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: const Color.fromARGB(255, 9, 0, 0),
              fontFamily: 'Roboto', 
            ),
          ),
          backgroundColor: Color.fromARGB(255, 188, 158, 67),
          centerTitle: true,
          foregroundColor: Colors.white,
        ),
        
       // --- KONTEN LIRIK (BODY) ---
        body: SingleChildScrollView( // Widget yang memungkinkan konten di dalamnya digulir
          child: Center( // Memusatkan konten secara horizontal dan vertikal di dalam body
            child: Padding(
              // Padding horizontal yang wajar
              padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0), // Memberikan padding di sekitar lirik
              child: Container( // Wadah untuk mengatur batasan lebar lirik
                // Mengatur lebar maksimum kolom lirik menjadi lebih sempit (400px)
                constraints: BoxConstraints(maxWidth: 400), // Memastikan lirik tidak terlalu lebar di layar besar
                child: Column( // Widget yang mengatur konten secara vertikal
                  mainAxisAlignment: MainAxisAlignment.center, // Pusatkan konten utama Column
                  // Mengatur semua widget di dalam Container agar RATA KANAN (end)
                  crossAxisAlignment: CrossAxisAlignment.end, // Meratakan semua widget anak di Column ke sisi kanan
                  children: [
                    // --- SATU BLOK LIRIK LENGKAP ---
                    Text( // Widget untuk menampilkan seluruh lirik
                      """
[Intro]
First take, like a motherf*cker

[Verse 1]
Agony is the price that you'll pay in the end
Domination consumes you then calls you a friend
It's a twisted fall
Binds are like steel and manipulates the will to be
And it's hard to see how soon we forget
When there's nothing else left to destroy
It's a useless ploy

[Pre-Chorus]
Your eyes will see the dawn of the day
And the writing on the wall
Those words that stare into your soul
And to yourself, you will befall

[Chorus]
It's domination
Pushed into living hell
Domination, yeah

[Verse 2]
A now blacked heart is reaching out in divinity
Bodies suspended by chains over razors and nails
It's a penalty
Each razor, a vice and each nail marks demise of your life
Grim construction grows
Has life played a trick, sealed you in brick by brick till your end?
Forcing you to bend

[Pre-Chorus]
Your eyes will see the dawn of the day
And the writing on the wall
Those words that stare into your soul
And to yourself, you will befall

[Chorus]
It's domination
Pushed into living hell
Oh, domination
Oh ha ha ha ha ha""",
                      textAlign: TextAlign.right, // Perataan RATA KANAN untuk baris teks
                      style: TextStyle(
                        fontSize: 16, 
                        color: Colors.black, 
                        fontFamily: 'Arial',
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
