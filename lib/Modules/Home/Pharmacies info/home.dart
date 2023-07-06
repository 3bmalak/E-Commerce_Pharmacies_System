import 'package:comment_box/comment/test.dart';
import 'package:flutter/material.dart';

import 'constants.dart';
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String url = '';
  var data;
  String output = "Sentiment ";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pharmacy Profile')),
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 150,
              decoration: const BoxDecoration(
                  color: Color(0xFF145DA0),
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(40),
                      bottomLeft: Radius.circular(40))),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    maxRadius: 50.0,
                    minRadius: 50.0,
                    backgroundColor: Color(0xFF000000),
                    backgroundImage: AssetImage('assets/download.png'),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Elezaby Pharmacy',
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: AutofillHints.username,
                            fontSize: 20),
                      ),


                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),

           const Row(
             mainAxisAlignment: MainAxisAlignment.spaceAround,
             children: [
                 ProfileDetailsRow(title: 'Phone Number', value: '19600'),
               ProfileDetailsRow(title: 'Closing Time', value: '1 AM'),
             ],
           ),const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ProfileDetailsRow(title: 'Overall Rating', value: 'Possitive'),
                ProfileDetailsRow(title: 'Star Ratings', value:'Five Stars Overall' ),
              ],

            ),const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ProfileDetailsRow(title: 'Website', value: 'elezabypharmacy.com'),
              sizedBox,
                ProfileDetailsRow(title: 'Orders Delievered', value:'Over 5M ' ),

              ],
            ),
            //ProfileMenuWidget(onPressed: () { Navigator.push(context, MaterialPageRoute(builder: (context)=>graph(),),); }, title: 'Pharmacy Analytics', icon: Icons.analytics,),sizedBox,
            ProfileMenuWidget(onPressed: () { Navigator.push(context, MaterialPageRoute(builder: (context)=>TestMe(),),); }, title: 'Pharmacy Comments', icon: Icons.comment,),sizedBox,
            ProfileMenuWidget(onPressed: () {  }, title: 'Back To Store', icon: Icons.logout,)
          ],
        ),
      ),
    );
  }
}

class ProfileMenuWidget extends StatelessWidget {
  const ProfileMenuWidget({
    required this.title, required this.icon, required this.onPressed,
  });
final String title;
final IconData icon;
final VoidCallback onPressed;


  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onPressed,
      leading: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color:const Color(0xFF145DA0).withOpacity(0.1),
        ),
            child: Icon(icon,color:const Color(0xFF145DA0) ,),
      ),
    title: Text(title,style:Theme.of(context).textTheme.bodyLarge),
    trailing:Container(
      width: 30,
      height: 30,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color:const Color(0xFF145DA0).withOpacity(0.1),
      ),
      child: const Icon(Icons.arrow_forward_ios_sharp,color:Color(0xFF145DA0) ,),
    ),
    );
  }
}

class ProfileDetailsRow extends StatelessWidget {
  const ProfileDetailsRow({Key? key, required this.title, required this.value})
      : super(key: key);
  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
          right: kDefaultPadding / 4,
          left: kDefaultPadding / 4,
          top: kDefaultPadding / 2),
      width: MediaQuery.of(context).size.width / 2,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: kTextLightColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                    ),
              ),
              kHalfSizedBox,
              Text(
                value,
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: kTextBlackColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                    ),
              ),
              kHalfSizedBox,
              SizedBox(
                width: MediaQuery.of(context).size.width / 3,
                child: const Divider(
                  thickness: 1.0,
                ),
              )
            ],
          ),

        ],
      ),
    );
  }
}
