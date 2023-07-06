import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduatio_project/Layout/cubit/cubit.dart';
import 'package:graduatio_project/Layout/cubit/states.dart';
import 'package:graduatio_project/Modules/Home/MakeOrder/history_choices.dart';
import 'package:graduatio_project/Modules/Home/articals/mental.dart';
import 'package:graduatio_project/Modules/Home/chechWeight/CheckWeightScreen.dart';
import 'package:graduatio_project/Modules/request%20details.dart';
import 'package:graduatio_project/Shared/Network/local/cache_Helper.dart';
import '../../Models/CategoriesModel.dart';
import '../../Shared/Components/Component.dart';
import 'Cart/cubit/CartCubit.dart';
import 'MakeOrder/MedicalHistory.dart';
import 'articals/Hair.dart';
import 'articals/SkinCare.dart';
import 'articals/lifestyle.dart';
import 'articals/meditation.dart';
import 'locationScreen/location.dart';


class HomeModel
{
  final   String image;
  HomeModel({
    required  this.image,
  });
}

class HomeScreen extends StatelessWidget {
  List<CategoriesModel> cat=[
  CategoriesModel(image: 'assets/images/Articles/mental.jpg', title: 'Mental Health',widget:  Mental()),
  CategoriesModel(image: 'assets/images/Articles/hair.jpg', title: 'Haircare',widget:  HairArticle()),
  CategoriesModel(image: 'assets/images/Articles/lifestyle.jpg', title: 'Healthy Lifestyle ',widget:  LifeStyle()),
  CategoriesModel(image: 'assets/images/Articles/meditate.png', title: 'Meditation',widget: Meditation() ),
  CategoriesModel(image: 'assets/images/Articles/skin.jpg', title: 'SkinCare ',widget:  SkinCare()),
  ];
  List<HomeModel> hom=[
    HomeModel(image: 'assets/images/imagesfore3lan.jpg', ),
    HomeModel(image: 'assets/images/download.jpg',),
  ];


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {

      },
      builder: (context, state) {
        var cubit=HomeCubit.get(context);
        int points =0;
        if (CacheHelper.getData(key: "points")==0) {
           points = cubit.historyData.length*3;
           CacheHelper.SaveData(key: "points", value: points);
        }
        else{
          points = CacheHelper.getData(key: "points");
        }
        return
        productsBuilder
          (points,
        context
        );
      },
    );
  }
  Widget productsBuilder(points,context) =>

      Scaffold(
        body:
         SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10,
              ),
              CarouselSlider(
                items: hom
                    .map(
                      (e) =>
                      Image(
                        image: AssetImage(e.image),
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                )
                    .toList(),
                options: CarouselOptions(
                  viewportFraction: 0.9,
                  enlargeCenterPage: true,
                  height: 200,
                  initialPage: 0,
                  aspectRatio: 16/9,
                  reverse: false,
                  enableInfiniteScroll: true,
                  autoPlay: true,
                  autoPlayInterval: const Duration(
                    seconds: 3,
                  ),
                  autoPlayAnimationDuration: const Duration(
                    seconds: 1,
                  ),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  scrollDirection: Axis.horizontal,
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Padding(
                padding: const EdgeInsetsDirectional.only(top: 10.0,end: 10.0,start: 10.0),
                child: GestureDetector(
                  onTap: () {
                    navigatorTo(context, history_choices());
                  },
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
                    child: const Row(
                      children: [
                        SizedBox(width: 20.0,),
                        Image(
                          image: AssetImage('assets/images/Cart/medical_history.png'),
                          width: 40,
                          height: 40,
                          // fit: BoxFit.cover,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          'Medical History',
                          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                        Spacer(),
                        Icon(
                          Icons.arrow_forward_ios,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.only(top: 10.0,end: 10.0,start: 10.0),
                child: GestureDetector(
                  onTap: () {
                    navigatorTo(context,  CheckWeightScreen());
                  },
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
                    child: const Row(
                      children: [
                        SizedBox(width: 20.0,),
                        Image(
                          image: AssetImage('assets/images/CheckWeight/CheckWeight.png'),
                          width: 40,
                          height: 40,
                          // fit: BoxFit.cover,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          'Check Perfect Weight ',
                          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                        Spacer(),
                        Icon(
                          Icons.arrow_forward_ios,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: GestureDetector(
                  onTap: () {
                    navigatorTo(context,  Locationscreen());
                  },
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
                    child: const Row(
                      children: [
                        SizedBox(width: 20.0,),
                        Image(
                          image: AssetImage('assets/images/Location/Location.png'),
                          width: 40,
                          height: 40,
                          // fit: BoxFit.cover,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          'Pharmacies Locations ',
                          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                        Spacer(),
                        Icon(
                          Icons.arrow_forward_ios,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                      ],
                    ),
                  ),
                ),
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
                      // Image(
                      //   image: AssetImage('assets/images/Location/Location.png'),
                      //   width: 40,
                      //   height: 40,
                      //   // fit: BoxFit.cover,
                      // ),
                      const SizedBox(
                        width: 20,
                      ),
                      const Text(
                        'Your Points',
                        style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      const Spacer(),
                      Text(
                        '$points',
                        style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Articles',
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w800,
                          fontFamily: 'Janna'),
                    ),
                    SizedBox(
                      height: 90,
                      child: ListView.separated(
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index) =>
                            buildArticlesItem(

                                cat[index],context),
                        separatorBuilder: (BuildContext context, int index) =>
                            const SizedBox(
                              width: 10,
                            ),
                        itemCount: cat.length,
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),

                  ],
                ),
              ),
            ],
          ),
        ),
      );

  Widget buildArticlesItem(CategoriesModel model,context) =>
      Padding(

        padding: const EdgeInsets.all(1.0),
        child: GestureDetector(
          onTap: () {
            navigatorTo(context, model.widget);
          },
          child: Container(
            // color:Colors.white70,
            height: 90,
            width: 90,
            decoration: BoxDecoration(
              boxShadow:[
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2), //color of shadow
                  spreadRadius: 1, //spread radius
                  // blurRadius: 10, // blur radius
                  offset: const Offset(0, 1), // changes position of shadow
                ),
              ],
            borderRadius: BorderRadius.circular(15.0),
                color:Colors.white
            ),
            child: Stack(
              alignment: AlignmentDirectional.bottomCenter,
              children: [

                ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: Image(

                    image: AssetImage(model.image),
                    height: 90,
                    width: 90,
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  color: Colors.white10.withOpacity(0.6),
                  width: 100,
                  child: Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Text(
                      model.title,
                      style: const TextStyle(
                        color: Colors.black87,
                        fontSize: 10.0,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                      // maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
                const SizedBox(height: 10.0),
              ],
            ),
          ),
        ),
      );


}

