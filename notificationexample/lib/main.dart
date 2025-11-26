// import 'package:flutter/material.dart';
// import 'notification.dart';
// import 'package:timezone/timezone.dart' as tz;
//
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await NotificationService().initNotification();
//   runApp(const MyApp());
// }
//
// class MyApp extends StatefulWidget {
//   const MyApp({super.key});
//
//   @override
//   State<MyApp> createState() => _MyAppState();
// }
//
// class _MyAppState extends State<MyApp> {
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     // tz.initializeTimeZones();
//   }
//
//   TextEditingController notificationTitle = TextEditingController();
//   TextEditingController notificationBody = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Notify me")),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Padding(
//               padding: EdgeInsetsGeometry.all(20),
//               child: TextField(
//                 controller: notificationTitle,
//                 decoration: InputDecoration(
//                   border: OutlineInputBorder(),
//                   labelText: 'Enter Title',
//                 ),
//               ),
//             ),
//
//             Padding(
//               padding: EdgeInsetsGeometry.all(20),
//               child: TextField(
//                 controller: notificationBody,
//                 decoration: InputDecoration(
//                   border: OutlineInputBorder(),
//                   labelText: 'Enter Details',
//                 ),
//               ),
//             ),
//             SizedBox(height: 10,),
//
//             ElevatedButton(onPressed: (){
//               NotificationService().showNotification(1, notificationTitle.text, notificationBody.text);
//             }, child: Text("Notify"))
//           ],
//         ),
//       ),
//     );
//   }
// }
