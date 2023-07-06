import 'package:flutter/material.dart';
import 'package:graduatio_project/Modules/Home/Categories/types/DailyList.dart';
import 'package:graduatio_project/Modules/Home/Categories/types/HairCare.dart';
import 'package:graduatio_project/Modules/Home/Categories/types/MedicineList.dart';
import 'package:graduatio_project/Modules/Home/Categories/types/MomBabyList.dart';
import 'package:graduatio_project/Modules/Home/Categories/types/SkinCareList.dart';
import 'package:graduatio_project/Modules/Home/Categories/types/VitaminsList.dart';

class CategoriesScreen extends StatefulWidget {


  @override
  State<CategoriesScreen> createState() => _MyHomePageState();
}
class _MyHomePageState extends State<CategoriesScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState(){
    super.initState();
    _tabController=TabController(length: 6, vsync: this);
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.only(left: 20.0),
        children:<Widget> [
          const SizedBox(height: 15.0,),
          const Text(
            'Categories',style: TextStyle(color: Colors.black,fontSize: 42.0),
          ),
          const SizedBox(height: 15.0),
          TabBar(
              controller: _tabController,
              indicatorColor: Colors.transparent,
              labelColor: Colors.indigo,
              isScrollable: true,
              labelPadding: const EdgeInsets.only(right: 17.0),
              unselectedLabelColor: Colors.yellow,
              tabs:  [
                Container(
                  width: 150.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: Colors.grey[300],
                  ),
                  child: const Tab(
                    child: Text(
                      'Medicines',style: TextStyle(color: Colors.indigo,fontSize: 21.0),
                    ),
                  ),
                ),
                Container(
                  width: 150.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: Colors.grey[300],
                  ),
                  child: const Tab(
                    child: Text(
                      'Vitamins',style: TextStyle(color: Colors.indigo,fontSize: 21.0),
                    ),
                  ),
                ),
                Container(width: 180.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: Colors.grey[300],
                  ),
                  child: const Tab(
                    child: Text(
                      'Dailyessentials',style: TextStyle(color: Colors.indigo,fontSize: 21.0),
                    ),
                  ),
                ),
                Container(width: 150.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: Colors.grey[300],
                  ),
                  child: const Tab(
                    child: Text(
                      'Haircare',style: TextStyle(color: Colors.indigo,fontSize: 21.0),
                    ),
                  ),
                ),
                Container(width: 150.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: Colors.grey[300],
                  ),
                  child: const Tab(
                    child: Text(
                      'Skincare',style: TextStyle(color: Colors.indigo,fontSize: 21.0),
                    ),
                  ),
                ),
                Container(
                  width: 150.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: Colors.grey[300],
                  ),
                  child: const Tab(
                    child: Text(
                      'Mom&baby',style: TextStyle(color: Colors.indigo,fontSize: 21.0),
                    ),
                  ),
                ),
              ]
          ),
          /*const SizedBox(height: 15.0),
          TextField(
            //onChanged: (value) => _runFilter(value),
            decoration: const InputDecoration(
                labelText: 'Search', suffixIcon: Icon(Icons.search)),
          ),*/
          //const SizedBox(height: 15.0),

          SizedBox(
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
            child: TabBarView(
              controller: _tabController,
              children:   [
                medicinesList(),
                vitaminsList(),
                dailyEssentialsList(),
                hairCareList(),
                skinCareList(),
                momBabyList(),
              ],
            ),
          )

        ],
      ),
    );
  }
}