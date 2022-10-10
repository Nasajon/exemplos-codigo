class Result {
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

  const Result(
      this.identidade,
      this.identidadeorgao,
      this.nome,
      this.cargo,
      this.setor,
      this.imagem,
      this.feriasdisponiveis,
      this.feriasvencidas,
      this.solicitacoespendentes,
      this.salario,
      this.ultimapromocao,
      this.datanascimento,
      this.sexo,
      this.cpf);
}
