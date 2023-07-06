import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduatio_project/Layout/cubit/cubit.dart';
import 'package:graduatio_project/Layout/cubit/states.dart';
import 'package:graduatio_project/Models/PharmacyModel.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../../../Shared/Components/Component.dart';
import '../CheckOut/CheckOutScreen.dart';

class Locationscreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {},
      builder: (context, state) {
        bool x = false;
        if (HomeCubit.get(context).selecteditem == '') {
          x = false;
        } else {
          x = true;
        }

        HomeCubit cubit = HomeCubit.get(context);
        print(cubit.pharmaciesDistrict.keys.toList());
        var pharmacyList =
            HomeCubit.get(context).pharmaciesDistrict[cubit.selecteditem];
        return Scaffold(
          appBar: AppBar(
            title: const Text("Pharmacy Locations"),
            centerTitle: true,
          ),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  //padding: EdgeInsets.all(2),
                  margin: const EdgeInsets.only(top: 5, bottom: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Colors.black),
                  ),
                  child: DropdownSearch<String>(
                    popupProps: const PopupProps.dialog(
                      showSelectedItems: true,
                      showSearchBox: true,
                    ),
                    items: cubit.pharmaciesDistrict.keys.toList(),
                    dropdownDecoratorProps: const DropDownDecoratorProps(
                      dropdownSearchDecoration: InputDecoration(
                          labelText: "  Choose a District",
                          labelStyle: TextStyle(
                              fontSize: 22,
                              color: Colors.indigo,
                              fontWeight: FontWeight.bold),
                          hintText: "  Choose a District",
                          hintStyle:
                              TextStyle(fontSize: 22, color: Colors.indigo)),
                    ),
                    onChanged: (value) {
                      cubit.onChangeDropListItem(value);
                    },
                    selectedItem: "  ${cubit.selecteditem}",
                  ),
                ),
              ),
              x
                  ? Expanded(
                      child: ListView.separated(
                      padding: const EdgeInsets.all(1),
                      itemCount: pharmacyList!.length,
                      itemBuilder: (BuildContext context, int index) =>
                          bulidLocationList(context, pharmacyList[index]),
                      separatorBuilder: (BuildContext context, int index) =>
                          Container(),
                    ))
                  : Container(),
            ],
          ),
        );
      },
    );
  }
}

Widget bulidLocationList(context, PharmacyModel model) => Padding(
      padding: const EdgeInsets.all(7.0),
      child: GestureDetector(
        onTap: () {
          HomeCubit.get(context).PharmacyId = "";
          HomeCubit.get(context).PharmacyId = model.uId;
          print(model.uId);
          navigatorTo(context,  RadioGroup( HomeCubit.get(context).PharmacyId ,));
        },
        child: Container(
          height: 70.0,
          width: double.infinity,
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5), //color of shadow
              spreadRadius: 1, //spread radius
              blurRadius: 5, // blur radius
              offset: const Offset(0, 1), // changes position of shadow
            ),
          ], borderRadius: BorderRadius.circular(10.0), color: Colors.white),
          child: Row(
            children: [
              const Padding(
                padding:
                    EdgeInsetsDirectional.only(start: 15.0, end: 10.0),
                child: Icon(
                  Icons.local_pharmacy,
                  color: Colors.indigo,
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      model.pharmacyname.toString(),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Row(
                      children: [
                        Text(
                          model.telephonenumber.toString(),
                          style: const TextStyle(
                              color: Colors.indigo, fontWeight: FontWeight.bold),
                        ),
                        // SizedBox(width: 80,),
                        Spacer(),

                        RatingBar.builder(
                          onRatingUpdate: (value) {

                          },
                          ignoreGestures: true,
                          itemCount: 5,
                          initialRating:double.parse(model.rate.toString()) ,
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
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.only(end: 10.0),
                child: IconButton(
                  icon: const Icon(Icons.location_on),
                  color: Colors.indigo,
                  onPressed: () {
                    launch(model.locationlink);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
