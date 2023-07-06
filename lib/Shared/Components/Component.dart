

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:graduatio_project/Models/getDataData.dart';
import '../../Layout/cubit/cubit.dart';

import '../Network/End_Points/end_points.dart';


Widget DefaultButton(
    {
      double width=double.infinity,
      Color Background=Colors.indigo,
      required String text,
      required VoidCallback function,
      var fontcolor=Colors.white,
      var height=50.0,

    })=> Container(

          width: width,
          decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color:Background
          ),
          child:
              MaterialButton(

                height: height,
                  onPressed: function,
                  child: Text(
                    text,
                    style: TextStyle(
                      fontSize: 15.0,
                      color: fontcolor,
                      fontWeight:FontWeight.bold,
          ),
),
),
);

Widget DefaultTFF(
    {
  required TextEditingController Controller,
  required TextInputType Keyboard,
  ValueChanged<String>? OnSubmit,
  ValueChanged<String>? OnChange,
  required FormFieldValidator<String> Validate,
  IconData? PrefixIcon,
  IconData? SufffixIcon ,
  required String Label,
      dynamic width=double.infinity,
  VoidCallback? SuffixFunction,
  bool IsPassword=false,
  GestureTapCallback? onTap,
  bool onChecked=true
})=>
    SizedBox(
         width:width,

        child:   TextFormField(
          controller: Controller ,
          keyboardType:Keyboard,
          onFieldSubmitted: OnSubmit,
          onChanged: OnChange,
          validator: Validate,
          obscureText: IsPassword,
          onTap: onTap,
          enabled: onChecked,
          decoration: InputDecoration(
            labelText: Label,
            prefixIcon: Icon(PrefixIcon),
            suffixIcon:  IconButton(
              onPressed: SuffixFunction
              , icon: Icon(SufffixIcon)
            ),

            border:const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10))

            ),
          ),
        ),
      );

Widget DefaultEmptyTFF(
    {
  required TextEditingController Controller,
  required TextInputType Keyboard,
  ValueChanged<String>? OnSubmit,
  ValueChanged<String>? OnChange,
  required FormFieldValidator<String> Validate,
  IconData? PrefixIcon,
  IconData? SufffixIcon ,
  required String Label,
      dynamic width=double.infinity,
  VoidCallback? SuffixFunction,
  bool IsPassword=false,
  GestureTapCallback? onTap,
  bool onChecked=true
})=>
    SizedBox(
         width:width,

        child:   TextFormField(
          controller: Controller ,
          keyboardType:Keyboard,
          onFieldSubmitted: OnSubmit,
          onChanged: OnChange,
          validator: Validate,
          obscureText: IsPassword,
          onTap: onTap,
          enabled: onChecked,
          decoration: InputDecoration(
            labelText: Label,

            border:const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))
            ),
          ),
        ),
      );

Widget MyDivider()=>Container(
  width: double.infinity,
  height: 1.0,
  color: Colors.grey[300],
);

void navigatorTo(context,widget) => Navigator.push(
    context,
    MaterialPageRoute(builder:(context) =>  widget,)
);

void navigatorAndFinish(context,widget) => Navigator.pushAndRemoveUntil(
  context,
    MaterialPageRoute(builder:(context) =>  widget,),
      (route)=>false
);


int counter=0;
List<int> count=[];
Widget buildCategoriesList(GetDataModel model,Context, cubit) => Padding(
    padding: const EdgeInsets.only(top: 3.0,bottom:5 ,left:5 ,right:5 ),
    child: Container(
      width: 150.0,
      height: 200.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 3.0,
            blurRadius: 5.0,
          )
        ],
        color: Colors.white,
      ),
      child: Column(
        children: [
          Container(
            height: 30,
            padding: const EdgeInsets.only(top: 5),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                IconButton(
                  icon:  Icon(
                    Icons.favorite,
                    color: model.inFavorite?Colors.red: Colors.grey,
                    size: 20,
                  ),
                  tooltip: 'Add to favourites',
                  onPressed: () {
                    HomeCubit.get(Context).changeFavorite(model);
                    // FavouriteData.add(model);
                  },
                ),
                ]
            ),
          ),
          //'${model.image}'
          Image.network('${model.image}',
            height: 80,
            width: 100,
            errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
              return const Image(image: AssetImage('assets/images/Medicine-Pills-Free-PNG.png'),height: 80,);
            },
          ),
          const SizedBox(height: 7.0),
          Padding(
            padding: const EdgeInsets.all(7.0),
            child: Text(model.name,style:const TextStyle(color: Colors.indigo,fontWeight: FontWeight.bold,fontSize: 15),softWrap: true,textAlign: TextAlign.center,    maxLines: 1,
              overflow: TextOverflow.ellipsis,),
          ),
          const SizedBox(height: 4.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(model.cost.toString(),style:const TextStyle(color: Colors.indigo,fontSize: 15),),
              const Text(" EGP",style:TextStyle(color: Colors.indigo,fontSize: 15)),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(7.0),
            child: Container(
                color: Colors.grey[300],
                height: 1.0
            ),
          ),
          GestureDetector(

            behavior: HitTestBehavior.opaque,
            onTap: (){


              if (CartData!=null) {
                var t=true;
                for (var x in CartData){
                  if(x.id==model.id){
                   t=false;
                   x.count+=1;
                   break;
                  }
                }
                if(t==true){
                  model.count += 1;
                  CartData.add(model);
                }
              }
              else {
                model.count+=1;
                CartData.add(model);
              }
              toast(message: "Added Successfully", color: Colors.grey);
              HomeCubit.get(Context).changeState();
          },
            child: const Padding(
              padding: EdgeInsets.only(left: 5,right: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(Icons.shopping_cart, color: Colors.indigo,size: 17),
                  Text("Add to Cart",style:TextStyle(color: Colors.indigo,fontSize: 17,fontWeight: FontWeight.bold) ,),
                ],
              ),
            ),
          )
        ],
      ),

    ),
  );


void toast({
  required String message,
  required Color color,

}) => Fluttertoast.showToast(
msg: message,
toastLength: Toast.LENGTH_LONG,
gravity: ToastGravity.BOTTOM,
timeInSecForIosWeb: 5,
backgroundColor:color,
textColor: Colors.white,
fontSize: 16.0,
);

void printFullText(String text){
  final pattern=RegExp('.{1,800}');
  pattern.allMatches(text).forEach((match) =>print(match.group(0)));
}

