import 'package:appstore/app/models/item_order.dart';

class Order {

  static const int ENTREGUE = 2;
  static const int APROVACAO = 3;
  static const int CANCELADO = 4;
  static const int ENTREGA = 5;

  String id;
  double valorTotal;
  String dataCadastro;
  String idPessoa;
  String statusPedidoId;
  String statusPedido;
  int enderecoId;
  String deleted;
  List<ItemOrder> items;

  Order(
      {this.id,
        this.valorTotal,
        this.dataCadastro,
        this.idPessoa,
        this.statusPedidoId,
        this.enderecoId,
        this.deleted,
        this.items});

  Order.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    valorTotal = double.parse(json['valor_total']);
    dataCadastro = json['data_cadastro'];
    idPessoa = json['id_pessoa'];
    statusPedidoId = json['status_pedido_id'];
    enderecoId = int.parse(json['endereco_id']);
    deleted = json['deleted'];
    statusPedido = json['status'];
    if (json['items'] != null) {
      items = new List<ItemOrder>();
      json['items'].forEach((v) {
        items.add(new ItemOrder.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['valor_total'] = this.valorTotal;
    data['data_cadastro'] = this.dataCadastro;
    data['id_pessoa'] = this.idPessoa;
    data['status_pedido_id'] = this.statusPedidoId;
    data['endereco_id'] = this.enderecoId;
    data['deleted'] = this.deleted;
    if (this.items != null) {
      data['items'] = this.items.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

