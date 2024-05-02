import 'package:flutter/material.dart';
import '../Model/cart_item.dart';
import '../widget/cart_item.dart';

class CartScreen extends StatefulWidget {
  static var cartItems;

  @override
  _CartScreenState createState() => _CartScreenState();
}
class _CartScreenState extends State<CartScreen> {
  List<CartItem> cartItems = [
    CartItem(itemName: 'Burger',quantity: 2,price: 10.0),
    CartItem(itemName: 'Pizza',quantity: 2,price: 15.0),
    CartItem(itemName: 'Drinks',quantity: 3,price: 5),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const  Text('Cart',style: TextStyle(
          fontSize: 30,
        ),),
        backgroundColor:const  Color(0xFFFF2F08),
      ),
      body: ListView.builder(
        itemCount: cartItems.length,
        itemBuilder: (context, index) {
          return CartItemWidget(cartItem: cartItems[index]);
        },
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          padding:const  EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Total: ${calculateTotal()}\$',style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold
              ),),
              ElevatedButton(
                onPressed: () {
                  // Implement checkout logic
                  // This is where you would navigate to the checkout screen
                },
                child: const  Text('Checkout',style: TextStyle(
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
    for (var item in cartItems) {
      total += item.quantity * item.price;
    }
    return total;
  }
}






