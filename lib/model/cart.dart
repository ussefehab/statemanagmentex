import 'package:flutter/material.dart';
import 'package:statemt/model/item.dart';

class Cart with ChangeNotifier{
 final List<Item> _list=[];
  // ignore: unused_field
  double _price = 0.0;
  void add(Item item){
    _list.add(item);
    _price += item.price;
    notifyListeners();
  }
    void remove(Item item){
    _list.remove(item);
    _price -= item.price;
    notifyListeners();
  }

  int get count {
    return _list.length;
  }
  double get totalPrice{
    return _price;
  }
  List<Item> get basketItem{
    return _list;
  }
}