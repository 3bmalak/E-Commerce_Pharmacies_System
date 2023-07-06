import 'package:flutter/material.dart';

class Requests extends StatelessWidget {
  const Requests({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Requests'),),
        body: Column(
          children: [
            const Text("kkkkkkkkkkkkkkkkkk"),
            Expanded(
              child: ListView.separated(
                itemCount:1,
                itemBuilder: (BuildContext context, int index) =>bulidRequestList(),
                separatorBuilder: (BuildContext context, int index) =>  Container(),
              ),
            ),
            /*Container(
              child: Column(
                children: [
                  Text(data),
                  Text(data)
                ],
              ),
              )*/
          ],
        ),
    );
  }
}
Widget bulidRequestList()=> Padding(
  padding: const EdgeInsets.all(7.0),
    child: Container(
      height: 70.0,
      width: double.infinity,
      decoration: BoxDecoration(
          boxShadow:[
            BoxShadow(
              color: Colors.grey.withOpacity(0.5), //color of shadow
              spreadRadius: 1, //spread radius
              blurRadius: 5, // blur radius
              offset: const Offset(0, 1), // changes position of shadow
            ),
          ],
          borderRadius: BorderRadius.circular(10.0),
          color:Colors.white
      ),
      child: const Row(
        children: [
          Padding(
            padding: EdgeInsetsDirectional.only(
                start: 15.0,
                end: 20.0
            ),
            child: Icon(Icons.local_pharmacy,color: Colors.indigo,),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children:  [
              Text('Ali',
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10.0,),
              Text('nasr city',
                style: TextStyle(
                    color: Colors.indigo,
                    fontWeight: FontWeight.bold),),
            ],
          ),
          Spacer(),

        ],
      ),
    ),

);