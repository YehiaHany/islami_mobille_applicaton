class TasbeehItem {
  String text;
  int count;

  TasbeehItem({required this.text, this.count = 0});

  static final List<TasbeehItem> tasbeehList = [
    TasbeehItem(text: "سبحان الله"),
    TasbeehItem(text: "الحمد لله"),
    TasbeehItem(text: "الله أكبر"),
    TasbeehItem(text: "أستغفر الله"),
  ];
}
