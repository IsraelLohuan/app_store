class Product {
  int id;
  int cartQuantity;
  double preco;
  double desconto;
  String descricao;
  String url;
  String titulo;
  bool destaque;
  bool masculino;

  Product(
      {this.id,
        this.preco,
        this.descricao,
        this.desconto,
        this.masculino,
        this.url,
        this.titulo,
        this.destaque});

  Product.fromJson(Map<String, dynamic> json) {
    id = int.parse(json['id']);
    preco = double.parse(json['preco']);
    descricao = json['descricao'];
    desconto = double.parse(json['desconto']);
    masculino = json['masculino'] == "1";
    url = json['url_image'];
    titulo = json['titulo'];
    destaque = json['destaque'] == "1";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['preco'] = this.preco;
    data['descricao'] = this.descricao;
    data['desconto'] = this.desconto;
    data['masculino'] = this.masculino;
    data['url_image'] = this.url;
    data['titulo'] = this.titulo;
    data['destaque'] = this.destaque;
    return data;
  }
}