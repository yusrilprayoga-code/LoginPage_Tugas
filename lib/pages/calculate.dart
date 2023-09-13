import 'package:flutter/material.dart';

class MyCalculate extends StatefulWidget {
  const MyCalculate({super.key});

  @override
  State<MyCalculate> createState() => _MyCalculateState();
}

class _MyCalculateState extends State<MyCalculate> {
  Widget calcButton(String btntxt, Color btncolor, Color txtcolor) {
    return Container(
        child: ElevatedButton(
      onPressed: () {
        calculation(btntxt);
      },
      child: Text(
        btntxt,
        style: TextStyle(
          fontSize: 25,
          color: txtcolor,
        ),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: btncolor,
        shape: CircleBorder(),
        padding: EdgeInsets.all(20),
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      text,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 100,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                //here button function will be called
                calcButton("AC", Colors.grey, Colors.black54),
                calcButton("+/-", Colors.grey, Colors.black54),
                calcButton("%", Colors.grey, Colors.black54),
                calcButton("/", Colors.amber.shade700, Colors.white)
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                //here button function will be called
                calcButton("7", Colors.grey.shade800, Colors.white),
                calcButton("8", Colors.grey.shade800, Colors.white),
                calcButton("9", Colors.grey.shade800, Colors.white),
                calcButton("x", Colors.amber.shade700, Colors.white)
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                //here button function will be called
                calcButton("4", Colors.grey.shade800, Colors.white),
                calcButton("5", Colors.grey.shade800, Colors.white),
                calcButton("6", Colors.grey.shade800, Colors.white),
                calcButton("-", Colors.amber.shade700, Colors.white)
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                //here button function will be called
                calcButton("1", Colors.grey.shade800, Colors.white),
                calcButton("2", Colors.grey.shade800, Colors.white),
                calcButton("3", Colors.grey.shade800, Colors.white),
                calcButton("+", Colors.amber.shade700, Colors.white)
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    "0",
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.black,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.fromLTRB(34, 20, 120, 20),
                    shape: StadiumBorder(),
                    primary: Colors.grey,
                  ),
                ),
                calcButton(".", Colors.grey.shade800, Colors.white),
                calcButton("=", Colors.amber.shade700, Colors.white)
              ],
            )
          ],
        ),
      ),
    );
  }

  //CALCULATOR LOGIC HERE
  dynamic text = '0';
  double numOne = 0;
  double numTwo = 0;

  dynamic result = '';
  dynamic finalResult = '';
  dynamic opr = '';
  dynamic preOpr = '';
  void calculation(btnText) {
    if (btnText == 'AC') {
      text = '0';
      numOne = 0;
      numTwo = 0;
      result = '';
      finalResult = '0';
      opr = '';
      preOpr = '';
    } else if (opr == '=' && btnText == '=') {
      if (preOpr == '+') {
        finalResult = add();
      } else if (preOpr == '-') {
        finalResult = sub();
      } else if (preOpr == 'x') {
        finalResult = mul();
      } else if (preOpr == '/') {
        finalResult = div();
      }
    } else if (btnText == '+' ||
        btnText == '-' ||
        btnText == 'x' ||
        btnText == '/' ||
        btnText == '=') {
      if (numOne == 0) {
        numOne = double.parse(result);
      } else {
        numTwo = double.parse(result);
      }

      if (opr == '+') {
        finalResult = add();
      } else if (opr == '-') {
        finalResult = sub();
      } else if (opr == 'x') {
        finalResult = mul();
      } else if (opr == '/') {
        finalResult = div();
      }
      preOpr = opr;
      opr = btnText;
      result = '';
    } else if (btnText == '%') {
      result = numOne / 100;
      finalResult = doesContainDecimal(result);
    } else if (btnText == '.') {
      if (!result.toString().contains('.')) {
        result = result.toString() + '.';
      }
      finalResult = result;
    } else if (btnText == '+/-') {
      result.toString().startsWith('-')
          ? result = result.toString().substring(1)
          : result = '-' + result.toString();
      finalResult = result;
    } else {
      result = result + btnText;
      finalResult = result;
    }

    setState(() {
      text = finalResult;
    });
  }

  String add() {
    result = (numOne + numTwo).toString();
    numOne = double.parse(result);
    return doesContainDecimal(result);
  }

  String sub() {
    result = (numOne - numTwo).toString();
    numOne = double.parse(result);
    return doesContainDecimal(result);
  }

  String mul() {
    result = (numOne * numTwo).toString();
    numOne = double.parse(result);
    return doesContainDecimal(result);
  }

  String div() {
    result = (numOne / numTwo).toString();
    numOne = double.parse(result);
    return doesContainDecimal(result);
  }

  String doesContainDecimal(dynamic result) {
    if (result.toString().contains('.')) {
      List<String> splitDecimal = result.toString().split('.');
      if (!(int.parse(splitDecimal[1]) > 0))
        return result = splitDecimal[0].toString();
    }
    return result;
  }
}
