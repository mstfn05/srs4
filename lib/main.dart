import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Главный экран'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SecondScreen(data: 'Данные с главного экрана')),
            ).then((result) {
             
              if (result != null) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Получено: $result")));
              }
            });
          },
          child: Text('Перейти к следующему экрану'),
        ),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  final String data;

  SecondScreen({required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Второй экран'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(data),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, 'Данные возвращены на главный экран');
              },
              child: Text('Вернуться'),
            ),
          ],
        ),
      ),
    );
  }
}
