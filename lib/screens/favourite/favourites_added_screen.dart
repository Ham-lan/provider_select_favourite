import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/favourite_items.dart';

class FavouritesAddedScreen extends StatefulWidget {
  const FavouritesAddedScreen({Key? key}) : super(key: key);

  @override
  State<FavouritesAddedScreen> createState() => _FavouritesAddedScreenState();
}

class _FavouritesAddedScreenState extends State<FavouritesAddedScreen> {
  @override
  Widget build(BuildContext context) {
    final favoutiteProvider = Provider.of<FavouriteItemProvider>(context);
    print('Build');


    return Scaffold(
      appBar: AppBar(
        title: Text('Favourite App'),
        actions: [
          InkWell(
              onTap: (){
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => FavouritesAddedScreen() ) );
              },
              child: Icon(Icons.favorite)
          ),
          SizedBox(height: 10,),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: favoutiteProvider.selectedItem.length,
                itemBuilder: (context, index){

                  return Consumer<FavouriteItemProvider>(
                      builder: (context,value,child){
                        return ListTile(
                          onTap: (){
                        //    if(value.selectedItem.contains(index)){
                              value.removeItem(value.selectedItem[index]);
                         //   }
                          //  else
                           // {
                           //   value.addItem(index);
                           // }
                          },
                          title: Text('Item '+ value.selectedItem[index].toString() ),
                          trailing: Icon(
                              Icons.favorite
                          ) ,
                        );
                      }
                  );
                }),
          ),
        ],
      ),
    );
  }
}
