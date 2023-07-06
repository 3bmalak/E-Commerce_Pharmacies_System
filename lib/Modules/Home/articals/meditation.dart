import 'package:flutter/material.dart';

class Meditation extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
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
                          'assets/images/Articles/meditate.png'
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
                                'MEDITATION',
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
                                    'By Cleveland Clinic medical professional',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),

                                ],
                              ),
                              Row(
                                children: [
                                  Spacer(),
                                  Text(
                                    'May 22, 2022',
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
                                  '''Meditation is a practice that involves focusing or clearing your mind using a combination of mental and physical techniques.
Depending on the type of meditation you choose, you can meditate to relax, reduce anxiety and stress, and more. Some people even use meditation to help them improve their health, such as using it to help adapt to the challenges of quitting tobacco products.
The practice of meditation is thousands of years old, and different forms come from around the world. But modern science has only started studying this practice in detail during the last few decades. Some of the biggest leaps in science’s understanding of meditation have only been possible thanks to modern technology.
On the outside, someone who’s meditating might not seem to be doing anything other than breathing or repeating a sound or phrase over and over. Inside their brain, however, it’s an entirely different story. Modern diagnostic and imaging techniques, like electroencephalography (EEG) and functional magnetic resonance imaging (fMRI) scans, show that meditation can positively affect your brain and mental health.  ''',
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
