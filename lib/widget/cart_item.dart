import 'package:flutter/material.dart';

import '../Model/cart_item.dart';
//import '../Models/cart_item.dart';
class CartItemWidget extends StatelessWidget {
  final CartItem cartItem;

  CartItemWidget({required this.cartItem});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(cartItem.itemName),
      subtitle: Text('Quantity: ${cartItem.quantity}'),
      trailing: Text('\$${cartItem.quantity * cartItem.price}'),
    );
  }
}