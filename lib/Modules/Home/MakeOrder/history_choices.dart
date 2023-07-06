import 'package:flutter/material.dart';
import 'package:graduatio_project/Modules/Home/MakeOrder/prescriptions_page.dart';

import '../../../Shared/Components/Component.dart';
import 'MedicalHistory.dart';

class history_choices extends StatelessWidget {
  const history_choices({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Medical History'),),
      body:Column(
        children: [
          Container(
            decoration: BoxDecoration(border: Border.all(color: Colors.black45,style: BorderStyle.solid,width: 1),borderRadius: BorderRadius.circular(15.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 3.0,
                  blurRadius: 5.0,
                )
              ],
              color: Colors.indigo
            ),
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.only(top: 5,right: 5,left: 5),
            child: Row(
              children: [
                const SizedBox(
                  width: 330,
                  child: Row(
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      Image(
                        image: AssetImage('assets/images/presc.png'),
                        width: 60,
                        height: 60,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text("prescriptions",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white)),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: IconButton(
                    icon:  const Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: Colors.white,
                      size: 50,
                    ),
                    tooltip: 'go to user prescriptions',
                    onPressed: () {
                      navigatorTo(context, prescription_page());
                    },
                  ),
                ),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(border: Border.all(color: Colors.black45,style: BorderStyle.solid,width: 1),borderRadius: BorderRadius.circular(15.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 3.0,
                  blurRadius: 5.0,
                )
              ],
              color: Colors.indigo
            ),
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.only(top: 5,right: 5,left: 5),
            child: Row(
              children: [
                const SizedBox(
                  width: 330,
                  child: Row(
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      Image(
                        image: AssetImage('assets/images/images.png'),
                        width: 60,
                        height: 60,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text("Old Orders",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white)),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: IconButton(
                    icon:  const Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: Colors.white,
                      size: 50,
                    ),
                    tooltip: 'go to user old orders',
                    onPressed: () {
                      navigatorTo(context,  MakeOrderScreen());
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      )

    );
  }
}