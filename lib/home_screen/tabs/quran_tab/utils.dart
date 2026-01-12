import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesKeys {
  static const mostRecentlyKey = "most_recently";
}

void setMostRecently(int index) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  List<String> mostRecentlyList =
      prefs.getStringList(SharedPreferencesKeys.mostRecentlyKey) ?? [];
  if (mostRecentlyList.contains("$index")) {
    mostRecentlyList.remove("$index");
    mostRecentlyList.insert(0, "$index");
  } else {
    mostRecentlyList.insert(0, "$index");
  }
  if (mostRecentlyList.length > 5) {
    mostRecentlyList.removeLast();
  }
  prefs.setStringList(SharedPreferencesKeys.mostRecentlyKey, mostRecentlyList);
}

void setAyaNo(int number, String suraName) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setInt(suraName, number);
}

Future<int> getAyaNo(String suraName) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  int number = prefs.getInt(suraName) ?? -1;
  return number;
}