import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduatio_project/Layout/pharmacy/Cubit/PharmacyCubit.dart';
import 'package:graduatio_project/Layout/pharmacy/Cubit/PharmacyStates.dart';


class RequestScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PharmacyHomeCubit,PharmacyHomeStates>(
      listener: (context, state) {


      },
      builder: (context, state) {

        return  const Scaffold(
          body: Text('Requests'),
        )  ;
      },
    );
  }
}
