import 'package:flutter/material.dart';
import 'datapusat_page.dart';
import 'dataregional_page.dart'; // Import Data Regional page
import 'datacabang_page.dart';
import 'datasektor_page.dart';
import 'dataanggota_page.dart';
import 'datajabatan_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Admin HomePage',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: {
        '/': (context) => HomePage(),
        '/profile': (context) => ProfilePage(),
      },
      initialRoute: '/',
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Widget _buildCard(String cardText, Color color, int count, IconData icon) {
    return Card(
      elevation: 5.0,
      color: color,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 50,
              color: Colors.white,
            ),
            SizedBox(height: 10.0),
            Text(
              cardText,
              style: TextStyle(fontSize: 18.0, color: Colors.white),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10.0),
            Text(
              count.toString(),
              style: TextStyle(fontSize: 24.0, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Row(
          children: [
            IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {
                showMenu(
                  context: context,
                  position: RelativeRect.fromLTRB(
                      0, AppBar().preferredSize.height, 0, 0),
                  items: <PopupMenuEntry>[
                    PopupMenuItem(
                      child: Text('Data Pusat'),
                      value: '/dataPusat',
                    ),
                    PopupMenuItem(
                      child: Text('Data Regional'),
                      value: '/dataRegional',
                    ),
                    PopupMenuItem(
                      child: Text('Data Sektor'),
                      value: '/dataSektor',
                    ),
                    PopupMenuItem(
                      child: Text('Data Cabang'),
                      value: '/dataCabang',
                    ),
                    PopupMenuItem(
                      child: Text('Data Anggota'),
                      value: '/dataAnggota',
                    ),
                    PopupMenuItem(
                      child: Text('Data Jabatan'),
                      value: '/dataJabatan',
                    ),
                    PopupMenuItem(
                      child: Text('Data Pejabat Struktural'),
                      value: '/dataPejabatStruktural',
                    ),
                    PopupMenuItem(
                      child: Text('Data Bidang'),
                      value: '/dataBidang',
                    ),
                  ],
                  elevation: 8.0,
                ).then((value) {
                  if (value != null) {
                    print('Selected action: $value');
                    if (value == '/dataPusat') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DataPusatPage()),
                      );
                    } else if (value == '/dataRegional') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DataRegionalPage()),
                      );
                    } else if (value == '/dataSektor') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DataSektorPage()),
                      );
                    } else if (value == '/dataCabang') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DataCabangPage()),
                      );
                    } else if (value == '/dataAnggota') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DataAnggotaPage()),
                      );
                    } else if (value == '/dataJabatan') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DataJabatanPage()),
                      );
                    }
                  }
                });
              },
            ),
            Spacer(),
            Text(
              'Administrator',
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
            Spacer(),
            IconButton(
              icon: Icon(Icons.account_circle),
              onPressed: () {
                Navigator.pushNamed(context, '/profile');
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: 'Settings'),
          BottomNavigationBarItem(
              icon: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/profile');
                },
                child: Icon(Icons.account_circle),
              ),
              label: 'Profile'),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16.0, 0, 16.0, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 24.0),
            Align(
              alignment: Alignment.center,
              child: Text(
                'Data Administrasi PPTSB',
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 20.0),
            GridView.count(
              shrinkWrap: true,
              crossAxisCount: 2,
              childAspectRatio:
                  1.0, // Set aspect ratio to maintain square cells
              children: [
                _buildCard('Data Regional', Colors.red, 10, Icons.business),
                _buildCard('Data Cabang', Colors.blue, 20, Icons.location_city),
                _buildCard('Data Sektor', Colors.green, 15, Icons.work),
                _buildCard('Data Anggota', Colors.orange, 12, Icons.store),
              ],
            ),
            SizedBox(height: 20.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DataTable(
                  columnSpacing: 20.0,
                  horizontalMargin: 10.0,
                  dataRowHeight: 40.0,
                  columns: [
                    DataColumn(label: SizedBox(width: 30.0, child: Text('No'))),
                    DataColumn(
                        label: SizedBox(width: 150.0, child: Text('Nama'))),
                    DataColumn(
                        label: SizedBox(width: 150.0, child: Text('Sektor'))),
                  ],
                  rows: [
                    DataRow(cells: [
                      DataCell(Text('1', textAlign: TextAlign.center)),
                      DataCell(
                          Text('Yulanda Pasaribu', textAlign: TextAlign.left)),
                      DataCell(Text('Sektor A', textAlign: TextAlign.left)),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('2', textAlign: TextAlign.center)),
                      DataCell(
                          Text('Vlen Simanjuntak', textAlign: TextAlign.left)),
                      DataCell(Text('Sektor B', textAlign: TextAlign.left)),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('3', textAlign: TextAlign.center)),
                      DataCell(
                          Text('Juan Sihombing', textAlign: TextAlign.left)),
                      DataCell(Text('Sektor B', textAlign: TextAlign.left)),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('4', textAlign: TextAlign.center)),
                      DataCell(Text('Arta Sitorus', textAlign: TextAlign.left)),
                      DataCell(Text('Sektor B', textAlign: TextAlign.left)),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('5', textAlign: TextAlign.center)),
                      DataCell(
                          Text('Erichson Berutu', textAlign: TextAlign.left)),
                      DataCell(Text('Sektor B', textAlign: TextAlign.left)),
                    ]),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Center(
        child: Text('Profile Page'),
      ),
    );
  }
}
