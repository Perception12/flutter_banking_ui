class Transaction {
  String date;
  num incoming;
  num spending;
  Transaction(
      {required this.date, required this.incoming, required this.spending});
}

class DoughData {
  String date;
  num amount;
  DoughData({required this.date, required this.amount});
}
