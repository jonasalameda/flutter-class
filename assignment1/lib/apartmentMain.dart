import "package:flutter/material.dart";

void main() {
  runApp(ApartmentApp());
}

class ApartmentApp extends StatelessWidget {
  const ApartmentApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ApartmentMain(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ApartmentMain extends StatefulWidget {
  const ApartmentMain({super.key});

  @override
  State<ApartmentMain> createState() => _ApartmentMainState();
}

class _ApartmentMainState extends State<ApartmentMain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: Container(
        color: Colors.black,
        padding: EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Image.asset("assets/ap1.jpg",),
            ),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Chill Apartment", style: TextStyle(color: Colors.white, fontSize: 16),),
                Text("Katowice", style: TextStyle(color: Colors.white, fontSize: 16),),
              ],
            ),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text("350 \$ ",style: TextStyle(color: Colors.blue, fontSize: 16),),
                    Text("per night", style: TextStyle(color: Colors.white, fontSize: 16),)
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.star, color: Colors.white,),
                    Text("4.0/5", style: TextStyle(color: Colors.white, fontSize: 16),)
                  ],
                ),
              ],
            ),
            SizedBox(height: 20,),
            DecoratedBox(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
              ),
              child: Image.asset("assets/ap2.jpg",
              ),
            ),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Luxury Katowice Hotel", style: TextStyle(color: Colors.white, fontSize: 16),),
                Text("Katowice", style: TextStyle(color: Colors.white, fontSize: 16),),
              ],
            ),
            Divider(),
          ],
        ),
      )
    );
  }
}

