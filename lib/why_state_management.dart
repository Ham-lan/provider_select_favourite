import 'dart:async';

import 'package:flutter/material.dart';

class whyStateManagement extends StatefulWidget {
  const whyStateManagement({Key? key}) : super(key: key);

  @override
  State<whyStateManagement> createState() => _whyStateManagementState();
}

class _whyStateManagementState extends State<whyStateManagement> {

  int count = 0;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Timer.periodic( Duration(milliseconds: 100) , (timer) {

      count++;
      print(count);

      setState(() {

      });

    });



  }

  @override
  Widget build(BuildContext context) {


    print('build' + count.toString());
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(child: Text(count.toString() , style: TextStyle(fontSize: 50), ) ),
        ],
      ),
    );
  }
}
