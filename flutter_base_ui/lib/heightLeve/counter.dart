import 'package:flutter/material.dart';

class CounterClass with ChangeNotifier {
  int value = 0;

  insersuCount(){
    value ++;
    notifyListeners();
  }

  jianyi(){
    value--;
    notifyListeners();
  }
}