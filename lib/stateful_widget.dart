import 'package:flutter/material.dart';

class statefulWidget extends StatefulWidget {
  const statefulWidget({Key? key}) : super(key: key);

  @override
  State<statefulWidget> createState() => _statefulWidgetState();
}

class _statefulWidgetState extends State<statefulWidget> {


  int x = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Stateful Widget')),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(child: Text(x.toString() , style: TextStyle(fontSize: 50),)),
        ],
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: (){
            x++;
            setState(() {

            });
          },
        child: Icon(Icons.add),
      ),
    );
  }
}
