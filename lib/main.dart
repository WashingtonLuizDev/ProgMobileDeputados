import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App Deputados',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Deputados'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _NomeDeputado = TextEditingController();
  final TextEditingController _Legislatura = TextEditingController();
  final TextEditingController _Partido = TextEditingController();

  void _Buscar(String Nome, String partido, int numeroLegislatura) {
    setState(() {
      showDialog(context: context, builder: (_) => AlertDialog(
        title: Text("Message Text"),
        content: Text('$Nome, $partido, $numeroLegislatura'),
      )
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    String valor = "";

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),

              child: TextField(
                controller: _NomeDeputado,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Buscar Nome',
                ),

              ),
            ),TextField(
                controller: _Legislatura,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Nº Legislatura',
                ),
              ),TextField(
                controller: _Partido,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Partido',
                ),
              ),
              TextButton(
                onPressed: () {
                  setState((){
                    _Buscar(_NomeDeputado.text,_Partido.text,int.parse(_Legislatura.text));
                  });
                },
                child: Text("Buscar"),
              )
            ]
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
