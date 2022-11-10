import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  const Result({ Key? key, 
  required this.result,
  required this.isMale, 
  required this.age }) : super(key: key);

  final double result ;
  final bool isMale;
  final int age;

  String get resultPhrase {
    String resultText ='';
    if(result>=30) {
      resultText='Obese';
    }
    else if(result>25&&result<30) {
      resultText='OverWeight';
    } 
    else if(result>18.5&&result<=24.9) {
      resultText='Normal';
    } 
    else {
      resultText='Thin';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Result'),
      ),
      body: SafeArea(//to make app dimensions flixable in diffirant Devices
        child: Center(
          child:Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children:  [
               Text("Gender : ${isMale? 'Male':'Female'}",
               style:Theme.of(context).textTheme.headline1,),
               Text("Result :${result.toStringAsFixed(1)}",//عشان اقرب الرقم لاقرب رقم عشرى
               style:Theme.of(context).textTheme.headline1,),
               Text("Age : $age",
               style:Theme.of(context).textTheme.headline1,),
               Text("Healthiness : $resultPhrase",
               style:Theme.of(context).textTheme.headline1,),
               
            ],
          ) ,)),
    );
  }
}