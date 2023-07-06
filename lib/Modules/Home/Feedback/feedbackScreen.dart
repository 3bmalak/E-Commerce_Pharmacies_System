import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:graduatio_project/Layout/Home_Layout.dart';
import 'package:graduatio_project/Layout/cubit/cubit.dart';
import 'package:graduatio_project/Layout/cubit/states.dart';
import 'package:graduatio_project/Shared/Components/Component.dart';
import 'package:graduatio_project/Shared/Network/End_Points/end_points.dart';
import 'Sentiment/Function.dart';



String url='';
var data;
String output="";


class FeedbackScreen extends StatefulWidget {
  const FeedbackScreen({Key? key}) : super(key: key);

  @override
  State<FeedbackScreen> createState() => _FeedbackScreenWidget();
}

   TextEditingController feedbackController = TextEditingController();

  class _FeedbackScreenWidget extends State<FeedbackScreen>{

    double rating = 0;

  @override
  Widget build(BuildContext context) {

    return BlocConsumer<HomeCubit,HomeStates>(
      listener: (context, state) {

      },
      builder: (context, state) {
        HomeCubit cubit=HomeCubit.get(context);


       return Scaffold(

          appBar: AppBar(
            title: const Text('FeedBack & Rating'),
            centerTitle: true,
            backgroundColor: Colors.indigo,
          ),
          body: Padding(
            padding: const EdgeInsets.all(35.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const Image(image: AssetImage('assets/images/ss.jpg'),
                    width: double.infinity,
                    fit: BoxFit.cover,),
                  const SizedBox(height: 50.0,),
                  Container(
                    //color: Colors.lightBlueAccent,
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: Colors.indigo,
                          width: 2.0,
                          style: BorderStyle.solid
                      ),
                      borderRadius: BorderRadius.circular(20),
                      //color: Colors.yellowAccent,
                    ),
                    //color: Colors.lightBlueAccent,
                    child: Column(
                      children: [
                        const Text(
                            'Rating',
                            style: TextStyle(fontSize: 25,color: Colors.indigo)),
                        const SizedBox(height: 13.0,),
                        RatingBar.builder(
                          itemCount: 5,
                          initialRating: 1,
                          minRating: 1,
                          itemSize: 50,
                          allowHalfRating: true,
                          itemPadding: const EdgeInsets.symmetric(horizontal: 8),
                          itemBuilder: (context,index)=>const Icon(
                            Icons.star,
                            color: Colors.indigo,
                          ),
                          updateOnDrag: true,
                          onRatingUpdate:(value){
                            setState(() {
                              rating = value;
                              print(rating);
                            });
                        },),
                        const SizedBox(height: 13.0,),
                        Text('$rating', style: TextStyle(fontSize: 25,color: Colors.indigo)),
                      ],
                    ),
                  ),
                  const SizedBox(height: 50.0,),
                  Container(
                    child: Column(
                      children: [
                        TextFormField(
                          controller: feedbackController,
                          decoration: const InputDecoration(labelText: 'Enter FeedBack'),
                          style: const TextStyle(fontSize: 20),
                          keyboardType: TextInputType.multiline,
                          minLines: 1,
                          onChanged: (value) {
                            url='';
                            url='http://10.0.2.2:5000/api?query=$value';

                          },// <-- SEE HERE
                          maxLines: null, // <-- SEE HERE
                        ),
                        const SizedBox(height: 25.0,),
                        MaterialButton(
                            color: Colors.indigo,
                            child: const Text(
                              ' SUBMIT',
                              style: TextStyle(color: Colors.white,fontSize: 20),
                            ),
                            onPressed: () async {





                              data = await fetchdata(url);
                              var decoded = jsonDecode(data);
                              output = decoded['output'];
                              print(userData!.name.toString());
                              cubit.addFeedback(rate: rating.toString(),
                                  comment: feedbackController.text,
                                  userName: userData!.name.toString(),
                                  type: output.toString(),
                                  p: cubit.PharmacyId,
                                  context: context
                              );
                              cubit.changeState();
                              cubit.changeScreen(indix: 0);
                              navigatorAndFinish(context,  HomeLayout());

                            }
                        ),

                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
