import 'package:calculator_app/components/button_component.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class Calculator extends StatefulWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  var userInput = '';
  var answer = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Text(
                        userInput.toString(),
                        style:
                            const TextStyle(fontSize: 30, color: Colors.white),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      answer.toString(),
                      style: const TextStyle(fontSize: 30, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Column(
                children: [
                  Row(
                    children: [
                      Mybutton(
                          title: 'AC',
                          onpress: () {
                            userInput = '';
                            answer = '';
                            setState(() {});
                          }),
                      Mybutton(
                          title: '+/-',
                          onpress: () {
                            userInput += '+/-';
                            setState(() {});
                          }),
                      Mybutton(
                          title: '%',
                          onpress: () {
                            userInput += '%';
                            setState(() {});
                          }),
                      Mybutton(
                        title: '/',
                        onpress: () {
                          userInput += '/';
                          setState(() {});
                        },
                        color: const Color(0xffffa00a),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Mybutton(
                          title: '7',
                          onpress: () {
                            userInput += '7';
                            setState(() {});
                          }),
                      Mybutton(
                          title: '8',
                          onpress: () {
                            userInput += '8';
                            setState(() {});
                          }),
                      Mybutton(
                          title: '9',
                          onpress: () {
                            userInput += '0';
                            setState(() {});
                          }),
                      Mybutton(
                        title: 'x',
                        onpress: () {
                          userInput += 'x';
                          setState(() {});
                        },
                        color: const Color(0xffffa00a),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Mybutton(
                          title: '4',
                          onpress: () {
                            userInput += '4';
                            setState(() {});
                          }),
                      Mybutton(
                          title: '5',
                          onpress: () {
                            userInput += '5';
                            setState(() {});
                          }),
                      Mybutton(
                          title: '6',
                          onpress: () {
                            userInput += '6';
                            setState(() {});
                          }),
                      Mybutton(
                        title: '-',
                        onpress: () {
                          userInput += '-';
                          setState(() {});
                        },
                        color: const Color(0xffffa00a),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Mybutton(
                          title: '1',
                          onpress: () {
                            userInput += '1';
                            setState(() {});
                          }),
                      Mybutton(
                          title: '2',
                          onpress: () {
                            userInput += '2';
                            setState(() {});
                          }),
                      Mybutton(
                          title: '3',
                          onpress: () {
                            userInput += '3';
                            setState(() {});
                          }),
                      Mybutton(
                        title: '+',
                        onpress: () {
                          userInput += '+';
                          setState(() {});
                        },
                        color: const Color(0xffffa00a),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Mybutton(
                          title: '0',
                          onpress: () {
                            userInput += '0';
                            setState(() {});
                          }),
                      Mybutton(
                          title: '.',
                          onpress: () {
                            userInput += '.';
                            setState(() {});
                          }),
                      Mybutton(
                          title: 'DEL',
                          onpress: () {
                            userInput =
                                userInput.substring(0, userInput.length - 1);
                            setState(() {});
                          }),
                      Mybutton(
                        title: '=',
                        onpress: () {
                          equalpress();
                          setState(() {});
                        },
                        color: const Color(0xffffa00a),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }

  void equalpress() {
    String finaluserinput = userInput;
    finaluserinput = userInput.replaceAll('x', '*');
    Parser p = Parser();
    Expression expression = p.parse(finaluserinput);
    ContextModel contextModel = ContextModel();

    double eval = expression.evaluate(EvaluationType.REAL, contextModel);
    answer = eval.toString();
  }
}
