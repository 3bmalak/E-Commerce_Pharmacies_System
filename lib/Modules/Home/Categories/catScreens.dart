import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduatio_project/Layout/cubit/cubit.dart';
import 'package:graduatio_project/Layout/cubit/states.dart';
import '../../../Shared/Components/Component.dart';
import '../../../Shared/Network/End_Points/end_points.dart';
import '../../login/cubit/LoginStates.dart';

class catList extends StatelessWidget {
bool b =false;


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit,HomeStates>(
      listener: (context, state) {
        if (state is CategoriesSuccessfulState) {
          b=true;
        }
        if (state is LoginSuccessState) {
          print("uuuuuuuuuuuuuuuuuuuuuuuuuuuuu");
          HomeCubit.get(context).getFirebase();
        }
      },
      builder: (context, state) {
        var cubit= HomeCubit.get(context);
        return  Scaffold(
          backgroundColor: Colors.white,
          body: b ? const Center(child: CircularProgressIndicator()) :
          ListView(

            children: <Widget> [
              const SizedBox(height: 15.0,),
              Container(
                padding: const EdgeInsets.only(right: 15.0),
                width: MediaQuery.of(context).size.width-30.0,
                height: MediaQuery.of(context).size.height-50.0,
                child: GridView.count(
                  crossAxisCount: 2,
                  primary: false,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 15.0,
                  childAspectRatio: 0.8,
                  children: List.generate(
                  allData.length, (index) =>buildCategoriesList(allData[index],context,cubit),),
                ),

              ),

            ],
          ),
        );
      },
    );
  }

}