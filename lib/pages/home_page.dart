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
        DataTable(
          columns: <DataColumn>[
            DataColumn(label: Text("No")),
            DataColumn(label: Text("Nama")),
            DataColumn(label: Text("Nim")),
          ],
          rows: <DataRow>[
            DataRow(
              cells: <DataCell>[
                DataCell(Text("1")),
                DataCell(Text("Moh Yusril Prayoga")),
                DataCell(Text("124210006")),
              ],
            ),
            DataRow(
              cells: <DataCell>[
                DataCell(Text("2")),
                DataCell(Text("Jeremy Kenneth Harnanto")),
                DataCell(Text("124210007")),
              ],
            ),
            DataRow(
              cells: <DataCell>[
                DataCell(Text("3")),
                DataCell(Text("Daffa Aditya Pranugraha")),
                DataCell(Text("124210021")),
              ],
            ),
          ],
        ),
        Container(
          child: Center(
            child: MyApp(),
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
