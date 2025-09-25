import "package:flutter/material.dart";

void main() {
  runApp(CartApp());
}

class CartApp extends StatelessWidget {
  const CartApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CartPage(),
      debugShowCheckedModeBanner: false,
      title: "My Cart",
    );
  }
}

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  CartItem item1 = CartItem(5.99, 1, "Black Flowers - XX Traders");
  CartItem item2 = CartItem(5.99, 1, "White Flowers - YY Traders");
  CartItem item3 = CartItem(19.99, 1, "Sword Set - XYZ Traders");
  CartItem item4 = CartItem(29.99, 1, "Forged Sword - Z Traders");

  late double finalPrice =
      (item1.price * item1.quantity) +
      (item2.price * item2.quantity) +
      (item3.price * item3.quantity) +
      (item4.price * item4.quantity);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "My Cart",
          style: TextStyle(color: Colors.orange, fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(30),
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset("assets/flowers1.png", height: 100, width: 100),
                  SizedBox(width: 20),
                  Column(
                    children: [
                      Text(
                        item1.name,
                        style: TextStyle(
                          color: Colors.deepOrange,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        "\$${item1.price}/2KG",
                        style: TextStyle(color: Colors.black54),
                      ),
                      SizedBox(height: 20),
                      Row(
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                item1.quantity++;
                                finalPrice += item1.price;
                              });
                            },
                            child: Icon(Icons.add),
                          ),
                          SizedBox(width: 10),
                          Text(item1.quantity.toString()),
                          SizedBox(width: 10),
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                if (item1.quantity > 1) {
                                  finalPrice -= item1.price;
                                  item1.quantity--;
                                }
                              });
                            },
                            child: Text("-"),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset("assets/flowers2.png", height: 100, width: 100),
                  SizedBox(width: 20),
                  Column(
                    children: [
                      Text(
                        item2.name,
                        style: TextStyle(
                          color: Colors.deepOrange,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        "\$${item2.price}/2KG",
                        style: TextStyle(color: Colors.black54),
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                item2.quantity++;
                                finalPrice += item2.price;
                              });
                            },
                            child: Icon(Icons.add),
                          ),
                          SizedBox(width: 20),
                          Text(item2.quantity.toString()),
                          SizedBox(width: 20),
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                if (item2.quantity > 1) {
                                  finalPrice -= item2.price;
                                  item2.quantity--;
                                }
                              });
                            },
                            child: Text("-"),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset("assets/swordset1.png", height: 100, width: 100),
                  SizedBox(width: 20),
                  Column(
                    children: [
                      Text(
                        item3.name,
                        style: TextStyle(
                          color: Colors.deepOrange,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        "\$${item3.price}",
                        style: TextStyle(color: Colors.black54),
                      ),
                      SizedBox(height: 20),
                      Row(
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                item3.quantity++;
                                finalPrice += item3.price;
                              });
                            },
                            child: Icon(Icons.add),
                          ),
                          SizedBox(width: 10),
                          Text(item3.quantity.toString()),
                          SizedBox(width: 10),
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                if (item3.quantity > 1) {
                                  finalPrice -= item3.price;
                                  item3.quantity--;
                                }
                              });
                            },
                            child: Text("-"),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset("assets/swordset2.png", height: 100, width: 100),
                  SizedBox(width: 20),
                  Column(
                    children: [
                      Text(
                        item4.name,
                        style: TextStyle(
                          color: Colors.deepOrange,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        "\$${item4.price}",
                        style: TextStyle(color: Colors.black54),
                      ),
                      SizedBox(height: 20),
                      Row(
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                item4.quantity++;
                                finalPrice += item4.price;
                              });
                            },
                            child: Icon(Icons.add),
                          ),
                          SizedBox(width: 10),
                          Text(item4.quantity.toString()),
                          SizedBox(width: 10),
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                if (item4.quantity > 1) {
                                  finalPrice -= item4.price;
                                  item4.quantity--;
                                }
                              });
                            },
                            child: Text("-"),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.all(40),
                color: Colors.white54,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text("Subtotal (4): "),
                        SizedBox(width: 10),
                        Text("\$${finalPrice.toStringAsFixed(2)}"),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text("Tax: "),
                        SizedBox(width: 10),
                        Text(
                          "\$${((finalPrice * 15) / 100).toStringAsFixed(2)}",
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "Cart total: ",
                          style: TextStyle(
                            color: Colors.deepOrange,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(width: 10),
                        Text(
                          "\$${(finalPrice + ((finalPrice * 15) / 100)).toStringAsFixed(2)}",
                          style: TextStyle(
                            color: Colors.deepOrange,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            "Your total to be paid is: \$${(finalPrice + ((finalPrice * 15) / 100)).toStringAsFixed(2)}",
                          ),
                        ),
                      );
                    },
                    child: Text(
                      "Secure Checkout",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CartItem {
  double price;
  int quantity;
  String name;

  CartItem(this.price, this.quantity, this.name);
}
