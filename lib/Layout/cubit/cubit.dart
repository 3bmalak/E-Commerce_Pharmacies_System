import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduatio_project/Layout/cubit/states.dart';
import 'package:graduatio_project/Layout/pharmacy/Cubit/PharmacyCubit.dart';
import 'package:graduatio_project/Models/FeedbackModel.dart';
import 'package:graduatio_project/Models/getDataData.dart';
import 'package:graduatio_project/Models/historymodel.dart';
import 'package:graduatio_project/Modules/Home/HomeScreen.dart';
import 'package:graduatio_project/Shared/Network/End_Points/end_points.dart';
import 'package:graduatio_project/Shared/Network/local/cache_Helper.dart';
import 'package:uuid/uuid.dart';
import '../../Models/PharmacyModel.dart';
import '../../Modules/Home/Categories/Categories.dart';
import '../../Modules/Home/Favorites/favourites_screen.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitState());
  static HomeCubit get(context) => BlocProvider.of(context);
  int CurrentIndix = 0;
  List<Widget> Screen = [
    HomeScreen(),
     CategoriesScreen(),
     FavoritesScreen(),

  ];

  void changeScreen({required int indix}) {
    CurrentIndix = indix;
    emit(HomeBottomNavState());
  }

  late TabController _tabController;
  bool loaded = true;
  List<GetDataModel>? medicineData = [];
  List<GetDataModel>? dailyData = [];
  List<GetDataModel>? hairCareData = [];
  List<GetDataModel>? skinCareData = [];
  List<GetDataModel>? momBabyData = [];
  List<GetDataModel>? vitaminsData = [];
  List<GetDataModel>? searchData = [];

  void getFirebase() async {
    //WidgetsFlutterBinding.ensureInitialized();

    emit(CategoriesLoadingState());
    final messages =
        await FirebaseFirestore.instance.collection('Sheet1').get();
    if (allData.isEmpty) {
      for (var message in messages.docs) {
        GetDataModel rowData = GetDataModel.fromJson(message.data());
        for (var sofa in favoritesList) {
          if (rowData.id == sofa.id) {
            rowData.inFavorite = true;
          }
        }

        rowData.cost = double.parse(rowData.cost.toString()).round();
        if (rowData.categories == "Medicines") {
          medicineData?.add(rowData);
        } else if (rowData.categories == "Mom & baby") {
          momBabyData?.add(rowData);
        } else if (rowData.categories == "Vitamins") {
          vitaminsData?.add(rowData);
        } else if (rowData.categories == "Skin care") {
          skinCareData?.add(rowData);
        } else if (rowData.categories == "Hair care") {
          hairCareData?.add(rowData);
        } else if (rowData.categories == "Daily essentials") {
          dailyData?.add(rowData);
        }

        allData.add(rowData);
        // emit(CategoriesSuccessfulState());
      }

      loaded = false;
      emit(ALlCategoriesSuccessfulState());
    }
    print(allData.length);
  }

  void getSearch(data) {
    for (var ss in allData) {
      if (ss.name.contains(data)) {
        searchData?.add(ss);
        emit(SearchSuccessfulState());
      }
    }
  }

  void changeState() {
    emit(CategoriesSuccessfulState());
  }
  List<HistoryModel> historyData=[];

  void getOrdersHistory() async {
    historyData = [];

    var x = await FirebaseFirestore.instance
        .collection('ordersHistory')
        .doc(uId)
        .collection('orders')
        .get();
    for (var d in x.docs) {
      historyData.add(HistoryModel.fromJson(d.data()));
      emit(GetHistoryElementSuccessfulState());
    }

    emit(GetHistoryDataSuccessfulState());
  }


  void createprescription(
      {required var prescriptionid,
      required var userid,
      required var image,
      context}) {
    DateTime now = DateTime.now();
    var currentTime =
        DateTime(now.year, now.month, now.day, now.hour, now.minute);

    prescription_model m = prescription_model(
        prescription_id: prescriptionid,
        userid: userid,
        image: image,
        date: currentTime);
    m.toMap();
    HomeCubit.get(context).getPrescriptionsHistory();
    emit(FavoriteSuccessfulDeletedFromFirebaseState());
  }

  void getPrescriptionsHistory() async {
    prescriptionsData = [];

    var x = await FirebaseFirestore.instance
        .collection('prescriptionsHistory')
        .doc(uId)
        .collection('prescriptions')
        .get();
    for (var d in x.docs) {
      prescriptionsData.add(prescription_model.fromJson(d.data()));
      emit(GetPrescriptionElementSuccessfulState());
    }
    emit(GetPrescriptionDataSuccessfulState());
  }

  void changeFavorite(GetDataModel model) async {
    model.inFavorite = !model.inFavorite;

    if (model.inFavorite) {
      await FirebaseFirestore.instance
          .collection('userFavorites')
          .doc(uId)
          .collection('FavoritesData')
          .doc(model.id.toString())
          .set(model.toMap());
      favoritesList.add(model);
      emit(FavoriteSuccessfulInsertInFirebaseState());
    } else {
      await FirebaseFirestore.instance
          .collection('userFavorites')
          .doc(uId)
          .collection('FavoritesData')
          .doc(model.id.toString())
          .delete()
          .then((value) {
        if (model.categories == "Medicines") {
          medicineData?.forEach((element) {
            if(element.id==model.id){
              element.inFavorite=false;
            }
          });
        } else if (model.categories == "Mom & baby") {
          momBabyData?.forEach((element) {
            if(element.id==model.id){
              element.inFavorite=false;
            }
          });
        } else if (model.categories == "Vitamins") {
          vitaminsData?.forEach((element) {
            if(element.id==model.id){
              element.inFavorite=false;
            }
          });
        } else if (model.categories == "Skin care") {
          medicineData?.forEach((element) {
            if(element.id==model.id){
              element.inFavorite=false;
            }
          });
          skinCareData?.add(model);
        } else if (model.categories == "Hair care") {
          hairCareData?.forEach((element) {
            if(element.id==model.id){
              element.inFavorite=false;
            }
          });
        } else if (model.categories == "Daily essentials") {
          dailyData?.forEach((element) {
            if(element.id==model.id){
              element.inFavorite=false;
            }
          });
        }
            getFavorites();

        emit(FavoriteSuccessfulDeletedFromFirebaseState());
      }).catchError((error) {
        emit(DeleteFavoriteDataErrorState(error));
      });
    }

    emit(ChangeFavoriteSuccessfulState());
  }

  List<GetDataModel> favoritesList = [];
  Future<void> getFavorites() async {
    favoritesList = [];
    var message = await FirebaseFirestore.instance
        .collection('userFavorites')
        .doc(uId)
        .collection('FavoritesData')
        .get();
    for (var a in message.docs) {
      GetDataModel rowData = GetDataModel.fromJson(a.data());
      rowData.inFavorite = true;
      favoritesList.add(rowData);
    }
    emit(getFavoritesDataSuccessfulState());
  }

  void ss(model)
  {

  }

  Map<String, List<PharmacyModel>> pharmaciesDistrict = {};
  void getPharmaciesData() async {
    emit(CategoriesLoadingState());
    final messages =
        await FirebaseFirestore.instance.collection('Sheet2').get();

    for (var message in messages.docs) {
      PharmacyModel rowData = PharmacyModel.fromJson(message.data());
      if (pharmaciesDistrict.isEmpty) {
        List<PharmacyModel> xx = [];
        xx.add(rowData);
        pharmaciesDistrict[rowData.district] = xx;
      } else {
        if (pharmaciesDistrict.containsKey(rowData.district)) {
          List<PharmacyModel> xx = pharmaciesDistrict[rowData.district]!;
          xx.add(rowData);
        } else {
          List<PharmacyModel> xx = [];
          xx.add(rowData);
          pharmaciesDistrict[rowData.district] = xx;
        }
      }

      loaded = false;
      emit(PharmaciesSuccessfulState());
    }
    print(allData.length);
  }

  String selecteditem = '';
  void onChangeDropListItem(item) {
    selecteditem = item;
    emit(PharmaciesChangeDropListItemSuccessfulState());
  }

  dynamic PharmacyId = "wwwwwwww";
  void addFeedback({
    required dynamic rate,
    required dynamic comment,
    required dynamic userName,
    required dynamic type,
    required dynamic p,
    context

  }) async {
    print(PharmacyId);
    FeedbackModel f = FeedbackModel(
        rate: rate, comment: comment, type: type, userName: userName);
    var randomId = const Uuid();
    String x = randomId.v4();
    await FirebaseFirestore.instance
        .collection('pharmacies')
        .doc(PharmacyId)
        .collection("feedback")
        .doc(x)
        .set(f.toMap())
        .then((value) {
      emit(feedbackAddedSuccessfulState());
      updatePharmacyRate(PharmacyId: p);
    }).catchError((onError) {
      emit(feedbackAddedErrorState(onError));
    });
  }

  List<FeedbackModel> positiveFeedbacks=[];
  List<FeedbackModel> negativeFeedbacks=[];
  Future<void> getfeedbacks({
    required dynamic p
  }) async {

    positiveFeedbacks=[];
    negativeFeedbacks=[];

    await FirebaseFirestore.instance
        .collection("pharmacies")
        .doc(p.toString())
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

  Future<void> updatePharmacyRate({
    required dynamic PharmacyId
  }) async {

    getfeedbacks(p: PharmacyId);
    late PharmacyModel p;
    await FirebaseFirestore.instance
        .collection("pharmacies")
        .doc(PharmacyId).get().then((value) {
      p=PharmacyModel.fromJson(value.data());
    });
    print(p.rate);
    p.rate= ((double.parse(positiveFeedbacks.length.toString())/(double.parse(positiveFeedbacks.length.toString())+double.parse(negativeFeedbacks.length.toString())))*5).toString();
    print(p.rate);
    await FirebaseFirestore.instance
        .collection("pharmacies")
        .doc(PharmacyId.toString()).
    update(p.toMap( ));
    await FirebaseFirestore.instance
        .collection("Sheet2")
        .doc(PharmacyId.toString()).
    update(p.toMap( ));


  }
}
