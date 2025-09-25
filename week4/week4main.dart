import 'package:flutter/material.dart';

void main() {
  runApp(const ContainerApp());
}

class ContainerApp extends StatelessWidget {
  const ContainerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ImageContainer(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ImageContainer extends StatelessWidget {
  const ImageContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: _buildCard()));
  }

  Widget _buildCard() {
    return SizedBox(
      height: 210,
      child: Card(
        child: Column(
          children: [
            ListTile(
              title: Text(
                'Sample Text',
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              subtitle: Text("Dallas, US99984"),
              leading: Icon(Icons.animation, color: Colors.blueAccent[500]),
            ),
            Divider(),
            ListTile(
              title: Text(
                '(111) 111-1111',
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              leading: Icon(Icons.contact_phone, color: Colors.blue,),
            ),
            ListTile(
              title: Text('test@gmail.com'),
              leading: Icon(Icons.contact_mail),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildStack() {
    return Stack(
      alignment: Alignment(0.6, 0.6),
      children: [
        CircleAvatar(
          backgroundImage: AssetImage('asset/pic4.png'),
          radius: 100,
        ),
        Container(
          decoration: const BoxDecoration(color: Colors.black45),
          child: Text(
            'Me on weekends',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }

  //write a function to create a grid view
  _buildGrid() => GridView.extent(
    maxCrossAxisExtent: 150,
    padding: EdgeInsets.all(2),
    mainAxisSpacing: 20,
    crossAxisSpacing: 10,
    children: _buildGridTile(8),
  );

  _buildList() {
    return ListView(
      children: [
        _tile('someting', 'nothing', Icons.theaters),
        _tile('someting0', 'nothing', Icons.theater_comedy),
        _tile('someting1', 'nothing', Icons.theater_comedy_outlined),
        _tile('someting2', 'nothing', Icons.theater_comedy_sharp),
        _tile('someting2', 'nothing', Icons.theater_comedy_rounded),
        _tile('someting3', 'nothing', Icons.theaters_outlined),
        _tile('someting4', 'nothing', Icons.theaters_rounded),
        _tile('someting5', 'nothing', Icons.tv),
        _tile('someting5', 'nothing', Icons.tv_off),
        _tile('someting5', 'nothing', Icons.tv_outlined),
        _tile('someting5', 'nothing', Icons.live_tv_outlined),
        _tile('someting5', 'nothing', Icons.connected_tv_sharp),
        _tile('someting5', 'nothing', Icons.system_update_tv_sharp),
        _tile('someting5', 'nothing', Icons.theaters_sharp),
        _tile('someting5', 'nothing', Icons.theaters_sharp),
      ],
    );
  }

  ListTile _tile(String title, String subtitle, IconData icon) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
      ),
      subtitle: Text(subtitle),
      leading: Icon(icon, color: Colors.lightBlue),
    );
  }

  // call a list to display the pics inside the grid
  List<Widget> _buildGridTile(int count) =>
      List.generate(count, (i) => Image.asset('asset/pic$i.png'));

  Widget _buildImageColumn() {
    return Container(
      decoration: BoxDecoration(color: Colors.black),
      child: Column(children: [_buildImageRow(1), _buildImageRow(3)]),
    );
  }

  /// In dev tutorials you will be given arrow functions instead of
  /// curly braces, we should embrace this adaptation
  _buildDecorateRow(int i) => Expanded(
    child: Container(
      decoration: BoxDecoration(
        border: Border.all(width: 10, color: Colors.blueGrey),
        borderRadius: BorderRadius.all(Radius.circular(14)),
      ),
      margin: EdgeInsets.all(4),
      child: Image.asset('asset/pic$i.png'),
    ),
  );

  _buildImageRow(int i) =>
      Row(children: [_buildDecorateRow(i), _buildDecorateRow(i + 1)]);
}
