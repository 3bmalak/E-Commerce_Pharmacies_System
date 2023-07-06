import 'package:cloud_firestore/cloud_firestore.dart';
import '../Shared/Network/End_Points/end_points.dart';
import 'getDataData.dart';

class HistoryModel
{
  dynamic cartid;
  dynamic userid;
  dynamic totalcost;
  List<GetDataModel>? products ;
  HomeDataModel? data;
  dynamic date;
  dynamic location;
  dynamic phone;


  HistoryModel({
    required this.cartid,
    required this.userid,
    required this.products,
    required this.totalcost,
    required this.date,
    required this.location,
    required this.phone,
  });

  HistoryModel.fromJson(Map<String, dynamic> json)
  {
  cartid= json['cartid'];
  userid= json['userid'];
  totalcost= json['totalcost'];
  data= HomeDataModel.fromJson(json['data']) ;
  date= json['date'];
  location= json['location'];
  phone= json['phone'];


  }

  void toMap()
   {
    List<Map<String, dynamic>> dataToBeSent=[];
    Map<String, dynamic>? youssef ;
    youssef={
      'cartid':cartid,
      'userid':userid,
      'totalcost':totalcost,
      'date':date,
    };
    FirebaseFirestore.instance.collection('ordersHistory').doc(uId).collection('orders').doc(cartid).set(youssef);
      dataToBeSent.add({
        'data':{
        'products': {
        for(int a = 0; a < CartData.length; a++){


        "name": CartData[a].name,
        "image": CartData[a].image,
        "id": CartData[a].id,
        "categories": CartData[a].categories,
        "cost": CartData[a].cost,
        "quantity": CartData[a].count,


    }
        }
    }
      }
     );
      FirebaseFirestore.instance.collection('ordersHistory').doc(uId).collection('orders').doc(cartid).update(dataToBeSent[dataToBeSent.length-1]);
   }
  void toMap2({
  required dynamic pharmacyId,
})
  {
    List<Map<String, dynamic>> dataToBeSent=[];
    Map<String, dynamic>? youssef ;
    youssef={
      'cartid':cartid,
      'userid':userid,
      'totalcost':totalcost,
      'date':date,
      'location':location,
      'phone':phone,
    };
    FirebaseFirestore.instance.collection('pharmacies').doc(pharmacyId).collection('orders').doc(cartid).set(youssef);
    dataToBeSent.add({
      'data':{
        'products': {
          for(int a = 0; a < CartData.length; a++){


            "name": CartData[a].name,
            "image": CartData[a].image,
            "id": CartData[a].id,
            "categories": CartData[a].categories,
            "cost": CartData[a].cost,
            "quantity": CartData[a].count,


          }
        }
      }
    }
    );
    FirebaseFirestore.instance.collection('pharmacies').doc(pharmacyId).collection('orders').doc(cartid).update(dataToBeSent[dataToBeSent.length-1]);
  }
}


class prescription_model
{
  dynamic prescription_id;
  dynamic image;
  dynamic userid;
  dynamic date;


  prescription_model({
    required this.prescription_id,
    required this.image,
    required this.userid,
    required this.date,
  });

  prescription_model.fromJson(Map<String, dynamic> json)
  {
    prescription_id= json['prescriptionid'];
    image=json['image'];
    userid= json['userid'];
    date= json['date'];
  }
  void toMap()
  {
    Map<String, dynamic>? prescriptiondata ;
    prescriptiondata={
      'prescriptionid':prescription_id,
      'image':image,
      'userid':userid,
      'date':date,
    };
    FirebaseFirestore.instance.collection('prescriptionsHistory').doc(uId).collection('prescriptions').doc(prescription_id).set(prescriptiondata);
  }
}
class HomeDataModel
{

  List<Products> products=[];

  HomeDataModel.fromJson(Map<String,dynamic> json)
  {
    print("object");
    json['products'].forEach((element)
    {
      products.add( Products.fromJson(element));
    }
    );
  }
}
class Products
{
  dynamic id;
  dynamic image;
  dynamic cost;
  dynamic name;
  dynamic categories;
  int count=0;

  Products.fromJson(Map<String, dynamic> json)
  {
    id= json['id'];
    image= json['image'];
    name= json['name'];
    categories= json['categories'];
    cost= json['cost'];
    count=json['quantity'];
  }
}
