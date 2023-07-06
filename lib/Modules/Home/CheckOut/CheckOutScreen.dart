import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduatio_project/Shared/Components/Component.dart';
import 'package:graduatio_project/Shared/Network/End_Points/end_points.dart';
import 'package:graduatio_project/Shared/Network/local/cache_Helper.dart';
import 'dart:math';
import '../../../Layout/cubit/cubit.dart';
import '../Cart/cubit/CartCubit.dart';
import '../Cart/cubit/CartStates.dart';
import '../Feedback/feedbackScreen.dart';


enum Payment { cash, credit }
final TextEditingController locationController = TextEditingController();
final TextEditingController phoneController = TextEditingController();

class RadioGroup extends StatelessWidget {

   dynamic? pharmacyId;
int points=0;
  RadioGroup(this.pharmacyId );
bool p=false;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartCubit,CartStates>(
      listener: (context, state) {

      },
      builder: (context, state) {
        var cubit2=HomeCubit.get(context);
        int points = cubit2.historyData.length*3;
        print(pharmacyId);
        var cubit=CartCubit.get(context);
        Payment? payment;
        if(!cubit.payment){
          payment = Payment.cash;
        }
        else
        {
          payment=Payment.credit;
        }
        num cost=0;
        changepoints(){
          cost=cubit.totalCost-points;
        }

        if (CacheHelper.getData(key: "points")==0) {
          points = cubit2.historyData.length*3;
          CacheHelper.SaveData(key: "points", value: points);
        }
        else{
          points = CacheHelper.getData(key: "points");
        }

        return Scaffold(
          appBar: AppBar(
            title: const Text("Checkout"),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios_new_rounded,
                  color: Colors.black),
              onPressed: () => Navigator.of(context).pop(),
            ),
            centerTitle: true,
            backgroundColor: Colors.blue[900],
          ),
          body: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                const Padding(
                    padding: EdgeInsets.only(right: 250, top: 12.0, bottom: 10.0),
                    child: Text('Delivery',
                        style: TextStyle(
                            fontSize: 23,
                            fontFamily: 'unboundded',
                            color: Colors.indigo))),
                Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.black38)),
                    height: 50,
                    margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                    padding: const EdgeInsets.all(15),
                    child: const Row(children: [
                      Icon(Icons.delivery_dining),
                      SizedBox(width: 25),
                      Text("Delivery Within Two Hours",
                          style: TextStyle(
                              fontSize: 15,
                              fontFamily: 'unboundded',
                              color: Colors.indigo)),
                    ])),
                const Padding(
                    padding: EdgeInsets.only(right: 250, top: 14.0, bottom: 10.0),
                    child: Text('Payment',
                        style: TextStyle(
                            fontSize: 23,
                            fontFamily: 'unboundded',
                            color: Colors.indigo))),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.black38)),
                  margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                  child: Column(children: [
                    RadioListTile<Payment>(
                      secondary: const Icon(Icons.money),
                      controlAffinity: ListTileControlAffinity.trailing,
                      title: const Text('Cash',
                          style: TextStyle(
                              fontSize: 15,
                              fontFamily: 'unboundded',
                              color: Colors.indigo)),
                      // 4.
                      value: Payment.cash,
                      // 5.
                      groupValue: payment,
                      // 6.
                      onChanged: (Payment? value) {
                        if(cubit.payment)
                          {
                            cubit.changePayment();
                          }
                        print(value);

                      }
                    ),
                    RadioListTile<Payment>(
                      secondary: const Icon(Icons.credit_card),
                      controlAffinity: ListTileControlAffinity.trailing,
                      title: const Text('Credit Card',
                          style: TextStyle(
                              fontSize: 15,
                              fontFamily: 'unboundded',
                              color: Colors.indigo)),
                      // 4.
                      value: Payment.credit,
                      // 5.
                      groupValue: payment,
                      // 6.
                      onChanged:(value) {
                        if(!cubit.payment)
                        {
                          cubit.changePayment();
                        }
                      },
                    ),
                  ]),
                ),
                  Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.black38)),
                  height: 140,
                  margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  padding: const EdgeInsets.all(15),
                  child:Column(
                      children:<Widget>[Row(
                        children: [
                          const Icon(Icons.discount_outlined),
                          const SizedBox(width: 25),
                          const Text("Add promo code",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: 'unboundded',
                                  color: Colors.indigo)),
                          const SizedBox(width: 120),
                          RichText(
                              text: TextSpan(
                                text: 'Add',
                                style: const TextStyle(
                                    fontSize: 15,
                                    fontFamily: 'unboundded',
                                    color: Colors.indigo,
                                    fontWeight: FontWeight.bold),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    // ispressed = true;
                                  },
                              ))
                        ],
                      ),
                        Container(
                          padding: const EdgeInsets.only(top: 25),
                          child: TextField(decoration: InputDecoration(border:OutlineInputBorder(borderRadius:BorderRadius.circular(20)),hintText: "enter your promo code")),
                        ),
                      ]),
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.black38)),
                  height: 140,
                  margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  padding: const EdgeInsets.all(15),
                  child:Column(
                      children:<Widget>[
                        const Padding(
                            padding: EdgeInsets.only(right:250),
                            child: Text('Location',
                                style: TextStyle(
                                    fontSize: 23,
                                    fontFamily: 'unboundded',
                                    color: Colors.indigo))),
                        Container(
                          padding: const EdgeInsets.only(top: 15),
                          child: TextField(
                              controller: locationController,
                              decoration: InputDecoration(
                              border:OutlineInputBorder(
                                  borderRadius:BorderRadius.circular(20)
                              ),
                              hintText: "enter your Location here!"
                          )
                          ),
                        ),
                      ]),
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.black38)),
                  height: 140,
                  margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  padding: const EdgeInsets.all(15),
                  child:Column(
                      children:<Widget>[
                        const Padding(
                            padding: EdgeInsets.only(right:200),
                            child: Text('phone number',
                                maxLines: 1,
                                style: TextStyle(
                                    fontSize: 23,
                                    fontFamily: 'unboundded',
                                    color: Colors.indigo))),
                        Container(
                          padding: const EdgeInsets.only(top: 15),
                          child: TextField(controller: phoneController,decoration: InputDecoration(border:OutlineInputBorder(borderRadius:BorderRadius.circular(20)),hintText: "enter your phone number here!")),
                        ),
                      ]),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    height: 60.0,
                    decoration: BoxDecoration(
                        boxShadow:[
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2), //color of shadow
                            spreadRadius: 1, //spread radius
                            blurRadius: 5, // blur radius
                            offset: const Offset(0, 1), // changes position of shadow
                          ),
                        ],
                        borderRadius: BorderRadius.circular(10.0),
                        color:Colors.white
                    ),
                    child: Row(
                      children: [
                        const SizedBox(width: 20.0,),
                        const Icon(Icons.monetization_on,
                          color: Colors.yellow,
                          size: 45.0,),
                        const SizedBox(
                          width: 15,
                        ),
                        const Text(
                          'Your Points',
                          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(width: 15,),
                        Text(
                          '$points = ${points/25} LE',
                          style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                        const Spacer(),
                        SizedBox.fromSize(
                          size: Size(50, 50),
                          child: ClipOval(
                            child: Material(
                              color: p?Colors.green: Colors.indigo,
                              child: InkWell(
                                splashColor: Colors.green,
                                onTap: () {
                                  p=!p;
                                  cubit.changeState();
                                },
                                child: const Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Icon(Icons.verified_user,
                                        color:Colors.white), // <-- Icon
                                    Text("Use",style: TextStyle(color: Colors.white)), // <-- Text
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 5,)
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20,),
                const Padding(
                    padding: EdgeInsets.only(right: 250, top: 12.0, bottom: 10.0),
                    child: Text('Cost',
                        style: TextStyle(
                            fontSize: 23,
                            fontFamily: 'unboundded',
                            color: Colors.indigo))),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.black38)),
                  height: 50,
                  margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),

                  child: Row(children:  [
                    const SizedBox(width: 18),
                    const Icon(Icons.euro),
                    const SizedBox(width: 25),
                    const Text("Total Cost is : ",
                        style: TextStyle(
                            fontSize: 15,
                            fontFamily: 'unboundded',
                            color: Colors.indigo)),
                    const SizedBox(width: 25),
                    Text(
                        p?"${(cubit.totalCost-(points/25)).toStringAsFixed(2)}  LE":"${cubit.totalCost.toString()}  LE",semanticsLabel: 'Egp',
                        style: const TextStyle(
                            fontSize: 15,
                            fontFamily: 'unboundded',
                            color: Colors.indigo)),
                  ]),
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.black38)),
                  height: 50,
                  margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),

                  child: const Row(children:  [
                    SizedBox(width: 18),
                    Icon(Icons.local_pharmacy),
                    SizedBox(width: 25),
                    Text("Pharmacy : ",
                        style: TextStyle(
                            fontSize: 15,
                            fontFamily: 'unboundded',
                            color: Colors.indigo)),
                    SizedBox(width: 25),
                    Text(
                        'Top Pharmacy',
                        style: TextStyle(
                            fontSize: 15,
                            fontFamily: 'unboundded',
                            color: Colors.indigo)),
                  ]),
                ),
                const SizedBox(height: 20,),
                DefaultButton(text: "Proceed to Checkout", function: () {

                  CartCubit.get(context).createcart(PharmacyId: pharmacyId,location: locationController.text.toString(),phone: phoneController.text.toString(),context: context,cartid: Random().nextInt(4294967296).toString(), userid: uId, products: CartData.toList());
                  CartData=[];
                  if(p){
                    cubit.totalCost=cubit.totalCost-(points/25);
                    CacheHelper.SaveData(key: "points", value: 3);
                  }
                  else{
                    CacheHelper.SaveData(key: "points", value: CacheHelper.getData(key: "points")+3);
                  }
                  navigatorAndFinish(context, FeedbackScreen());

                },),
              ],
            ),
          ),
        );
      },
    );
  }
}