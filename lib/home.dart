import 'result.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isMale = true;
  double heightval = 170;
  int weight = 55;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Body Mass Index'),
      ),
      body: ListView(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  m1Expanded(context, 'Male'),
                  const SizedBox(
                    width: 15,
                  ),
                  m1Expanded(context, 'Female'),
                ],
              ),
            ),
          ),
          Expanded(
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.blueGrey),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Height',
                        style: Theme.of(context).textTheme.headline2,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            heightval.toStringAsFixed(1),
                            style: Theme.of(context).textTheme.headline1,
                          ),
                          Text(
                            'cm',
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                        ],
                      ),
                      Slider(
                        value: heightval,
                        onChanged: (newValue) {
                          setState(() {
                            heightval = newValue;
                          });
                        },
                        max: 220,
                        min: 150,
                        //divisions: 70,
                      )
                    ],
                  ),
                )),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  m2Expanded(context, 'Weight'),
                  const SizedBox(
                    width: 15,
                  ),
                  m2Expanded(context, 'Age'),
                ],
              ),
            ),
          ),
          Container(
            color: Colors.teal,
            width: double.infinity,
            height: MediaQuery.of(context).size.height / 10,
            child: TextButton(
              onPressed: () {
                double result = weight / pow(heightval / 100, 2);
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return Result(result: result, isMale: isMale, age: age);
                }));
              },
              child: Text(
                'Calculate',
                style: Theme.of(context).textTheme.headline2,
              ),
            ),
          )
        ],
      ),
    );
  }

  Expanded m1Expanded(BuildContext context, String type) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            isMale = (type == 'Male') ? true : false;
          });
        },
        child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: (isMale && type == 'Male') ||
                        (isMale == false && type == 'Female')
                    ? Colors.teal
                    : Colors.blueGrey),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  type == 'Male' ? Icons.male : Icons.female,
                  size: 60,
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  type == 'Male' ? 'Male' : 'Female',
                  style: Theme.of(context).textTheme.headline2,
                )
              ],
            )),
      ),
    );
  }

  Expanded m2Expanded(BuildContext context, String type) {
    return Expanded(
      child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: Colors.blueGrey),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                type == 'Age' ? 'Age' : 'Weight',
                style: Theme.of(context).textTheme.headline2,
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                type == 'Age' ? '$age' : '$weight',
                style: Theme.of(context).textTheme.headline1,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FloatingActionButton(
                      heroTag: type == 'Age' ? 'age++' : 'weight++',
                      child: const Icon(Icons.add),
                      mini: true,
                      onPressed: () {
                        setState(() {
                          type == 'Age' ? age++ : weight++;
                        });
                      }),
                  const SizedBox(
                    width: 20,
                  ),
                  FloatingActionButton(
                      heroTag: type == 'Age' ? 'age--' : 'weight--',
                      child: const Icon(Icons.remove),
                      mini: true,
                      onPressed: () {
                        type == 'Age' ? age-- : weight--;
                      }),
                ],
              )
            ],
          )),
    );
  }
}
