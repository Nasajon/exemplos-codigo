import 'package:flutter_modular/flutter_modular.dart';

import '../../infra/datasources/search_datasource.dart';
import '../../infra/models/result_model.dart';
part 'mock_search_datasource.g.dart';

@Injectable(singleton: false)
class MockitoSearchDatasource implements SearchDatasource {
  @override
  List<ResultModel> searchText(String textSearch) {
    var result = mockJsonData;
    var list = result
        .map(
          (item) => ResultModel(
            nome: item['nome'],
            cargo: item['cargo'],
            setor: item['setor'],
            imagem: item['imagem'],
            feriasdisponiveis: item['feriasdisponiveis'],
            feriasvencidas: item['feriasvencidas'],
            solicitacoespendentes: item['solicitacoespendentes'],
            salario: item['salario'],
            ultimapromocao: item['ultimapromocao'],
            datanascimento: item['datanascimento'],
            sexo: item['sexo'],
            cpf: item['cpf'],
            identidade: item['identidade'],
            identidadeorgao: item['identidadeorgao'],
          ),
        )
        .toList();
    return list;
  }
}

List mockJsonData = [
  {
    "nome": "Matheus Mariano",
    "cargo": "Estagiário de Arquitetura",
    "setor": "P&D - Desenvolvimento",
    "imagem": "https://avatars.githubusercontent.com/u/82106181?v=4",
    "feriasdisponiveis": 4,
    "feriasvencidas": 4,
    "solicitacoespendentes": 4,
    "salario": 423035,
    "ultimapromocao": 20201212,
    "datanascimento": 19950321,
    "sexo": "Masculino",
    "cpf": "000.000.000-00",
    "identidade": "000.000.000-00",
    "identidadeorgao": "DETRAN",
  },
  {
    "nome": "Sergio Silva",
    "cargo": "Supervisor de Arquitetura",
    "setor": "P&D - Desenvolvimento",
    "imagem": "https://avatars.githubusercontent.com/u/39312013?v=4",
    "feriasdisponiveis": 20,
    "feriasvencidas": 2,
    "solicitacoespendentes": 4,
    "salario": 1423035,
    "ultimapromocao": 20181212,
    "datanascimento": 19880212,
    "sexo": "Masculino",
    "cpf": "000.000.000-00",
    "identidade": "000.000.000-00",
    "identidadeorgao": "SSP",
  },
  {
    "nome": "Walace Pinho",
    "cargo": "Programador de Arquitetura",
    "setor": "P&D - Desenvolvimento",
    "imagem": "https://avatars.githubusercontent.com/u/46355505?v=4",
    "feriasdisponiveis": 12,
    "feriasvencidas": 2,
    "solicitacoespendentes": 4,
    "salario": 1023035,
    "ultimapromocao": 20220712,
    "datanascimento": 19900415,
    "sexo": "Masculino",
    "cpf": "000.000.000-00",
    "identidade": "000.000.000-00",
    "identidadeorgao": "SSP",
  },
];
