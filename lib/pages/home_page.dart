import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:loginpage/pages/calculate.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

Widget buildGroupData(String name, String nim) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        '$name',
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      SizedBox(
        width: 15,
        height: 10,
      ), // Spasi antara Nama dan NIM
      Text(
        '$nim',
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
    ],
  );
}

class _HomePageState extends State<HomePage> {
  int currentPageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Tugas Mobile"),
        backgroundColor: Colors.black,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.home),
          ),
        ],
      ),
      body: <Widget>[
        Container(
            child: Center(
          child: Card(
            elevation: 0,
            color: Colors.grey,
            child: SizedBox(
              width: 350,
              height: 300,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'TUGAS KELOMPOK',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                    ),
                    SizedBox(height: 20), // Spasi antara teks dan daftar data
                    // Daftar data kelompok nama dan NIM
                    buildGroupData('MOH YUSRIL PRAYOGA', '124210006'),
                    buildGroupData('JEREMY KENNET HARNANTO', '124210007'),
                    buildGroupData('DAFFA ADITYA PRANUGRAHA', '124210021'),
                    // Tambahkan entri baru sesuai kebutuhan
                  ],
                ),
              ),
            ),
          ),
        )),
        Container(
          child: Center(
            child: MyCalculate(),
          ),
        ),
        //logout button
        Container(
          child: Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Logout'),
            ),
          ),
        ),
      ][currentPageIndex],
      bottomNavigationBar: Container(
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
          child: GNav(
              gap: 20,
              backgroundColor: Colors.black,
              color: Colors.white,
              activeColor: Colors.white,
              padding: const EdgeInsets.all(16),
              tabBackgroundColor: Colors.grey.shade800,
              onTabChange: (int index) {
                setState(() {
                  currentPageIndex = index;
                });
              },
              selectedIndex: currentPageIndex,
              tabs: const [
                GButton(
                  icon: Icons.home,
                  text: 'Home',
                ),
                GButton(
                  icon: Icons.calculate,
                  text: 'Calculate',
                ),
                GButton(
                  icon: Icons.settings,
                  text: 'Settings',
                ),
              ]),
        ),
      ),
    );
  }
}
