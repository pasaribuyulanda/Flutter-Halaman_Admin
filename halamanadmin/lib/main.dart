import 'package:flutter/material.dart';
import 'package:halamanadmin/pages/home_page.dart';
import 'package:halamanadmin/pages/datapusat_page.dart';
import 'package:halamanadmin/pages/tambah_cabang_page.dart'; // Import halaman TambahCabangPage

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Your App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/': (context) => HomePage(),
        '/dataPusat': (context) => DataPusatPage(),
        '/tambahCabang': (context) =>
            TambahCabangPage(), // Tambahkan rute untuk halaman TambahCabangPage
      },
      initialRoute: '/',
    );
  }
}
