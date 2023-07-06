import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduatio_project/Layout/cubit/cubit.dart';
import 'package:graduatio_project/Layout/pharmacy/Pharmacy_home_Layout.dart';
import 'package:graduatio_project/Modules/Home/Cart/cubit/CartCubit.dart';
import '../../../Layout/Home_Layout.dart';
import '../../../Shared/Components/Component.dart';
import '../../../Shared/Network/End_Points/end_points.dart';
import '../../../Shared/Network/local/cache_Helper.dart';
import 'LoginStates.dart';

import 'package:graduatio_project/Models/userModel.dart';





class LoginCubit extends Cubit<LoginStates>{
  LoginCubit():super(ShopLoginInitState());
  static LoginCubit get(context) => BlocProvider.of(context);
  bool isPasswordIconChecked=true;
  bool isCreated=false;

  void createIconEye(){
    isCreated=true;
    emit(isPasswordIconCreatedLoginState());

  }
  void ChangePasswordVisability(){
    isPasswordIconChecked =! isPasswordIconChecked;
    emit(isPasswordIconCheckedLoginState());
  }


  void userLogin({
    required String email,
    required String password,
    context
  })
  {

    emit(LoginLoadingState());
    FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password
    ).then((value) {
      FirebaseFirestore.instance.collection("users").
      doc(value.user!.uid.toString()).
      get().then((s) {

        if(s.data()!=null){
        CacheHelper.SaveData(key: "uId", value: value.user!.uid.toString());
        toast(message: "Login Successfully", color: Colors.green);
        navigatorAndFinish(context,  HomeLayout());
        getUserData();
        emit(LoginSuccessState());}
        else {
          // toast(message: "Wrong Email or Password", color: Colors.red);
          throw Exception();
        }

      }) .catchError((error){
        toast(message: "Wrong Email or Password", color: Colors.red);

        emit(LoginErrortState(error.toString()));

      });


    });

  }

  void getUserData() async {
    emit(UserGetDataLoadingState());
    userData=null;
    var x= await  FirebaseFirestore.instance.collection('users').doc(uId).get();

    userModel userdata=userModel.fromJson(x.data());
    userData=userdata;
    print(userData!.name);
  }

  void getPharmaciesData() async {
    emit(UserGetDataLoadingState());
    var x= await  FirebaseFirestore.instance.collection('pharmacies').doc(uId).get();
    userData=userModel.fromJson(x.data());
    print(userData!.phone);
  }

  void pharmacyLogin({
    required String email,
    required String password,
    context
  })
  {

    emit(LoginLoadingState());

    FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password
    ).then((value) {
      // toast(message: "Login Successfully", color: Colors.green);

      FirebaseFirestore.instance.collection("pharmacies").
      doc(value.user!.uid.toString()).
      get().
      then((s) {
        print(s);
        CacheHelper.SaveData(key: "fId", value: value.user!.uid.toString());
        toast(message: "Login Successfully", color: Colors.green);
        navigatorAndFinish(context,  PharmacyHomeScreen());
        emit(LoginSuccessState());

      }).catchError((error){
        toast(message: "Wrong Email or Password", color: Colors.red);

        emit(LoginErrortState(error.toString()));

      });
    });
  }

  void Changestate(){
    emit(ShopLoginInitState());
  }


}