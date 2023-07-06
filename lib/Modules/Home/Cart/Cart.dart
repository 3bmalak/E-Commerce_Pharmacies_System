
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../Models/getDataData.dart';
import '../../../Shared/Network/End_Points/end_points.dart';
import '../locationScreen/location.dart';
import 'cubit/CartCubit.dart';
import 'cubit/CartStates.dart';


class Cart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bool x=false;
    return BlocConsumer<CartCubit,CartStates>(
      listener: (context, state) {

      },
      builder: (context, state) {
      var cubit = CartCubit.get(context);
      if(CartData.isEmpty){
        x=true;
      }
      else{
        x=false;
      }
      print(x);

        return Scaffold(
          appBar: AppBar(
            title:  const Center(child: Text("Cart")),
          ),
          body: Column(
            children: [
              Expanded(
                child: x?
                const Center(
                  child:  Text("Empty Cart",
                  style: TextStyle(fontSize: 50.0,
                      fontWeight: FontWeight.bold,
                    color: Colors.indigo
                  ),),
                ):
                ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (context, index) =>buildCartList(model: CartData[index],context: context),
                  itemCount: CartData.length,
                  separatorBuilder: (BuildContext context, int index) {
                    return const SizedBox(
                      height: 11,
                    );
                  },
                ),
              ),
              Align(
                  alignment: Alignment.bottomCenter,
                  child: SizedBox(
                    width: 430,
                    height: 50,
                    child: ElevatedButton(
                      style: OutlinedButton.styleFrom(
                        backgroundColor: Colors.indigo,),
                      onPressed: () {
                        cubit.totalCost=0;
                        cubit.getTotalCost();

                        Navigator.push(context, MaterialPageRoute(builder: (_) =>  Locationscreen()));
                      },
                      child: const Text("Proceed to Checkout",
                        style: TextStyle(fontFamily: "unboundded",),),

                    ),
                  ))
            ],
          ),
        );
      },
    );
  }
}

Widget buildCartList({required GetDataModel model,context}) =>Padding(
  padding: const EdgeInsetsDirectional.only(top: 8.0),
  child:   Container(

    decoration: BoxDecoration(
        boxShadow:[
          BoxShadow(
            color: Colors.grey.withOpacity(0.8), //color of shadow
            spreadRadius: 1, //spread radius
            blurRadius: 5, // blur radius
            offset: const Offset(0, 1), // changes position of shadow
          ),
        ],
        borderRadius: BorderRadius.circular(10.0),
        color:Colors.white
    ),

    margin: const EdgeInsets.only(left: 7, right: 7),

    height: 150,

    child: Row(

      children: [

        SizedBox(
          width: 110,
          child: Image.network('${model.image}',
            height: 80,
            width: 80,
            errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {

              return const Image(image: AssetImage('assets/images/Medicine-Pills-Free-PNG.png'),height: 80,);

            },

          ),

        ),

        SizedBox(
          width: 280,
          child: Padding(

            padding: const EdgeInsets.only(left: 30, top: 20),

            child: Column(

              children: [

                Text(model.name.toUpperCase(),

                  style: const TextStyle(fontFamily: "unbounded",

                      fontSize: 20,

                      color: Colors.indigo,

                      fontWeight: FontWeight.bold,

                      overflow: TextOverflow.ellipsis),),

                const SizedBox(

                  height: 10,

                ),

                Text("${double.parse(model.cost.toString()).round()} EGP",

                  style: const TextStyle(fontFamily: "unbounded",

                      color: Colors.indigo,

                      fontSize: 20,

                      fontWeight: FontWeight.bold),),

                const SizedBox(

                  height: 15,

                ),

                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Spacer(),
                    Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        // border: Border.all(color: Colors.black38),
                        color: Colors.indigo,),
                      child: IconButton(onPressed: () {
                        model.count+=1;
                        CartCubit.get(context).changeCount();
                      },
                        icon: const Icon(Icons.add),color: Colors.white,iconSize: 20,),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                        model.count.toString(),
                        style: const TextStyle(
                            fontFamily: "unbounded",
                            color: Colors.indigo,
                            fontWeight: FontWeight.bold,

                            fontSize: 22)),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(height: 40,
                      width: 40.0,
                      decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(color: Colors.black38),
                      color: Colors.indigo,),
                      child: IconButton(onPressed: () {

                        if(model.count>1) {
                          model.count-=1;
                        }

                        CartCubit.get(context).changeCount();

                      },

                          icon: const Icon(Icons.minimize),color: Colors.white,iconSize: 20, padding: const EdgeInsets.only(bottom: 12)),
                    ),
                    const Spacer(),
                    IconButton(onPressed: () {
                      print(CartData.length);
                      CartData.remove(model);
                      print(CartData.length);

                      CartCubit.get(context).changeCount();
                      print(CartData.length);

                    },
                      icon: const Icon(Icons.delete,color: Colors.red,), iconSize: 30,)


                  ],

                ),



              ],

            ),

          ),

        )

      ],

    ),

  ),
);

