import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stateles_widget_practice/providers/count_provider.dart';

class CountExample extends StatefulWidget {
  const CountExample({Key? key}) : super(key: key);

  @override
  State<CountExample> createState() => _CountExampleState();
}

class _CountExampleState extends State<CountExample> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    final countProvider = Provider.of<CountProvider>(context,listen: false);
    Timer.periodic(Duration(seconds: 2), (timer) {
      countProvider.setcount();
    });
  }

  @override
  Widget build(BuildContext context) {
    final countProvider = Provider.of<CountProvider>(context, listen: false );
    print('build');
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Consumer<CountProvider>(
              builder: (context, value, child){
                print('build this widget only');
                return Text(countProvider.count.toString());
              },
            ),
              // child: Consumer<CountProvider>(bui)
              // {(child: Text(countProvider.count.toString()))}
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: (){
            countProvider.setcount();
          },
        child: Icon(Icons.add),
      ),
    );
  }
}
