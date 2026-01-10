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
