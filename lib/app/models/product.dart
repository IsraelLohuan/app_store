class Product {
  int id;
  int cartQuantity;
  double preco;
  double desconto;
  String descricao;
  String filename;
  String titulo;
  String base64;
  bool destaque;
  bool masculino;

  Product(
      {this.id,
        this.preco,
        this.descricao,
        this.desconto,
        this.masculino,
        this.filename,
        this.titulo,
        this.base64,
        this.destaque});

  Product.fromJson(Map<String, dynamic> json) {
    id = int.parse(json['id']);
    preco = double.parse(json['preco']);
    descricao = json['descricao'];
    desconto = double.parse(json['desconto']);
    masculino = json['masculino'] == "1";
    filename = json['filename'];
    titulo = json['titulo'];
    base64 = json['base_64'];
    destaque = json['destaque'] == "1";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['preco'] = this.preco;
    data['descricao'] = this.descricao;
    data['desconto'] = this.desconto;
    data['masculino'] = this.masculino;
    data['filename'] = this.filename;
    data['titulo'] = this.titulo;
    data['base_64'] = this.base64;
    data['destaque'] = this.destaque;
    return data;
  }
}