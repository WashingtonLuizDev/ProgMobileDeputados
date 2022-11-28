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

          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 100, bottom: 16),
              child: Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  border: Border.all(color:Colors.black, width: 2.0),
                  image: DecorationImage(
                    alignment: Alignment.topCenter,
                    fit: BoxFit.fitHeight,
                      image: NetworkImage(
                          widget.deputado.urlFoto != null ? widget.deputado.urlFoto
                      : 'https://img.freepik.com/vetores-premium/pessoa-desaparecida-desconhecida-misterioso-homem-estranho-ilustracao-vetorial_100456-8314.jpg?w=2000',
                      ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: Text(
                widget.deputado.nome != null ? widget.deputado.nome : 'Sem Nome Teste',
                style: TextStyle(
                  fontSize: 40,
                  color: Colors.blueAccent,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: Text(
                widget.deputado.email != null ? 'Email: ' + widget.deputado.email : 'Não possui.',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.blueAccent,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: Text(
                widget.deputado.siglaUf != null ? 'UF: ' + widget.deputado.siglaUf : 'Não informada.',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.blueAccent,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: Text(
                widget.deputado.siglaPartido != null ? 'Partido: ' + widget.deputado.siglaPartido : 'Sem Partido' ,
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.blueAccent,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ],
        )));
  }
}
