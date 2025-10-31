import 'package:flutter/material.dart';

Map<String, String> users = <String, String>{};

void main() {
  runApp(PizzaApp());
}

class PizzaApp extends StatelessWidget {
  const PizzaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(),
      debugShowCheckedModeBanner: false,
      routes: {
        '/login': (context) => LoginPage(),
        '/register': (context) => RegisterPage(),
        '/home': (context) => HomePage(),
        // '/order': (context) => OrderPage(),
      },
    );
  }
}

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final _userIdController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      appBar: AppBar(
        title: Text("My Application"),
        backgroundColor: Colors.grey,
      ),
      body: Container(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            Image.asset('asset/pizza1.png', width: 350, height: 350),

            TextField(
              controller: _userIdController,
              decoration: InputDecoration(labelText: "User ID"),
            ),

            SizedBox(height: 10),

            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: "Password"),
              obscureText: true,
              obscuringCharacter: '*',
            ),
            SizedBox(height: 15),
            FilledButton(
              onPressed: () {
                if (users[_userIdController.text] == _passwordController.text) {
                  Navigator.pushNamed(
                    context,
                    '/home',
                    arguments: _userIdController.text,
                  );
                }
              },
              child: Text("Login"),
            ),

            SizedBox(height: 30),

            FilledButton(
              onPressed: () {
                Navigator.pushNamed(context, '/register');
              },
              child: Text("Register"),
            ),
          ],
        ),
      ),
    );
  }
}

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _userIdController = TextEditingController();
  final _passwordController = TextEditingController();
  final _passwordConfirmationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      appBar: AppBar(
        title: Text("My Application"),
        backgroundColor: Colors.grey,
      ),
      body: Container(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            Image.asset('asset/registration.gif', width: 298, height: 298),
            Text(
              "Registration!!!!",
              style: TextStyle(
                fontSize: 58,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),

            TextField(
              controller: _userIdController,
              decoration: InputDecoration(labelText: "User ID"),
            ),

            SizedBox(height: 10),

            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: "Password"),
              obscureText: true,
              obscuringCharacter: '*',
            ),

            TextField(
              controller: _passwordConfirmationController,
              decoration: InputDecoration(labelText: "Confirm Password"),
              obscureText: true,
              obscuringCharacter: '*',
            ),

            SizedBox(height: 30),

            FilledButton(
              onPressed: () {
                if (_passwordConfirmationController.text ==
                    _passwordController.text) {
                  setState(() {
                    users[_userIdController.text] = _passwordController.text;
                  });

                  Navigator.pushNamed(context, '/login');
                }
              },
              child: Text("Register"),
            ),
          ],
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    RouteSettings settings = ModalRoute.of(context)!.settings;

    final username = settings.arguments as String;

    return Scaffold(
      backgroundColor: Colors.white70,
      appBar: AppBar(
        title: Text("My Application"),
        backgroundColor: Colors.grey,
      ),
      body: Padding(
        padding: EdgeInsetsGeometry.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Pizza Menu",
                  style: TextStyle(
                    fontSize: 32,
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  username,
                  style: TextStyle(
                    fontSize: 32,
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),

            Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(width: 2, color: Colors.blueGrey),
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage("asset/pizza1.png"),
                      ),
                    ),
                    width: 200,
                    height: 200,
                    margin: EdgeInsets.all(4),
                    child: OutlinedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PizzaPage(
                              pizzaName: 'Margarida Pizza',
                              username: username,
                              image: AssetImage("asset/pizza1.png"),
                              description:
                              "A hearty red sauce with tomatoes and margarida, "
                                  "oven-baked and topped with cheese.",
                            ),
                          ),
                        );
                      },
                      child: Text(""),
                      // child: Image.asset("asset/pizza1.png"),
                    ),
                  ),
                ),

                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(width: 2, color: Colors.blueGrey),
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage("asset/pizza3.png"),
                      ),
                    ),
                    width: 200,
                    height: 200,
                    margin: EdgeInsets.all(4),
                    child: OutlinedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PizzaPage(
                              pizzaName: 'Vegetarian Pizza',
                              username: username,
                              image: AssetImage("asset/pizza3.png"),
                              description:
                                  "A hearty plant sauce with plants and uhh grass, "
                                  "oven-baked and topped with eco friendly cheese (lol).",
                            ),
                          ),
                        );
                      },
                      child: Text(""),
                      // child: Image.asset("asset/pizza3.png"),
                    ),
                  ),
                ),
              ],
            ),

            Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(width: 2, color: Colors.blueGrey),
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage("asset/pizza2.png"),
                      ),
                    ),
                    width: 200,
                    height: 200,
                    margin: EdgeInsets.all(4),
                    child: OutlinedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PizzaPage(
                              pizzaName: 'Mozzarella Pizza',
                              username: username,
                              image: AssetImage("asset/pizza2.png"),
                              description:
                                  "A hearty red sauce with cheese and mozzarella cheese, "
                                  "oven-baked and topped with more cheese."
                              " Hmmm cheese",
                            ),
                          ),
                        );
                      },
                      child: Text(""),
                      // child: Image.asset("asset/pizza2.png"),
                    ),
                  ),
                ),

                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage("asset/pizza4.png"),
                      ),
                    ),
                    width: 200,
                    height: 200,
                    margin: EdgeInsets.all(4),
                    child: OutlinedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PizzaPage(
                              pizzaName: 'Random Pizza',
                              username: username,
                              image: AssetImage("asset/pizza4.png"),
                              description:
                                  "A hearty red sauce with ground beef and pork, "
                                  "oven-baked and topped with cheese.",
                            ),
                          ),
                        );
                      },
                      child: Text(""),
                      // child: Image.asset("asset/pizza4.png"),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class PizzaPage extends StatefulWidget {
  const PizzaPage({
    super.key,
    required this.pizzaName,
    required this.username,
    required this.image,
    required this.description,
  });

  final String pizzaName;
  final String username;
  final AssetImage image;
  final String description;

  @override
  State<PizzaPage> createState() => _PizzaPageState(
    pizzaName: pizzaName,
    username: username,
    image: AssetImage(image.assetName),
    description: description,
  );
}

class _PizzaPageState extends State<PizzaPage> {
  _PizzaPageState({
    required this.pizzaName,
    required this.username,
    required this.image,
    required this.description,
  });

  final String pizzaName;
  final String username;
  final AssetImage image;
  final String description;

  int finalPrice = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      appBar: AppBar(
        title: Text("My Application"),
        backgroundColor: Colors.grey,
      ),
      body: Container(
        padding: EdgeInsetsGeometry.all(8.0),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  pizzaName,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ),
                Text(username),
              ],
            ),
            Image.asset(image.assetName),

            SizedBox(height: 30),

            Text(description),

            SizedBox(height: 30),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text('Size', style: TextStyle(fontWeight: FontWeight.bold)),
                Text("Small", style: TextStyle(fontWeight: FontWeight.bold)),
                Text("Medium", style: TextStyle(fontWeight: FontWeight.bold)),
                Text("Big", style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),

            SizedBox(height: 10),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text('Price', style: TextStyle(fontWeight: FontWeight.bold)),
                Text("10CAD"),
                Text("20CAD"),
                Text("30CAD"),
              ],
            ),

            SizedBox(height: 10),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('Quantity', style: TextStyle(fontWeight: FontWeight.bold)),
                SizedBox(width: 5),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        setState(() {
                          finalPrice += 10;
                        });
                      },
                      icon: Icon(Icons.add),
                    ),

                    IconButton(
                      onPressed: () {
                        setState(() {
                          finalPrice -= finalPrice - 10 >= 0 ? 10 : 0;
                        });
                      },
                      icon: Icon(Icons.remove),
                    ),
                  ],
                ),

                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        setState(() {
                          finalPrice += 20;
                        });
                      },
                      icon: Icon(Icons.add),
                    ),

                    IconButton(
                      onPressed: () {
                        setState(() {
                          finalPrice -= finalPrice - 20 >= 0 ? 20 : 0;
                        });
                      },
                      icon: Icon(Icons.remove),
                    ),
                  ],
                ),

                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        setState(() {
                          finalPrice += 30;
                        });
                      },
                      icon: Icon(Icons.add),
                    ),

                    IconButton(
                      onPressed: () {
                        setState(() {
                          finalPrice -= finalPrice - 30 >= 0 ? 30 : 0;
                        });
                      },
                      icon: Icon(Icons.remove),
                    ),
                  ],
                ),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text('Toppings', style: TextStyle(fontWeight: FontWeight.bold)),
                Text("Small 2CAD"),
                Text("Medium 3CAD"),
                Text("Big 5CAD"),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('Quantity', style: TextStyle(fontWeight: FontWeight.bold)),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        setState(() {
                          finalPrice += 2;
                        });
                      },
                      icon: Icon(Icons.add),
                    ),

                    IconButton(
                      onPressed: () {
                        setState(() {
                          finalPrice -= finalPrice - 2 >= 0 ? 2 : 0;
                        });
                      },
                      icon: Icon(Icons.remove),
                    ),
                  ],
                ),

                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        setState(() {
                          finalPrice += 3;
                        });
                      },
                      icon: Icon(Icons.add),
                    ),

                    IconButton(
                      onPressed: () {
                        setState(() {
                          finalPrice -= finalPrice - 3 >= 0 ? 3 : 0;
                        });
                      },
                      icon: Icon(Icons.remove),
                    ),
                  ],
                ),

                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        setState(() {
                          finalPrice += 5;
                        });
                      },
                      icon: Icon(Icons.add),
                    ),

                    IconButton(
                      onPressed: () {
                        setState(() {
                          finalPrice -= finalPrice - 5 >= 0 ? 5 : 0;
                        });
                      },
                      icon: Icon(Icons.remove),
                    ),
                  ],
                ),
              ],
            ),

            SizedBox(height: 30),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "\$$finalPrice",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ),
              ],
            ),

            SizedBox(height: 30),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OutlinedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Your order for $pizzaName has placed"),
                      ),
                    );
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (builder) =>
                            OrderPage(cost: finalPrice, username: username),
                      ),
                    );
                  },
                  child: Text("Order"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class OrderPage extends StatelessWidget {
  const OrderPage({super.key, required this.cost, required this.username});

  final int cost;
  final String username;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      appBar: AppBar(
        title: Text("My Application"),
        backgroundColor: Colors.grey,
      ),
      body: Container(
        padding: EdgeInsetsGeometry.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Your order has been processed"),
            SizedBox(height: 50),
            Text("Please pay $cost for confirmation"),

            FilledButton(
              onPressed: () {
                Navigator.pushNamed(context, '/home', arguments: username);
              },
              child: Text("Home"),
            ),
          ],
        ),
      ),
    );
  }
}
