import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter/cupertino.dart';
import 'package:graduatio_project/Models/FeedbackModel.dart';
import 'package:graduatio_project/Models/PharmacyModel.dart';
import 'package:graduatio_project/Modules/PharmacyHome/InProgress/InProgressScreen.dart';
import 'package:graduatio_project/Modules/PharmacyHome/Requests/RequestsScreen.dart';
import 'package:graduatio_project/Modules/PharmacyHome/Settings/Settings_Screen.dart';
import '../../../Models/historymodel.dart';
import '../../../Modules/PharmacyHome/Feedbacks/FeedBackScreen.dart';
import '../../../Shared/Network/End_Points/end_points.dart';
import 'PharmacyStates.dart';

class PharmacyHomeCubit extends Cubit<PharmacyHomeStates>
{
  PharmacyHomeCubit() : super(PharmacyInitState());
  static PharmacyHomeCubit get(context) => BlocProvider.of(context);

  int CurrentIndix=0;
  List <Widget> Screen=
  [
     InProgressScreen(),
     FeedBackScreen(),
     SettingsScreen()
  ];

  void changeScreen({required int indix})
  {
    CurrentIndix=indix;
    emit(HomeBottomNavState());
  }
  List<HistoryModel> Request=[];

  void getOrdersRequests() async {
    Request=[];
     await FirebaseFirestore.instance
        .collection("pharmacies")
        .doc(fId.toString())
        .collection('orders')
        .get().then((value) {
      value.docs.forEach((element) {
        Request.add(HistoryModel.fromJson(element.data()));
print(element.data());
      });
    });

    emit(requestsgettedsuccesfully());
  }

  List<FeedbackModel> positiveFeedbacks=[];
  List<FeedbackModel> negativeFeedbacks=[];

  Future<void> getFeedbacks() async {

    positiveFeedbacks=[];
    negativeFeedbacks=[];

    await FirebaseFirestore.instance
        .collection("pharmacies")
        .doc(fId.toString())
        .collection('feedback')
        .get().then((value)
    {
      value.docs.forEach((element) {
        FeedbackModel h=FeedbackModel.fromJson(element.data());
        print(h.type);
        if(h.type.toString()=="postive"||h.type.toString()=="Postive" || h.type.toString()=="Possitive"){
          positiveFeedbacks.add(h);
        }
        else{
          negativeFeedbacks.add(h);
        }
      });
      emit(getFeedbackSuccesfully());
    });
  }

 }