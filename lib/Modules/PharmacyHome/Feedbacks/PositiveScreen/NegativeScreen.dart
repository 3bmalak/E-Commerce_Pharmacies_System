import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduatio_project/Layout/cubit/cubit.dart';
import 'package:graduatio_project/Layout/cubit/states.dart';
import 'package:graduatio_project/Layout/pharmacy/Cubit/PharmacyCubit.dart';
import 'package:graduatio_project/Layout/pharmacy/Cubit/PharmacyStates.dart';
import 'package:graduatio_project/Models/FeedbackModel.dart';
import 'package:graduatio_project/Models/PharmacyModel.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';



class NegativeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PharmacyHomeCubit, PharmacyHomeStates>(
      listener: (context, state) {},
      builder: (context, state) {
        PharmacyHomeCubit cubit =PharmacyHomeCubit.get(context);


        return Scaffold(

          body: Column(

            children: [
              SizedBox(height: 20,),
              Expanded(
                  child: ListView.separated(
                    itemCount: cubit.negativeFeedbacks.length,
                    itemBuilder: (BuildContext context, int index) =>
                        bulidLocationList(context,cubit.negativeFeedbacks[index]),
                    separatorBuilder: (BuildContext context, int index) =>
                        Container(),
                  ))

            ],
          ),
        );
      },
    );
  }
}

Widget bulidLocationList(context,FeedbackModel model) => Padding(
  padding: const EdgeInsets.all(7.0),
  child: Container(
    height: 100.0,
    width: double.infinity,
    decoration: BoxDecoration(boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.5), //color of shadow
        spreadRadius: 1, //spread radius
        blurRadius: 5, // blur radius
        offset: const Offset(0, 1), // changes position of shadow
      ),
    ], borderRadius: BorderRadius.circular(10.0), color: Colors.white),
    child:  Row(
      children: [
        const Padding(
          padding:
          EdgeInsetsDirectional.only(start: 10.0, end: 20.0),

        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [

                  Text(
                    model.userName,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: RatingBar.builder(
                      onRatingUpdate: (value) {

                      },
                      ignoreGestures: true,
                      itemCount: 5,
                      initialRating:double.parse(model.rate) ,
                      minRating: 1,
                      itemSize: 15,
                      allowHalfRating: true,
                      itemPadding: const EdgeInsets.symmetric(horizontal: 2),
                      itemBuilder: (context,index)=>const Icon(

                        Icons.star,
                        color: Colors.yellow,
                      ),
                      updateOnDrag: true,
                    ),
                  ),

                ],
              ),
              const SizedBox(
                height: 10.0,
              ),
              Text(
                model.comment.toString(),
                style: const TextStyle(
                    color: Colors.indigo, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20,),

            ],
          ),
        ),
      ],
    ),
  ),
);
