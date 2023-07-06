import 'package:flutter/material.dart';

class SkinCare extends StatelessWidget {


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
                width: double.infinity,
                height: 350,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(
                          'assets/images/Articles/skin.jpg'
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
                bottom: 0,
                top: 330,
                child: Container(
                  padding: const EdgeInsets.all(20),
                  width: double.infinity,
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
                            physics: const BouncingScrollPhysics(),

                            children: const [
                              Text(
                                'Skin care: 5 tips for healthy skin',
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
                                    'By Mayo Clinic Staff',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Text(
                                    'Jan 22, 2022',
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
                                  '''Don't have time for intensive skin care? You can still pamper yourself by acing the basics. Good skin care and healthy lifestyle choices can help delay natural aging and prevent various skin problems. Get started with these five no-nonsense tips.
                          
1. Protect yourself from the sun:
One of the most important ways to take care of your skin is to protect it from the sun. A lifetime of sun exposure can cause wrinkles, age spots and other skin problems — as well as increase the risk of skin cancer.
2. Don't smoke:
Smoking makes your skin look older and contributes to wrinkles. Smoking narrows the tiny blood vessels in the outermost layers of skin, which decreases blood flow and makes skin paler. This also depletes the skin of oxygen and nutrients that are important to skin health.
3. Treat your skin gently:
Daily cleansing and shaving can take a toll on your skin. 
4. Eat a healthy diet:
A healthy diet can help you look and feel your best. Eat plenty of fruits, vegetables, whole grains and lean proteins. The association between diet and acne isn't clear — but some research suggests that a diet rich in fish oil or fish oil supplements and low in unhealthy fats and processed or refined carbohydrates might promote younger looking skin. Drinking plenty of water helps keep your skin hydrated.
5. Manage stress:
Uncontrolled stress can make your skin more sensitive and trigger acne breakouts and other skin problems. To encourage healthy skin — and a healthy state of mind — take steps to manage your stress. Get enough sleep, set reasonable limits, scale back your to-do list and make time to do the things you enjoy. The results might be more dramatic than you expect.''',
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
