import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduatio_project/Layout/cubit/cubit.dart';
import 'package:graduatio_project/Layout/cubit/states.dart';
import 'package:graduatio_project/Models/getDataData.dart';
import 'package:graduatio_project/Shared/Components/Component.dart';



class FavoritesScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit,HomeStates>(
      listener: (context, state) {

      },
      builder: (context, state) {
        bool? b;
        HomeCubit cubit = HomeCubit.get(context);
        if (cubit.favoritesList == null) {
          b = true;
        }
        else {
          b = false;
        }
        return b?   const Center(child: Text("No Items",style: TextStyle(fontSize: 25.0,fontWeight: FontWeight.bold),)) :
        ListView.separated(itemBuilder: (context, index) => buildFavorite(HomeCubit.get(context).favoritesList[index],context) ,
            separatorBuilder: (context, index) => MyDivider(),
            itemCount: HomeCubit.get(context).favoritesList.length
        );
      },
    );
  }
  Widget buildFavorite(GetDataModel model,context)=> Padding(
    padding: const EdgeInsets.all(15.0),
    child: SizedBox(
      height: 100.0,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image(

              image: NetworkImage(
                '${model.image}',
              ),
              width: 120.0,
              height: 120.0,
              // fit: BoxFit.cover,
            ),
          ),
          // if (model.discount.toString() != '0')
          const SizedBox( width:  5.0,),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                const SizedBox(height: 10.0,),
                Text(
                  '${model.name}',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 14.0,
                    height: 1.3,

                  ),
                ),

                const Spacer(),
                Text(
                  '${model.categories}',
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14.0,
                    height: 1.3,
                  ),
                ),
                const Spacer(),
                Row(
                  children: [
                    Text(
                      '${model.cost} LE',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 12.0,
                        height: 1.3,
                        color: Colors.indigo,
                      ),
                    ),

                    const Spacer(),
                    IconButton(
                        padding: EdgeInsets.zero,
                        onPressed: () {
                           HomeCubit.get(context).changeFavorite(model);
                        },
                        icon:
                        Icon(
                          Icons.favorite,
                          size: 18.0,
                          color: model.inFavorite? Colors.red:Colors.grey,
                        )
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
