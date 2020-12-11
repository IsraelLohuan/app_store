class ItemOrder {
  String id;
  String idProduto;
  String idPedido;
  String deleted;
  String quantidade;
  String preco;
  String desconto;

  ItemOrder(
      {this.id,
        this.idProduto,
        this.idPedido,
        this.deleted,
        this.quantidade,
        this.preco,
        this.desconto});

  ItemOrder.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    idProduto = json['id_produto'];
    idPedido = json['id_pedido'];
    deleted = json['deleted'];
    quantidade = json['quantidade'];
    preco = json['preco'];
    desconto = json['desconto'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['id_produto'] = this.idProduto;
    data['id_pedido'] = this.idPedido;
    data['deleted'] = this.deleted;
    data['quantidade'] = this.quantidade;
    data['preco'] = this.preco;
    data['desconto'] = this.desconto;
    return data;
  }
}