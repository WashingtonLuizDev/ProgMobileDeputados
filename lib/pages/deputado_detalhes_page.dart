import 'package:deputados/models/deputado.dart';
import 'package:flutter/material.dart';

class DeputadoDetalhesPage extends StatefulWidget {
  Deputado deputado;

  DeputadoDetalhesPage({Key? key, required this.deputado}) : super(key: key);

  @override
  _DeputadoDetalhesPageState createState() => _DeputadoDetalhesPageState();
}

class _DeputadoDetalhesPageState extends State<DeputadoDetalhesPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Deputado(a)'),
        ),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: Image.network(widget.deputado.urlFoto != null
                  ? widget.deputado.urlFoto
                  : 'https://img.freepik.com/vetores-premium/pessoa-desaparecida-desconhecida-misterioso-homem-estranho-ilustracao-vetorial_100456-8314.jpg?w=2000'
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: Text(
                widget.deputado.nome != null ? widget.deputado.nome : 'Sem Nome',
                style: TextStyle(
                  fontSize: 40,
                  color: Colors.black54,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: Text(
                widget.deputado.siglaPartido != null ? widget.deputado.siglaPartido : 'Sem Partido' ,
                style: TextStyle(
                  fontSize: 40,
                  color: Colors.black54,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ],
        )));
  }
}
