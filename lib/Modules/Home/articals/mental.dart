import 'package:flutter/material.dart';

class Mental extends StatelessWidget {
  const Mental({Key? key}) : super(key: key);

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
                          "assets/images/Articles/mental.jpg"
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
                  height: 500,
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
                                  'THE IMPORTANCE OF MENTAL HEALTH AWARENESS',
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
                                      'By Jean Holthaus',
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    Text(
                                      'Apr 7, 2020',
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
                                    '''Mental illnesses affect 19% of the adult population, 46% of teenagers and 13% of children each year. People struggling with their mental health may be in your family, live next door, teach your children, work in the next cubicle or sit in the same church pew.
However, only half of those affected receive treatment, often because of the stigma attached to mental health. Untreated, mental illness can contribute to higher medical expenses, poorer performance at school and work, fewer employment opportunities and increased risk of suicide.
Stigma affects not only the number seeking treatment, but also the number of resources available for proper treatment. Stigma and misinformation can feel like overwhelming obstacles for someone who is struggling with a mental health condition. Here a few powerful things you can do to help:
1. Showing individuals respect and acceptance
2. Advocating within our circles of influence 
3. Learning more about mental health   ''',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                )
                              ],
                          ))
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
