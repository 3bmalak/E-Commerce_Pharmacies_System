import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduatio_project/Layout/cubit/cubit.dart';
import 'package:graduatio_project/Layout/cubit/states.dart';
import 'package:graduatio_project/Modules/login/LoginScreen.dart';
import 'package:graduatio_project/Shared/Components/Component.dart';
import 'package:graduatio_project/Shared/Network/End_Points/end_points.dart';
import 'package:graduatio_project/Shared/Network/local/cache_Helper.dart';
import '../Modules/Home/Cart/Cart.dart';
import '../Modules/Home/SearchScreen/searchscreen.dart';
import '../Modules/chatbot.dart';



class HomeLayout extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit,HomeStates>(
      listener: (context, state) {

      },
      builder: (context, state) {
        var cubit=HomeCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text(
                'Pharmacies App',
            ),
            actions: [
              IconButton(onPressed: () {
              CacheHelper.removeData(key: "User");
              navigatorAndFinish(context, LoginScreen());
                 },
                  icon: Icon(Icons.logout_outlined)),

              IconButton(onPressed: () {
                navigatorTo(context, SearchScreen());
              },
              icon: const Icon(Icons.search),),
              Stack(
                alignment: AlignmentDirectional.centerStart,

                children: [
                  IconButton(
                    onPressed: () {
                    navigatorTo(context,  Cart());
                  },
                    icon: const Icon(Icons.shopping_cart),),
                  CartData.isNotEmpty ?
                  Padding(
                    padding: const EdgeInsetsDirectional.only(bottom: 30),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.red,),

                      height: 20,
                      width: 20,
                      child: Center(child: Text("${CartData.length}")),
                    ),
                  ) : Container(),

                ],
              ),
            ],
          ),

          body: cubit.Screen[cubit.CurrentIndix],
          bottomNavigationBar: Container(
            // color: Colors.blue,
            decoration: BoxDecoration(
                boxShadow:[
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.4), //color of shadow
                    spreadRadius: 4, //spread radius
                    blurRadius: 10, // blur radius
                    offset: const Offset(0, 4), // changes position of shadow

                  ),
                ],
                borderRadius: BorderRadius.circular(15.0),
                color:Colors.blueGrey
            ),
            // color: Colors.indigoAccent,
            child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              fixedColor: Colors.indigo,
              backgroundColor:Colors.white70 ,
              onTap: (value) {
                cubit.changeScreen(indix: value);
              },
              currentIndex: cubit.CurrentIndix,
              showUnselectedLabels: false,
              unselectedItemColor: Colors.grey,


              items: const [
                BottomNavigationBarItem(icon:Icon(Icons.home) ,
                    label: "Home"
                ),
                BottomNavigationBarItem(icon:Icon(Icons.apps) ,
                    label: "Categories"
                ),
                BottomNavigationBarItem(icon:Icon(Icons.favorite) ,
                    label: "Favorite"
                ),

              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            // key: "key",
            child: Icon(Icons.message),
            onPressed: () {
              navigatorTo(context, ChatBotScreen());
            },
          ),
        );
      },
    );
  }
}
