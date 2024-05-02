import 'package:flutter/material.dart';


import '../Models/cart_item.dart';
import '../Models/orderdata.dart';
import '../Widgets/cart_item.dart';
import '../database/db_helper.dart';
import 'package:intl/intl.dart';

class CartScreen extends StatefulWidget {
  @override
  static List<CartItem>? cartItems = [];

  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final DatabaseHelper dbHelper = DatabaseHelper.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart',style: TextStyle(
          fontSize: 30,
        ),),
        backgroundColor: Color(0xFFFF2F08),
      ),
      body: ListView.builder(
        itemCount: CartScreen.cartItems?.length,
        itemBuilder: (context, index) {
          return CartItemWidget(cartItem: CartScreen.cartItems![index]);
        },
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          padding: EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Total: ${calculateTotal()}\$',style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold
              ),),
              ElevatedButton(
                onPressed: () async {
                  // Implement checkout logic
                  // This is where you would navigate to the checkout screen
                  DateTime now=DateTime.now();
                  String date = formatDate(now);
                  String time=formatTime(now);
                  double totalPrice=calculateTotal();
                  int insertedOrderId = await dbHelper.insertOrder(Order(totalPrice: totalPrice, date: date, time: time));
                  String msg;
                  if(insertedOrderId>0){
                    msg='Order Placed Successfully';
                  } else{
                    msg='CheckOut failed';
                  }
                  final snackBar = SnackBar(
                    content: Text(msg),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  CartScreen.cartItems?.clear();
                  Navigator.pop(context);
                },
                child: Text('Checkout',style: TextStyle(
                  fontSize:20
                ),),

              ),
            ],
          ),
        ),
      ),
    );
  }

  double calculateTotal() {
    double total = 0.0;
    for (var item in CartScreen.cartItems!) {
      total += item.quantity * item.price;
    }
    return total;
  }
  String formatDate(DateTime dateTime) {
    // Format the date as 'yyyy-MM-dd'
    String formattedDate = DateFormat('yyyy-MM-dd').format(dateTime);
    return formattedDate;
  }
  String formatTime(DateTime dateTime) {
    // Format the time as 'hh:mm'
    String formattedTime = DateFormat('HH:mm').format(dateTime);
    return formattedTime;
  }
}






