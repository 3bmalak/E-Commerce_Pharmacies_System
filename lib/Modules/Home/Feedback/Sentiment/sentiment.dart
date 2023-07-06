import 'dart:convert';

import 'Function.dart';
import 'package:flutter/material.dart';
class sentiment extends StatefulWidget {
  const sentiment({Key? key}) : super(key: key);

  @override
  State<sentiment> createState() => _HomeState();
}

class _HomeState extends State<sentiment> {
  String url='';
  var data;
  String output="Sentiment ";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:const Text('ya rb yzbot')),
      body: Center(child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
              onChanged: (value){
                url='http://10.0.2.2:5000/api?query=$value';
              },
            ),TextButton(onPressed:()async{
              data=await  fetchdata(url);
              var decoded = jsonDecode(data);
              setState(() {
                output=decoded['output'];
              });
            }, child:const Text('Analyse this Sentence ',style: TextStyle(fontSize: 20),)),
              Text(output,style: const TextStyle(fontSize: 20,color: Colors.green),)
            ]),
      )
        ,),
    );
  }
}
