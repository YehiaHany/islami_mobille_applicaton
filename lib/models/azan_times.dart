class AzanTimes {
  String azanName;
  String azanTime;

  AzanTimes({required this.azanName, required this.azanTime});

  static List<AzanTimes> azanTimesList = [
    AzanTimes(azanName: "Fajr", azanTime: "05:10"),
    AzanTimes(azanName: "Sunrise", azanTime: "06:35"),
    AzanTimes(azanName: "Dhuhr", azanTime: "12:00"),
    AzanTimes(azanName: "Asr", azanTime: "15:25"),
    AzanTimes(azanName: "Maghrib", azanTime: "17:45"),
    AzanTimes(azanName: "Isha", azanTime: "19:05"),
  ];
}
