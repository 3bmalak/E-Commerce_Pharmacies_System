import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduatio_project/Layout/cubit/cubit.dart';
import 'package:graduatio_project/Layout/cubit/states.dart';
import 'package:graduatio_project/Shared/Components/Component.dart';


class SearchScreen extends StatelessWidget {
  bool b =false;
  var SearchController=TextEditingController();


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit,HomeStates>(
      listener: (context, state) {
        if (state is CategoriesSuccessfulState) {
          b=true;
        }
      },
      builder: (context, state) {
        var cubit= HomeCubit.get(context);
        return  Scaffold(
          appBar: AppBar(
            title: const Text("Search"),
            centerTitle: true,
          ),
          body:
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: DefaultTFF(
                    Controller: SearchController,
                    Keyboard: TextInputType.streetAddress,
                    Validate: (value) {
                      return null;
                    

                    },
                    PrefixIcon: Icons.search,
                    Label: "Search",
                    OnChange: (value) {
                      cubit.searchData=[];
                      cubit.getSearch(value);
                    },
                ),
              ),
              Expanded(
                child: ListView(

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
                        children:List.generate(
                          cubit.searchData!.length, (index) =>buildCategoriesList(cubit.searchData![index],context,cubit),),
                      ),

                    ),

                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

}
