import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:statemt/check.dart';
import 'package:statemt/model/cart.dart';
import 'package:statemt/model/item.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Item> item = [
    Item(name: 'oppo A5', price: 2660),
    Item(name: "oppo A4", price: 6500),
    Item(name: 'oppo A7', price: 3000),
    Item(name: 'oppo A8', price: 5000),
    Item(name: 'oppo A9', price: 8500),
    Item(name: 'oppo A15', price: 4551),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text("E-commerse"),
        ),
        actions: [
          Row(children: [
            Container(
              margin: const EdgeInsets.all(0),
              child: (IconButton(
                  onPressed: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return const CheckOut();
                    }));
                  },
                  icon: const Icon(Icons.add_shopping_cart_outlined))),
            ),
            Padding(
                padding: const EdgeInsets.only(right: 10, bottom: 20, left: 0),
                child: Consumer<Cart>(builder: (context, cart, child) {
                  return Text("${cart.count}");
                }))
          ])
        ],
      ),
      body: ListView.builder(
          itemCount: item.length,
          itemBuilder: (context, i) {
            return Card(child: Consumer<Cart>(builder: (context, cart, child) {
              return ListTile(
                title: Text(item[i].name),
                trailing: IconButton(
                    onPressed: () {
                      cart.add(item[i]);
                    },
                    icon: const Icon(Icons.add)),
              );
            }));
          }),
    );
  }
}
