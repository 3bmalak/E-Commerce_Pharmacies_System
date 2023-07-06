import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduatio_project/Layout/cubit/cubit.dart';
import 'package:graduatio_project/Layout/cubit/states.dart';
import 'package:graduatio_project/Models/historymodel.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

import '../../../Shared/Network/End_Points/end_points.dart';

class prescription_page extends StatelessWidget {
  String imageurl="";
  prescription_page({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit,HomeStates>(
      listener: (context, state) {

      },
      builder: (context, state) {

        return  Scaffold(
            appBar: AppBar(title: const Text('Medical History'),),
            body:ListView.separated(
              shrinkWrap: true,
              itemBuilder: (context, index) =>buildPrescriptionList(model: prescriptionsData[index],context: context),
              itemCount: prescriptionsData.length,
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(
                  height: 11,
                );
              },
            ),
          floatingActionButton: FloatingActionButton(onPressed: () async {
            ImagePicker im=ImagePicker();
            XFile? file =await im.pickImage(source: ImageSource.gallery);
            String uniquefilename=DateTime.now().millisecondsSinceEpoch.toString();
            Reference ref=FirebaseStorage.instance.ref();
            Reference dirimage=ref.child('images');
            Reference imagetoupload=dirimage.child(uniquefilename);
            try{
              await imagetoupload.putFile(File(file!.path));
              imageurl=await imagetoupload.getDownloadURL();
              prescriptionsData=[];

              HomeCubit.get(context).createprescription(context: context,prescriptionid: Random().nextInt(4294967296).toString(), userid: uId,image: imageurl);

            }catch(error){}
          },

            child: const Icon(Icons.upload_rounded,
              size: 35,),
          ),
        );
      },
    );
  }
  Widget buildPrescriptionList({required prescription_model model,context}) =>
      Container(
        decoration: BoxDecoration(border: Border.all(color: Colors.black45,style: BorderStyle.solid,width: 1),borderRadius: BorderRadius.circular(15.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 3.0,
              blurRadius: 5.0,
            )
          ],
          color: Colors.indigo
        ),
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.only(top: 5,right: 5,left: 5),
        child: SizedBox(
          width: 200,
          child: Column(
            children: [
              Text("prescription id: ${double.parse(model.prescription_id.toString())}",style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white)),
              const SizedBox(
                height: 5,
              ),
              Text('Date: ${DateTime.fromMillisecondsSinceEpoch(int.parse(model.date.toString().substring(18,28))*1000)}',style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white)),
              const SizedBox(
                height: 5,
              ),
              SizedBox(
                width: 200,
                child: Image.network('${model.image}',
                  height: 200,
                  width: 200,
                  errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {

                    return const Image(image: AssetImage('assets/images/Medicine-Pills-Free-PNG.png'),height: 200,);

                  },

                ),

              ),
            ],
          ),
        ),
      );
}