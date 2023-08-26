import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stateles_widget_practice/providers/favourite_items.dart';
import 'package:stateles_widget_practice/screens/favourite/favourites_added_screen.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({Key? key}) : super(key: key);

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  List<int> selectedItem = [];

  @override
  Widget build(BuildContext context) {
    //final favoutiteProvider = Provider.of<FavouriteItemProvider>(context);
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
                itemCount: 100,
                itemBuilder: (context, index){

              return Consumer<FavouriteItemProvider>(
                  builder: (context,value,child){
                    return ListTile(
                      onTap: (){
                        if(value.selectedItem.contains(index)){
                          value.removeItem(index);
                        }
                        else
                          {
                            value.addItem(index);
                          }
                      },
                      title: Text('Item '+ index.toString()),
                      trailing: Icon(
                          value.selectedItem.contains(index) ? Icons.favorite : Icons.favorite_border_outlined
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
