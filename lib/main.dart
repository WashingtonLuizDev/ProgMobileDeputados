import 'package:deputados/pages/buscar_deputados_form.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(Main());
}

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'Deputados',
      home: buscarDeputadosForm(),
    );
  }
}