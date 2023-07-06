import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduatio_project/Models/NewPharmacy.dart';
import 'package:graduatio_project/Models/PharmacyModel.dart';
import '../../../Models/userModel.dart';
import '../../../Shared/Network/local/cache_Helper.dart';
import 'RegisterStates.dart';

class RegisterCubit extends Cubit<RegisterStates>{
  RegisterCubit():super(RegisterInitState());
  static RegisterCubit get(context) => BlocProvider.of(context);
  bool isPasswordIconChecked=true;


  void ChangePasswordVisability(){
    isPasswordIconChecked =! isPasswordIconChecked;
    emit(isPasswordIconCheckedRegisterState());
  }

  void userRegister({
    required String email,
    required String password,
    required String name,
    required String phone,
  }){

    emit(RegisterLoadingState());
    FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password
    ).then((value) {

      print(value.user!.email.toString());
      print(value.user!.uid.toString());
      createUser(email: email, phone: phone, name: name, uId: value.user!.uid.toString());
      CacheHelper.SaveData(key: "uId", value: value.user!.uid.toString());
      emit(RegisterSuccessState());
    })
        .catchError((error){
      emit(RegisterErrortState(error.toString()));
    });


  }

 void createUser({
    required String email,
    required String phone,
    required String name,
    required String uId,
  }){

    userModel m =userModel(name: name, phone: phone, email: email, uId: uId);
  FirebaseFirestore.instance.collection('users').
  doc(uId).
  set(m.toMap()).then((value) {
    emit(CreateUserSuccessState());

  }).catchError((error){
    print(error.toString());
    emit(CreateUserErrortState(error.toString()));

  });


  }


  void pharmacyRegister({
    required String email,
    required String password,
    required  dynamic district,
    required dynamic pharmacyname,
    required dynamic locationlink,
    required dynamic locationtext,
    required dynamic telephonenumber,
    required dynamic rate,
  }){

    emit(RegisterLoadingState());
    FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password
    ).then((value) {

      print(value.user!.email.toString());
      print(value.user!.uid.toString());
      createPharmacy(uId: value.user!.uid.toString(), email: email, district: district, pharmacyname: pharmacyname, locationlink: locationlink, locationtext: locationtext, telephonenumber: telephonenumber, rate: rate);
      CacheHelper.SaveData(key: "uId", value: value.user!.uid.toString());

      emit(RegisterSuccessState());
    })
        .catchError((error){
      emit(RegisterErrortState(error.toString()));
    });


  }

  void createPharmacy({
  required dynamic uId,
  required dynamic email,
  required  dynamic district,
  required dynamic pharmacyname,
  required dynamic locationlink,
  required dynamic locationtext,
  required dynamic telephonenumber,
  required dynamic rate,
}){
  Pharmacy m = Pharmacy(email: email, district: district, pharmacyname: pharmacyname, locationlink: locationlink, telephonenumber: telephonenumber, locationtext: locationtext, rate: rate);
  PharmacyModel p=PharmacyModel(district: district, pharmacyname: pharmacyname, locationlink: locationlink, telephonenumber: telephonenumber, locationtext: locationtext, rate: rate,uId: uId);
  FirebaseFirestore.instance.collection('pharmacies').
  doc(uId).
  set(m.toMap()).then((value) {
    emit(CreatePharmacySuccessState());
  }).catchError((error){
    print(error.toString());
    emit(CreatePharmacyErrorState(error.toString()));

  });

  FirebaseFirestore.instance.collection('Sheet2').
  doc(uId).
  set(p.toMap()).then((value) {
    emit(AddPharmacyToSheet2SuccessState());
  }).catchError((error){
    print(error.toString());
    emit(AddPharmacyToSheet2ErrorState(error.toString()));

  });
}
}