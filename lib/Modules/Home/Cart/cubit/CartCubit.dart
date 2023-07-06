
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduatio_project/Layout/cubit/cubit.dart';
import '../../../../Models/getDataData.dart';
import '../../../../Models/historymodel.dart';
import '../../../../Shared/Network/End_Points/end_points.dart';
import 'CartStates.dart';


class CartCubit extends Cubit<CartStates>{
  CartCubit():super(CartInitState());
  static CartCubit get(context) => BlocProvider.of(context);

  num totalCost=0;
  bool payment=false;

  void getTotalCost(){
    for(var z in CartData){
      totalCost+=(z.cost*z.count);
    }
  }
  void changePayment(){
    payment=!payment;
    emit(CartChangePaymentState());
  }
void changeCount(){
    emit(CartChangeCountState());
}

void createcart({required dynamic phone,required dynamic location,required dynamic PharmacyId, required dynamic cartid,required dynamic userid,required List<GetDataModel> products, context})
{
    DateTime now = DateTime.now();
   dynamic currentTime = DateTime(now.year, now.month, now.day, now.hour, now.minute);

    HistoryModel m =HistoryModel(location: location,phone:phone,cartid: cartid, userid: userid, products: products,totalcost: totalCost.toStringAsFixed(2),date: currentTime);
    m.toMap();
    m.toMap2(pharmacyId: PharmacyId);
    HomeCubit.get(context).getOrdersHistory();
    emit(CreateUserSuccessState());
  }
  void changeState()
  {
      emit(Sofaaa());
  }


}