import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stateles_widget_practice/providers/example_one_provider.dart';
import 'package:stateles_widget_practice/stateful_widget.dart';

class ScreenOne extends StatefulWidget {
  const ScreenOne({Key? key}) : super(key: key);

  @override
  State<ScreenOne> createState() => _ScreenOneState();
}

class _ScreenOneState extends State<ScreenOne> {

  double value = 1.0;

  @override
  Widget build(BuildContext context) {
    print('build');
    return Scaffold(
      appBar: AppBar(
        title: Text('Slider Example'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Consumer<exampleOneProvider>(
              builder: (context , value , child){
                return  Slider(
                    min: 0,
                    max: 1,
                    value: value.value, onChanged: (val){
                  value.setValue(val);
                });
              },
          ),

          Consumer<exampleOneProvider>(
            builder: (context , value , child){
              return  Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 100,
                      color: Colors.green.withOpacity(value.value),
                      child: Center(child: Text('Container 1')),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 100,
                      color: Colors.red.withOpacity(value.value),
                      child: Center(child: Text('Container 2')),
                    ),
                  ),
                ],
              );
            },
          ),


        ],
      ),
    );
  }
}