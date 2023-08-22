import 'package:flutter/material.dart';
import 'package:flutter_calculator/constants/button_data.dart';
import 'package:flutter_calculator/constants/constants.dart';
import 'package:fraction/fraction.dart';
import 'package:math_expressions/math_expressions.dart';

String userInput = '';
var result = '0';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Parser p = Parser();
  ContextModel cm = ContextModel();

  void onAction() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: secondary,
        title: Text(widget.title),
        titleTextStyle: TextStyle(fontSize: 19, fontWeight: FontWeight.w500),
        centerTitle: true,
        elevation: 1,
        leading: Icon(
          Icons.menu_sharp,
          size: 20,
        ),
      ),
      body: SafeArea(
          child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 32),
            width: double.infinity,
            height: 300,
            color: secondary,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  userInput,
                  overflow: TextOverflow.fade,
                  style: TextStyle(
                      color: Theme.of(context)
                          .colorScheme
                          .background
                          .withOpacity(0.98),
                      fontSize: h2),
                ),
                Text(
                  result,
                  overflow: TextOverflow.fade,
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.background,
                      fontSize: h1),
                ),
              ],
            ),
          ),
          Divider(height: 0.1),
          Expanded(
              child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex: 3,
                child: Column(
                  children: [
                    LeftWidgetRRow(list: buttons[0], onAction: onAction),
                    LeftWidgetRRow(list: buttons[1], onAction: onAction),
                    LeftWidgetRRow(list: buttons[2], onAction: onAction),
                    LeftWidgetRRow(list: buttons[3], onAction: onAction),
                    LeftWidgetRRow(list: buttons[4], onAction: onAction),
                    LeftWidgetRRow(list: buttons[5], onAction: onAction),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                        child: ElevatedButton(
                            style: fooStyle,
                            onPressed: () {
                              setState(() {
                                userInput = '$userInput/';
                              });
                            },
                            child: Text('/', style: TextStyle(fontSize: 20)))),
                    Expanded(
                        child: ElevatedButton(
                            style: fooStyle,
                            onPressed: () {
                              userInput = '$userInput*';
                              setState(() {});
                            },
                            child: Text('*', style: TextStyle(fontSize: 20)))),
                    Expanded(
                        child: ElevatedButton(
                            style: fooStyle,
                            onPressed: () {
                              userInput = '$userInput-';
                              setState(() {});
                            },
                            child: Text('-', style: TextStyle(fontSize: 20)))),
                    Expanded(
                        child: ElevatedButton(
                            style: fooStyle,
                            onPressed: () {
                              userInput = '$userInput+';
                              setState(() {});
                            },
                            child: Text('+', style: TextStyle(fontSize: 20)))),
                    Expanded(
                        flex: 2,
                        child: ElevatedButton(
                            style: equalStyle,
                            onPressed: () {
                              if (userInput == '') return;
                              String input = userInput.replaceAll('(', '*(');
                              input = input.replaceAll(')', ')*1');
                              Expression exp = p.parse(input);
                              double eval =
                                  exp.evaluate(EvaluationType.REAL, cm);
                              result = eval.toString();
                              setState(() {});
                            },
                            child: Text('=', style: TextStyle(fontSize: 20)))),
                  ],
                ),
              ),
            ],
          ))
        ],
      )),
    );
  }
}

class LeftWidgetRRow extends StatefulWidget {
  LeftWidgetRRow({Key? key, required this.list, required this.onAction})
      : super(key: key);
  final List<List<dynamic>> list;
  final Function onAction;

  @override
  State<LeftWidgetRRow> createState() => _LeftWidgetRRowState();
}

class _LeftWidgetRRowState extends State<LeftWidgetRRow> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              child: ElevatedButton(
                  style: myStyle,
                  onPressed: () {
                    if (widget.list[0][0] == '⇵') {
                      if (result.isFraction) return;
                      result = double.parse(result).toFraction().toString();
                    } else {
                      userInput = userInput + widget.list[0][0].toString();
                    }
                    widget.onAction();
                  },
                  child:
                      Text(widget.list[0][0], style: TextStyle(fontSize: 20)))),
          Expanded(
              child: ElevatedButton(
                  style: myStyle,
                  onPressed: () {
                    if (widget.list[1][0] == 'C') {
                      if (userInput == '') return;
                      userInput = userInput.substring(0, userInput.length - 1);
                    } else {
                      userInput = userInput + widget.list[1][0].toString();
                    }
                    widget.onAction();
                  },
                  child:
                      Text(widget.list[1][0], style: TextStyle(fontSize: 20)))),
          Expanded(
              child: ElevatedButton(
                  style: myStyle,
                  onPressed: () {
                    if (widget.list[2][0] == 'AC') {
                      userInput = '';
                      result = '0';
                    } else {
                      userInput = userInput + widget.list[2][0].toString();
                    }
                    widget.onAction();
                  },
                  child:
                      Text(widget.list[2][0], style: TextStyle(fontSize: 20)))),
        ],
      ),
    );
  }
}
