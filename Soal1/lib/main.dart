import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _lamaSewa = 0;
  int _biayaSewa = 0;

  final TextEditingController _lamaSewaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hitung Biaya Sewa Kost'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _lamaSewaController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: 'Lama sewa (dalam hari)',
              ),
            ),
          ),
          RaisedButton(
            onPressed: () {
              setState(() {
                _lamaSewa = int.parse(_lamaSewaController.text);

                if (_lamaSewa >= 30) {
                  _biayaSewa = 180000;
                } else if (_lamaSewa >= 7) {
                  _biayaSewa = 50000;
                } else {
                  _biayaSewa = 10000;
                }
              });
            },
            child: Text('Hitung'),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Biaya sewa kost selama $_lamaSewa hari adalah $_biayaSewa.',
            ),
          ),
        ],
      ),
    );
  }
}
