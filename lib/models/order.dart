class Order {
  final int? id;
  final double? total;
  final DateTime? receiveDate;
  final OrderStatus? statusDTO;
  final ProductOrderDTO? productOrderDTO;

  Order({
    this.id,
    this.total,
    this.receiveDate,
    this.statusDTO,
    this.productOrderDTO,
  });

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      id: json['id'],
      total: json['total'],
      receiveDate: DateTime.parse(json['receiveDate']),
      statusDTO: OrderStatus.fromJson(json['statusDTO']),
      productOrderDTO: ProductOrderDTO.fromJson(json['productOrderDTO']),
    );
  }
}

class OrderStatus {
  final int? id;
  final String? name;

  OrderStatus({
    this.id,
    this.name,
  });

  factory OrderStatus.fromJson(Map<String, dynamic> json) {
    return OrderStatus(
      id: json['id'],
      name: json['name'],
    );
  }
}

class ProductOrderDTO {
  final int? id;
  final double? price;
  final String? name;
  final String? description;
  final String? memory;
  final String? color;
  final String? seri;
  final String? image;

  ProductOrderDTO({
    this.id,
    this.price,
    this.name,
    this.description,
    this.memory,
    this.color,
    this.seri,
    this.image,
  });

  factory ProductOrderDTO.fromJson(Map<String, dynamic> json) {
    return ProductOrderDTO(
      id: json['id'],
      price: json['price'],
      name: json['name'],
      description: json['description'],
      memory: json['memory'],
      color: json['color'],
      seri: json['seri'],
      image: json['image'],
    );
  }
}
