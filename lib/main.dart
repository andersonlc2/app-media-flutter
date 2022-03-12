import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Desafio',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHome(title: 'Desafio'),
    );
  }
}

class MyHome extends StatefulWidget {
  const MyHome({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  final _formKey = GlobalKey<FormState>();
  String? nota1, nota2;
  double? media;
  late String result;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TextFormField(
                    decoration: const InputDecoration(
                        hintText: 'Digite o valor da Nota 01 (N1)',
                        contentPadding: EdgeInsets.all(30.0)),
                    onSaved: (String? val) {
                      nota1 = val;
                    }),
                TextFormField(
                    decoration: const InputDecoration(
                        hintText: 'Digite o valor da Nota 02 (N2)',
                        contentPadding: EdgeInsets.all(30.0)),
                    onSaved: (String? val) {
                      nota2 = val;
                    }),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: Center(
                    child: ElevatedButton(
                      onPressed: () {
                        _formKey.currentState?.save();
                        media =
                            ((double.parse(nota1!) + double.parse(nota2!)) / 2);
                        result = media.toString();
                        showDialog(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                                  contentTextStyle: const TextStyle(
                                    color: Colors.blue,
                                    fontSize: 28,
                                  ),
                                  content: Text(result),
                                  actions: [
                                    TextButton(
                                      onPressed: () =>
                                          Navigator.pop(context, 'OK'),
                                      child: const Text('OK'),
                                    ),
                                  ],
                                ));
                      },
                      child: const Text('Calcular Média'),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        onPrimary: Colors.blue,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 20),
                        //textStyle: const TextStyle(color: Colors.blue),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
