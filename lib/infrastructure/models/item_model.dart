class ItemModel {
  final int? id;
  final String name;
  final int price;
  final int quantity;

  ItemModel({
    this.id,
    required this.name,
    required this.price,
    required this.quantity,
  });

  factory ItemModel.fromJson(Map<String, dynamic> json) => ItemModel(
        id: json['id'],
        name: json['name'],
        price: json['price'],
        quantity: json['quantity'],
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['id'] = id;
    json['name'] = name;
    json['price'] = price;
    json['quantity'] = quantity;
    return json;
  }
}
