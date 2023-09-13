import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: AddTwoNumbers(),
      ),
    );
  }
}

class AddTwoNumbers extends StatefulWidget {
  @override
  _AddTwoNumbersState createState() => _AddTwoNumbersState();
}

class _AddTwoNumbersState extends State<AddTwoNumbers> {
  TextEditingController num1controller = new TextEditingController();
  TextEditingController num2controller = new TextEditingController();
  String resulttext = "0";
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Text("Number 1 : "),
                new Flexible(
                  child: new TextField(
                    keyboardType: TextInputType.number,
                    controller: num1controller,
                  ),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Text("Number 2 : "),
                new Flexible(
                  child: new TextField(
                    keyboardType: TextInputType.number,
                    controller: num2controller,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  child: Text("+"),
                  onPressed: () {
                    setState(() {
                      int result = int.parse(num1controller.text) +
                          int.parse(num2controller.text);
                      resulttext = result.toString();
                    });
                  },
                ),
                const SizedBox(
                  width: 20,
                ),
                ElevatedButton(
                  child: Text("-"),
                  onPressed: () {
                    setState(() {
                      int result = int.parse(num1controller.text) -
                          int.parse(num2controller.text);
                      resulttext = result.toString();
                    });
                  },
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Result : ",
                  style: TextStyle(
                    fontSize: 25,
                  ),
                ),
                new Text(
                  resulttext,
                  style: TextStyle(
                    fontSize: 25,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
