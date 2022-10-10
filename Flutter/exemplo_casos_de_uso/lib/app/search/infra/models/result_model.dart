import 'dart:convert';

import 'package:clean_dart_github_search/app/search/domain/entities/result.dart';

class ResultModel extends Result {
  final String nome;
  final String cargo;
  final String setor;
  final String imagem;
  final int feriasdisponiveis;
  final int feriasvencidas;
  final int solicitacoespendentes;
  final double salario;
  final int ultimapromocao;
  final int datanascimento;
  final String sexo;
  final String cpf;
  final String identidade;
  final String identidadeorgao;

  ResultModel({
    required this.nome,
    required this.cargo,
    required this.setor,
    required this.imagem,
    required this.feriasdisponiveis,
    required this.feriasvencidas,
    required this.solicitacoespendentes,
    required this.salario,
    required this.ultimapromocao,
    required this.datanascimento,
    required this.sexo,
    required this.cpf,
    required this.identidade,
    required this.identidadeorgao,
  }) : super('', '', '', '', '', '', 0, 0, 0, 0.0, 0, 0, '', '');

  Map<String, dynamic> toMap() {
    return {
      'nome': nome,
      'cargo': cargo,
      'setor': setor,
      'imagem': imagem,
      'feriasdisponiveis': feriasdisponiveis,
      'feriasvencidas': feriasvencidas,
      'solicitacoespendentes': solicitacoespendentes,
      'salario': salario,
      'ultimapromocao': ultimapromocao,
      'datanascimento': datanascimento,
      'sexo': sexo,
      'cpf': cpf,
      'identidade': identidade,
      'identidadeorgao': identidadeorgao,
    };
  }

  static ResultModel fromMap(Map<String, dynamic> map) {
    return ResultModel(
      nome: map['nome'],
      cargo: map['cargo'],
      setor: map['setor'],
      imagem: map['imagem'],
      feriasdisponiveis: map['feriasdisponiveis'],
      feriasvencidas: map['feriasvencidas'],
      solicitacoespendentes: map['solicitacoespendentes'],
      salario: map['salario'],
      ultimapromocao: map['ultimapromocao'],
      datanascimento: map['datanascimento'],
      sexo: map['sexo'],
      cpf: map['cpf'],
      identidade: map['identidade'],
      identidadeorgao: map['identidadeorgao'],
    );
  }

  String toJson() => json.encode(toMap());

  static ResultModel fromJson(String source) => fromMap(json.decode(source));
}
