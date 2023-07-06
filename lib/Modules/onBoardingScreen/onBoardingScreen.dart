


import 'package:flutter/material.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../Shared/Components/Component.dart';
import '../../Shared/Network/local/cache_Helper.dart';
import '../login/LoginScreen.dart';



class BoardingModel
{
  final   String image;
  final String title;
  final String body;
  BoardingModel({
    required  this.image,
    required  this.title,
    required  this.body,
});
}


class onBoardingScreen extends StatefulWidget {


  @override
  _onBoardingScreenState createState() => _onBoardingScreenState();
}

class _onBoardingScreenState extends State<onBoardingScreen> {
  var cont=PageController();

List<BoardingModel> page=[
  BoardingModel(image: 'assets/images/onboarding/signup.png', title: 'SIGNUP OR LOGIN ', body: 'User can create or join his account'),
  BoardingModel(image: 'assets/images/onboarding/makeorder.png', title: 'GET YOUR ORDER', body: 'User can navigate all the categories to make his order'),
  BoardingModel(image: 'assets/images/onboarding/nearphar.png', title: 'NEAREAST PHARMACY', body: 'User can find nearest pharmacy in his district '),
  BoardingModel(image: 'assets/images/onboarding/weight.jpg', title: 'CHECK PERFECT WEIGHT', body: 'User can make a rapid test to check his fitness'),
  BoardingModel(image: 'assets/images/onboarding/chat.jpg', title: 'CHAT', body: 'Help you to .........'),

];

bool lastPaage=false;

void onSubmit(){
  print("ssssssssssssssssssssssssssssssssssssssssssssssss");
  CacheHelper.SaveData(
      key: 'onBoarding',
      value: true).
  then((value) {
    if(value){
    navigatorAndFinish(
        context,
        LoginScreen()
    );
  }
});
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(onPressed: () {
            setState(() {
            onSubmit();
            });
          },child:const Text('SKIP',style: TextStyle(color: Colors.white70),) ,)
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(itemBuilder: (context, index) {

                return BuildOnBoardingScreen(page[index]);
              },
                physics: const BouncingScrollPhysics(),
                controller: cont,
                onPageChanged:(value) {
                  if(value==page.length-1){
                    print('sfsdfsdfsdfsdfsdf');
                    lastPaage=true;
                  }
                } ,
                itemCount: page.length,),
            ),
            const SizedBox(
              height: 40.0,),
            Row(
              children: [
                SmoothPageIndicator(
                  controller: cont,
                  count:page.length ,
                  effect: const ExpandingDotsEffect(
                    dotColor: Colors.grey,
                    dotHeight: 10.0,
                    dotWidth: 10.0,
                    expansionFactor: 4.0,
                    activeDotColor: Colors.indigo,
                    spacing: 5.0
                  ),

                ),
                const Spacer(),
                FloatingActionButton(onPressed: () {
                  if(lastPaage==false)
                  {
                    cont.nextPage(duration: const Duration(milliseconds: 750),
                        curve: Curves.fastLinearToSlowEaseIn);
                  }
                  else{
                    setState(() {
                     onSubmit();
                    });
                  }
                },
                child: const Icon(Icons.arrow_forward_outlined),)
            ],)

          ],
        ),
      ),

    );
  }

  Widget BuildOnBoardingScreen(BoardingModel model) =>Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Expanded(
        child: Image(
          image: AssetImage(model.image),
        ),
      ),
      //SizedBox(height: 20.0,),
      Center(
        child: Text(
          model.title,style: const TextStyle(fontSize: 25.0,fontWeight: FontWeight.bold,color: Colors.indigo),
        ),
      ),
      const SizedBox(height: 70.0,),
      Text(
        model.body,style: const TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold),
      ),
      const SizedBox(height: 20.0,),
    ],
  );
}
