import 'dart:convert';

import 'package:deputados/models/deputado.dart';
import 'package:deputados/pages/lista_deputados.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class buscarDeputadosForm extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    return _buscarDeputadosFormState();
  }
}

class _buscarDeputadosFormState extends State<buscarDeputadosForm>{
  final TextEditingController _NomeDeputado = TextEditingController();
  final TextEditingController _Partido = TextEditingController();

  listarDeputados(String nome, String partido, BuildContext context) async {
    String link = 'https://dadosabertos.camara.leg.br/api/v2/deputados?ordem=ASC&ordenarPor=nome';
    List<Deputado> listaDeputados = [];

    if(nome.isNotEmpty)
      link = link + '&nome=${nome}';

    if(partido.isNotEmpty)
      link = link + '&siglaPartido=${partido}';


    Response response = await get(link);

    var json = jsonDecode(response.body);

    for(var i = 0; i< json['dados'].length; i++) {
      var deputado = new Deputado(
          id: json['dados'][i]["id"],
          uri: json['dados'][i]["uri"],
          nome: json['dados'][i]["nome"],
          siglaPartido: json['dados'][i]["siglaPartido"],
          uriPartido: json['dados'][i]["uriPartido"],
          siglaUf: json['dados'][i]["siglaUf"],
          idLegislatura: json['dados'][i]["idLegislatura"],
          urlFoto: json['dados'][i]["urlFoto"],
          email: json['dados'][i]["email"]);

      listaDeputados.add(deputado);
    }

    if(listaDeputados.isEmpty){
      showDialog(context: context, builder: (BuildContext _) {
        return AlertDialog(title: Text("Atenção!"), content: Text("Não foi encontrado nenhum Deputado(a)!"), actions:[ElevatedButton(onPressed: () => Navigator.pop(_), child: Text("Ok"))]);
      });
    }else{
      Navigator.push(context, MaterialPageRoute(
        builder: (_) => listaDeputadosPage(listaDeputados: listaDeputados),
      ));
    }
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Buscar Deputado(s)'),
      ),
      body: ListView(
        children: [Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset("../lib/assets/Hired-pana.png"),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child:
               TextField(
                 controller: _NomeDeputado,
                 decoration: InputDecoration(
                   border: OutlineInputBorder(),
                   hintText: 'Digite o nome do Deputado',
                 ),
               ),
            ),Padding(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child:
                TextField(
                  controller: _Partido,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Digite a sigla do partido',
                  ),
            ),
            ),
            // TextButton(
            //   onPressed: () {
            //     setState((){
            //       listarDeputados(_NomeDeputado.text,_Partido.text);
            //     });
            //   },
            //
            //   child: Text("Buscar2"),
            // )
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                foregroundColor: Theme.of(context).colorScheme.onPrimary,
                backgroundColor: Theme.of(context).colorScheme.primary,
              ).copyWith(elevation: ButtonStyleButton.allOrNull(0.0)),
              onPressed: (){
                  setState((){
                  listarDeputados(_NomeDeputado.text,_Partido.text, context);
                });
              },
              child: const Text('Buscar'),
            ),

          ],
        )],
      ),
      );
  }
}