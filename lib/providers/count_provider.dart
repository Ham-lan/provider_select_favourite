import 'package:flutter/foundation.dart';

class CountProvider with ChangeNotifier {

  int _count = 50;
  int get count => _count;

  // After the above mentioned 2 steps we get the value of _count on screen

void setcount()
{
  _count++;
  notifyListeners();
}
}