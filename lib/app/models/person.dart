class Person {
  String id;
  String nome;
  String dataCadastro;
  String documento;
  String telefone;
  String fileName;
  String email;
  String deleted;
  String senha;
  String admin;

  Person(
      {this.id,
        this.nome,
        this.dataCadastro,
        this.documento,
        this.telefone,
        this.fileName,
        this.email,
        this.deleted,
        this.senha,
        this.admin});

  Person.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nome = json['nome'];
    dataCadastro = json['data_cadastro'];
    documento = json['documento'];
    telefone = json['telefone'];
    fileName = json['file_name'];
    email = json['email'];
    deleted = json['deleted'];
    senha = json['senha'];
    admin = json['admin'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nome'] = this.nome;
    data['data_cadastro'] = this.dataCadastro;
    data['documento'] = this.documento;
    data['telefone'] = this.telefone;
    data['file_name'] = this.fileName;
    data['email'] = this.email;
    data['deleted'] = this.deleted;
    data['senha'] = this.senha;
    data['admin'] = this.admin;
    return data;
  }
}