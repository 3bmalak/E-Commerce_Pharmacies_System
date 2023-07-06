import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduatio_project/Layout/pharmacy/Cubit/PharmacyCubit.dart';
import 'package:graduatio_project/Layout/pharmacy/Cubit/PharmacyStates.dart';
import 'package:graduatio_project/Modules/login/LoginScreen.dart';
import 'package:graduatio_project/Shared/Components/Component.dart';
import 'package:graduatio_project/Shared/Network/local/cache_Helper.dart';




class PharmacyHomeScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {


    return BlocConsumer<PharmacyHomeCubit,PharmacyHomeStates>(
      listener: (context, state) {

      },
      builder: (context, state) {


        var cubit=PharmacyHomeCubit.get(context);

        return Scaffold(
          appBar: AppBar(
            title: const Text(
              'Pharmacies App',
            ),
            actions: [
              IconButton(onPressed: () {
                CacheHelper.removeData(key: "fId");
                navigatorAndFinish(context, LoginScreen());
              },
                  icon: Icon(Icons.logout_outlined)),
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

                BottomNavigationBarItem(icon:Icon(Icons.cyclone_outlined) ,
                    label: "inProgress"
                ),
                BottomNavigationBarItem(icon:Icon(Icons.feedback_outlined) ,
                    label: "Feedbacks"
                ),

                BottomNavigationBarItem(icon:Icon(Icons.settings) ,
                  label: "Settings",
                  // backgroundColor: Colors.amber
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
