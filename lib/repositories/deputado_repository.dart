import 'package:deputados/models/deputado.dart';

class DeputadoRepository {
  static List<Deputado> listaDeputados = [
    Deputado(
        id: 204374,
        uri: 'https://dadosabertos.camara.leg.br/api/v2/deputados/204374',
        nome: 'Bia Kicis',
        siglaPartido: 'PL',
        uriPartido: 'https://dadosabertos.camara.leg.br/api/v2/partidos/37906',
        siglaUf: 'DF',
        idLegislatura: 56,
        urlFoto: 'https://www.camara.leg.br/internet/deputado/bandep/204374.jpg',
        email: 'dep.biakicis@camara.leg.br'),
    Deputado(
        id: 204536,
        uri: 'https://dadosabertos.camara.leg.br/api/v2/deputados/204536',
        nome: 'Kim Kataguiri',
        siglaPartido: 'UNIÃO',
        uriPartido: 'https://dadosabertos.camara.leg.br/api/v2/partidos/38009',
        siglaUf: 'SP',
        idLegislatura: 57,
        urlFoto: 'https://www.camara.leg.br/internet/deputado/bandep/204536.jpg',
        email: 'dep.kimkataguiri@camara.leg.br')
  ];
}
