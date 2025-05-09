import 'package:calculator1/components/button.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class HomeScreen extends StatefulWidget {
  static const String id = "homeScreen";
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override

  var userInput='';
  var output='';

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
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,

                      children: [

                        Text(userInput.toString(),style: TextStyle(fontSize: 30,color: Colors.white, ) , ),
                        SizedBox(height: 10,),
                        Text(output.toString(),style: TextStyle(fontSize: 20,color: Colors.white),),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    Row(
                      children: [
                        MyButton(input: 'AC',onPress: (){
                          userInput='';
                          output='';
                          setState((){

                          });
                        },
                        ),
                        MyButton(input: '+/-',onPress: (){
                          userInput+="+/-";
                          setState(() {});
                        },),
                        MyButton(input: '%',onPress: (){
                          userInput+="%";
                          setState(() {});
                        },),
                        MyButton(input: '/',onPress: (){
                          userInput+="/";
                          setState(() {});
                        },color: Color(0xffffa00a),),
                      ],
                    ),
                    Row(
                      children: [
                        MyButton(input: '7',onPress: (){
                          userInput+="7";
                          setState(() {

                          });
                        },
                        ),
                        MyButton(input: '8',onPress: (){
                          userInput+="8";
                          setState(() {

                          });
                        },),
                        MyButton(input: '9',onPress: (){
                          userInput+="9";
                          setState(() {});
                        },),
                        MyButton(input: 'X',onPress: (){
                          userInput+="x";
                          setState(() {

                          });
                        },color: Color(0xffffa00a),),
                      ],
                    ),
                    Row(
                      children: [
                        MyButton(input: '4',onPress: (){
                          userInput+="4";
                          setState(() {});
                        },
                        ),
                        MyButton(input: '5',onPress: (){
                          userInput+="5";
                          setState(() {});
                        },),
                        MyButton(input: '6',onPress: (){
                          userInput+="6";
                          setState(() {});
                        },),
                        MyButton(input: '-',onPress: (){
                          userInput+="-";
                          setState(() {});
                        },color: Color(0xffffa00a),),
                      ],
                    ),
                    Row(
                      children: [
                        MyButton(input: '1',onPress: (){
                          userInput+="1";
                          setState(() {});
                        },
                        ),
                        MyButton(input: '2',onPress: (){
                          userInput+="2";
                          setState(() {});
                        },),
                        MyButton(input: '3',onPress: (){
                          userInput+="3";
                          setState(() {});
                        },),
                        MyButton(input: '+',onPress: (){
                          userInput+="+";
                          setState(() {});
                        },color: Color(0xffffa00a),),
                      ],
                    ),
                    Row(
                      children: [
                        MyButton(input: '0',onPress: (){
                          userInput+="0";
                          setState(() {});
                        },
                        ),
                        MyButton(input: '.',onPress: (){
                          userInput+=".";
                          setState(() {});
                        },),
                        MyButton(input: 'DEL',onPress: (){
                          userInput=userInput.substring(0,userInput.length-1);
                          setState(() {

                          });
                        },),
                        MyButton(input: '=',onPress: (){
                          equalPress();
                          setState(() {});
                        },color: Color(0xffffa00a),),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void equalPress(){
     String finalUserInput=userInput;
     finalUserInput=userInput.replaceAll('x', '*');
    GrammarParser p=GrammarParser();
    Expression expression=p.parse(finalUserInput);

    ContextModel contextModel=ContextModel();
    double eval=expression.evaluate( EvaluationType.REAL, contextModel);
    output=eval.toString();
  }
}

