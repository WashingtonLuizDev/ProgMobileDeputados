import 'package:deputados/models/deputado.dart';
import 'package:deputados/pages/deputado_detalhes_page.dart';
import 'package:deputados/repositories/deputado_repository.dart';
import 'package:flutter/material.dart';

class listaDeputadosPage extends StatefulWidget {
  List<Deputado> listaDeputados = [];

  listaDeputadosPage({Key? key, required this.listaDeputados}) : super(key: key);

  @override
  //State<listaDeputadosPage> createState() => _listaDeputadosPageState();
  _listaDeputadosPageState createState() => _listaDeputadosPageState();
}

class _listaDeputadosPageState extends State<listaDeputadosPage> {
  //final listaDeputados = DeputadoRepository.listaDeputados;
  List<Deputado> selecionadas = [];

  mostrarDeputados(Deputado deputado) {
    Navigator.push(context, MaterialPageRoute(
        builder: (_) => DeputadoDetalhesPage(deputado: deputado),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Listar Deputados(as)'),
      ),
      body: ListView.separated(
        itemBuilder: (BuildContext context, int id) {
          return ListTile(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(12)),
            ),
            leading: (selecionadas.contains(widget.listaDeputados[id]))
                ? CircleAvatar(
              child: Icon(Icons.check),
            )
                : SizedBox(
              child: Image.network(widget.listaDeputados[id].urlFoto != null
                  ? widget.listaDeputados[id].urlFoto
                  : 'https://img.freepik.com/vetores-premium/pessoa-desaparecida-desconhecida-misterioso-homem-estranho-ilustracao-vetorial_100456-8314.jpg?w=2000'
                  , width: 100.0, height: 100.0),
              width: 40,
            ),
            title: Text(widget.listaDeputados[id].nome),
            trailing: Text(widget.listaDeputados[id].siglaPartido != null
            ? widget.listaDeputados[id].siglaPartido
            : 'Sem Partido'
            ),
            selected: selecionadas.contains(widget.listaDeputados[id]),
            selectedTileColor: Colors.indigo.shade50,
            onLongPress: () {
              setState(() {
                (selecionadas.contains(widget.listaDeputados[id]))
                    ? selecionadas.remove(widget.listaDeputados[id])
                    : selecionadas.add(widget.listaDeputados[id]);
              });
            },
            onTap: () => mostrarDeputados(widget.listaDeputados[id]),
          );
        },
        padding: EdgeInsets.all(16),
        separatorBuilder: (_, __) => Divider(),
        itemCount: widget.listaDeputados.length,
      ),
    );
  }
}
