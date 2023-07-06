import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
class RequestsDetails extends StatelessWidget {

  final List<Map<String, dynamic>> _items = List.generate(
      1,
          (index) => {
        "id": index,
        "title": "client name: Sofa",
        "content":
        "location $index. "
        "medicine $index. "
        "quantity $index."
      });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Request Details'),),
      body: Column(
        children: [
          const Image(
            image: AssetImage('assets/images/det.png'),
            width: 420,
            height: 300,
          ),
          const SizedBox(height: 1.0,),
          Expanded(
            child:ListView.builder
              ( itemCount: _items.length,
                itemBuilder:  (_, index){
                  final item = _items[index];
                  return Card(
                    color: Colors.blue,
                    elevation: 4,
                    child: ExpansionTile(
                        collapsedIconColor: Colors.white,
                        title: Text(item['title'], style: const TextStyle(
                            color: Colors.white
                        ),),
                        children: const [
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
                              SizedBox(height: 10.0,),
                              Text('Antinal',
                                style: TextStyle(
                                    color: Colors.indigo,
                                    fontWeight: FontWeight.bold),),
                            ],
                          ),// This button is used to remove this item
                        ]
                    ),
                  );
                }
            )
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green, // background (button) color
                ),
                onPressed: () {
                  Fluttertoast.showToast(
                    msg: "Your request is being processed",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.green,
                    textColor: Colors.white,
                    fontSize: 16.0
                );},
                child: const Text('Accept',),

              ),
              const SizedBox(width: 10.0,),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red, // background (button) color
                ),
                onPressed: () {Fluttertoast.showToast(
                    msg: "Your request is cancelled",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.red,
                    textColor: Colors.white,
                    fontSize: 16.0
                );},
                child: const Text('REJECT',),

              ),
            ],
          ),


        ],
      ),
    );
  }
}
