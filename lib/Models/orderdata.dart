class Order {
  int? id;
  double totalPrice;
  String date;
  String time;

  Order({this.id, required this.totalPrice, required this.date, required this.time});
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'total_price': totalPrice,
      'date': date,
      'time': time,
    };
  }
}