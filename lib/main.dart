import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduatio_project/Layout/cubit/cubit.dart';
import 'package:graduatio_project/Layout/cubit/states.dart';
import 'package:graduatio_project/Layout/pharmacy/Cubit/PharmacyCubit.dart';
import 'package:graduatio_project/Layout/pharmacy/Pharmacy_home_Layout.dart';
import 'package:graduatio_project/Modules/Admin/admin_screen.dart';
import 'package:graduatio_project/Modules/Home/Feedback/feedbackScreen.dart';
import 'package:graduatio_project/Modules/Register/cubit/RegisterCubit.dart';
import 'Layout/Home_Layout.dart';
import 'Modules/Home/Cart/cubit/CartCubit.dart';
import 'sheets/Gsheet.dart';
import 'Modules/login/LoginScreen.dart';
import 'Modules/onBoardingScreen/onBoardingScreen.dart';
import 'Shared/Network/End_Points/end_points.dart';
import 'Shared/Network/local/cache_Helper.dart';
import 'Shared/block_observer.dart';
import 'package:sizer/sizer.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Bloc.observer = MyBlocObserver();
  await CacheHelper.init();
  await FeedbackSheet.init();

  var onBoarding = CacheHelper.getData(key: 'onBoarding');
  uId = CacheHelper.getData(key: 'uId');
  Widget widget;
  if (onBoarding == true) {
    if (uId != '') {
      widget =  HomeLayout();
    } else {
      widget = LoginScreen();
    }
  } else {
    widget =  onBoardingScreen();
  }
  runApp(MyApp(widget));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  late Widget startWidget;
  MyApp(this.startWidget);
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => HomeCubit()
              ..getFavorites()
              ..getOrdersHistory()
              ..getFirebase()
              ..getPharmaciesData()
              ..getPrescriptionsHistory()),
        BlocProvider(create: (context) => CartCubit()),
        BlocProvider(create: (context) => RegisterCubit()),
        BlocProvider(create: (context) => PharmacyHomeCubit()
        ..getOrdersRequests()..getFeedbacks()
        ),
      ],
      child: BlocConsumer<HomeCubit, HomeStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Sizer(
            builder: (context, orientation, deviceType) {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                theme: ThemeData(
                  brightness: Brightness.light,
                  primarySwatch: Colors.indigo,
                ),
                home: onBoardingScreen(),
              );
            },
          );
        },
      ),
    );
  }
}
