import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:statemt/model/cart.dart';

class CheckOut extends StatefulWidget {
  const CheckOut({super.key});

  @override
  State<CheckOut> createState() => _CheckOutState();
}

class _CheckOutState extends State<CheckOut> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("cart"),
      ),
      body: Consumer<Cart>(builder: (context, cart, child) {
        return ListView.builder(
            itemCount: cart.basketItem.length,
            itemBuilder: (context, i) {
              return Card(
                child: ListTile(
                  title: Text(cart.basketItem[i].name),
                  trailing: IconButton(
                      onPressed: () {
                        cart.remove(cart.basketItem[i]);
                      },
                      icon: const Icon(Icons.remove)),
                ),
              );
            });
      }),
    );
  }
}
