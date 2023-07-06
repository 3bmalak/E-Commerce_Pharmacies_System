import 'package:flutter/material.dart';

class HairArticle extends StatelessWidget {
  const HairArticle({Key? key}) : super(key: key);

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
                          'assets/images/Articles/hair.jpg'
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
                                'Top Hair Care Tips Straight From The Experts',
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
                                    'By Sowmya Tamatam',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Text(
                                    'Jan 17, 2022',
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
                                  '''Bad hair day is a real thing! Isn’t it? Does that bouncy and voluminous mane models flaunt in hair care ads seem like a far fetched dream to you most of the time? We agree, most of them do go a bit overboard.
Hair Care Dos:
   1. Wash Your Hair Regularly
   2. Use Chemical Free Shampoos
   3. Condition Correctly
   4. Dry Your Hair Naturally
   5. Oil Your Hair Properly
   6. Use A Wide-toothed Comb
   7. Style Your Hair Naturally
   8. Trim Your Hair Regularly
   9. Drink More Water
  10. Eat Healthy
  
Hair Care Don’ts
   1. Hot Showers
   2. Stress
   3. Chemicals
   4. Hair Styling Products
   5. Salt Water Hair Wash''',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              )
                            ],
                          ) ),




                    ],

                  ),

                )),
          ],
        ),

      ),
    );
  }
}
