import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../home_screen/tabs/quran_tab/utils.dart';

class MostRecentlyProvider extends ChangeNotifier {
  List<int> mostRecentlyListInt = [];

  void getMostRecently() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> mostRecentlyListString =
        prefs.getStringList(SharedPreferencesKeys.mostRecentlyKey) ?? [];
    mostRecentlyListInt =
        mostRecentlyListString.map((s) => int.parse(s)).toList();
    notifyListeners();
  }
}
