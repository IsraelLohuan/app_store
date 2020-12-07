class Address {
  String id;
  String rua;
  String logradouro;
  String uf;
  String cidade;
  String bairro;
  String cep;
  String numero;
  String descricao;
  String deleted;
  String idPessoa;

  Address(
      {this.id,
        this.rua,
        this.logradouro,
        this.uf,
        this.cidade,
        this.bairro,
        this.cep,
        this.numero,
        this.descricao,
        this.deleted,
        this.idPessoa});

  Address.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    rua = json['rua'];
    logradouro = json['logradouro'];
    uf = json['uf'];
    cidade = json['cidade'];
    bairro = json['bairro'];
    cep = json['cep'];
    numero = json['numero'];
    descricao = json['descricao'];
    deleted = json['deleted'];
    idPessoa = json['id_pessoa'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['rua'] = this.rua;
    data['logradouro'] = this.logradouro;
    data['uf'] = this.uf;
    data['cidade'] = this.cidade;
    data['bairro'] = this.bairro;
    data['cep'] = this.cep;
    data['numero'] = this.numero;
    data['descricao'] = this.descricao;
    data['deleted'] = this.deleted;
    data['id_pessoa'] = this.idPessoa;
    return data;
  }
}