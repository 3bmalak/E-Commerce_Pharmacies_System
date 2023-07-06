import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduatio_project/Layout/cubit/cubit.dart';
import 'package:graduatio_project/Layout/cubit/states.dart';
import 'package:graduatio_project/Shared/Components/Component.dart';
import '../../../Models/historymodel.dart';
import '../../../Shared/Network/End_Points/end_points.dart';

class MakeOrderScreen extends StatelessWidget {
  const MakeOrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit,HomeStates>(
      listener: (context, state) {


      },
      builder: (context, state) {
        HomeCubit cubit=HomeCubit.get(context);
        return Scaffold(
          appBar: AppBar(title: const Text('Medical History'),),
          body:
          ListView.separated(
            shrinkWrap: true,
            itemBuilder: (context, index) =>buildMedicalhistoryList(model: cubit.historyData[index],context: context),
            itemCount: cubit.historyData.length,
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(
                height: 11,
              );
            },
          ),
        ) ;
      },
    );
  }
}
Widget buildMedicalhistoryList({required HistoryModel model,context}) =>
    Expanded(
      child: Container(
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
            Align(
              alignment: Alignment.center,
              child: Column(
                children: [
                  Text("Order Cost: ${double.parse(model.totalcost.toString()).round()}",style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white)),
                  const SizedBox(
                    height: 5,
                  ),
                  Text('Date: ${DateTime.fromMillisecondsSinceEpoch(int.parse(model.date.toString().substring(18,28))*1000)}',style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white)),
                ],
              ),
            ),
            Spacer(),
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: IconButton(
                  icon:  const Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: Colors.white,
                    size: 50,
                  ),
                  tooltip: 'go to cart details',
                  onPressed: () {
                    navigatorTo(context, buildOldOrderList(model: model,context: context));
                    number_of_order=model.cartid;
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
Widget buildOldOrderList({required HistoryModel model,context}) =>
    Scaffold(
      appBar: AppBar(title: const Text('Medical History'),),
      body:   SingleChildScrollView(
        child: Container(
          // decoration: BoxDecoration(border: Border.all(color: Colors.black12,style: BorderStyle.solid,width: 3)),
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.only(top: 5,right: 5,left: 5),
          child: Column(
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
                child: Column(
                  children: [
                    Text("Order id: ${model.cartid}",style: const TextStyle(fontSize: 22,fontWeight: FontWeight.bold,color: Colors.white)),
                    Text('${DateTime.fromMillisecondsSinceEpoch(int.parse(model.date.toString().substring(18,28))*1000)}',style: const TextStyle(fontSize: 22,fontWeight: FontWeight.bold,color: Colors.white)),
                  ],
                ),
              ),
              ListView.separated(
                shrinkWrap: true,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsetsDirectional.only(top: 8.0),
                  child:   Container(

                    decoration: BoxDecoration(
                        boxShadow:[
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2), //color of shadow
                            spreadRadius: 3.0, //spread radius
                            blurRadius: 5, // blur radius
                            offset: const Offset(0, 1), // changes position of shadow
                          ),
                        ],
                        borderRadius: BorderRadius.circular(10.0),
                        color:Colors.indigo
                    ),

                    margin: const EdgeInsets.only(left: 7, right: 7),

                    height: 150,

                    child: Row(

                      children: [

                        SizedBox(
                          width: 95,
                          child: Image.network('${model.data!.products[index].image}',
                            height: 80,
                            width: 80,
                            errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {

                              return const Image(image: AssetImage('assets/images/Medicine-Pills-Free-PNG.png'),height: 80,);

                            },

                          ),

                        ),

                        SizedBox(
                          width: 265,
                          child: Padding(

                            padding: const EdgeInsets.only(left: 30, top: 20),

                            child: Column(

                              children: [

                                Text(model.data!.products[index].name.toUpperCase(),

                                  style: const TextStyle(fontFamily: "unbounded",

                                      fontSize: 20,

                                      color: Colors.white,

                                      fontWeight: FontWeight.bold,

                                      overflow: TextOverflow.ellipsis),),

                                const SizedBox(

                                  height: 10,

                                ),

                                Text("${model.data!.products[index].cost.toString().toUpperCase()} EGP",

                                  style: const TextStyle(fontFamily: "unbounded",

                                      color: Colors.white,

                                      fontSize: 20,

                                      fontWeight: FontWeight.bold),),

                                const SizedBox(

                                  height: 15,

                                ),
                                Row(
                                  children: [
                                    const SizedBox(

                                      width: 32,

                                    ),
                                    Text("${model.data!.products[index].categories}",

                                      style: const TextStyle(fontFamily: "unbounded",

                                          color: Colors.white,

                                          fontSize: 20,

                                          fontWeight: FontWeight.bold),),
                                    const SizedBox(

                                      width: 15,

                                    ),
                                    Text("Count:${model.data!.products[index].count.toString()}",

                                      style: const TextStyle(fontFamily: "unbounded",

                                          color: Colors.white,

                                          fontSize: 13,

                                          fontWeight: FontWeight.bold),),
                                  ],
                                ),

                              ],

                            ),

                          ),

                        )

                      ],

                    ),

                  ),
                ),
                itemCount: model.data!.products.length,
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(
                    height: 11,
                  );
                },
              ),
            ],
          ),
        ),
      ),
);