import 'package:flutter/material.dart';

class Favorites extends ChangeNotifier {
  List<String> _items = [];

  List<String> get items => _items;

  void addItem(String item) {
    if (!_items.contains(item)) {
      _items.add(item);
      notifyListeners();
    }
  }

  void removeItem(String item) {
    _items.remove(item);
    notifyListeners();
  }
}
