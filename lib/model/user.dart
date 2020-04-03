import 'package:flutter/cupertino.dart';

class User with ChangeNotifier {
  bool isFav = false;

  handelFav() {
    isFav = !isFav;
    notifyListeners();
  }
}
