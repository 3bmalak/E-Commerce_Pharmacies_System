import 'package:flutter/material.dart';

class LifeStyle extends StatelessWidget {
  const LifeStyle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.maxFinite,
        height: double.maxFinite,
        child: Stack(
          children: [
            Positioned(
              left: 0,
              right: 0,
              child: Container(
                width: double.maxFinite,
                height: 350,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(
                          'assets/images/Articles/lifestyle.jpg'
                      )
                  ),
                ),
              ),
            ),
            Positioned(
              left: 5,
              top: 40,
              child :
              IconButton(onPressed: ()
              {
                Navigator.pop(context);
              },
                  icon: const Icon(Icons.arrow_back , color: Colors.indigo,size: 30,)),
            ),
            Positioned(
                left: 0,
                right: 0,
                bottom: 20,
                top: 330,
                child: Container(
                  padding: const EdgeInsets.only(left: 20,right: 20,top: 20),
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(30),
                          topLeft: Radius.circular(30)
                      ),
                      color: Colors.white
                  ),
                  child: Column(
                    children: [
                      Expanded(
                          child: ListView( 
                            children: const [
                              Text(
                                '10 Tips For Healthy Lifestyle',
                                style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                              SizedBox(height: 10),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'By Yiqing Song',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Text(
                                    'Jun 12, 2020',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 30),
                              Flexible(
                                child: Text(
                                  '''At this extreme moment, we began working from home, away from campus, and keeping social distance for as many
people as possible. As we stay home and are stuck with the foods that have been in our fridge or pantry for a while,
we are temporarily living a sedentary lifestyle with increased odds of physical inactivity, excessive eating and sitting, Here, I’d like to share some basic tips and resources for how to maintain your healthy lifestyle, body weight, and
overall well-being while staying home and engaging in social distancing.
1. Measure and Watch Your Weight 
2. Limit Unhealthy Foods and Eat Healthy Meals
3. Take Multivitamin Supplements 
4. Drink Water and Stay Hydrated, and Limit Sugared Beverages
5. Exercise Regularly and Be Physically Active
6. Reduce Sitting and Screen Time 
7. Get Enough Good Sleep
8. Go Easy on Alcohol and Stay Sober
9. Find Ways to Manage Your Emotions
10. Use an App to Keep Track of Your Movement, Sleep, and Heart Rate  ''',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              )

                            ],
                          )),

                    ],
                  ),
                )),
          ],
        ),

      ),
    );
  }
}
