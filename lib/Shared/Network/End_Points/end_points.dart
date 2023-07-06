import 'package:graduatio_project/Shared/Network/local/cache_Helper.dart';

import '../../../Models/getDataData.dart';
import '../../../Models/historymodel.dart';
import '../../../Models/userModel.dart';

const String Login='login';

const String Home='home';

const String Categories='categories';

const String Favorites='favorites';

const String PROFILE='profile';

const String UPDATE_PROFILE='update-profile';

const String REGISTER='register';


dynamic uId='';
String imageurl="";
List<GetDataModel> CartData=[];
List<GetDataModel> FavouriteData=[];
List<GetDataModel> allData=[];

List<prescription_model> prescriptionsData=[];
userModel? userData;

dynamic fId=CacheHelper.getData(key: "fId");
dynamic number_of_order;


