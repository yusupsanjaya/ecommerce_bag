import 'dart:convert';

class OrderRequestModel {
  final Data data;

  OrderRequestModel({
    required this.data,
  });

  factory OrderRequestModel.fromRawJson(String str) =>
      OrderRequestModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory OrderRequestModel.fromJson(Map<String, dynamic> json) =>
      OrderRequestModel(
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
      };
}

class Data {
  final List<Item> items;
  final int totalPrice;
  final String deliveryAddress;
  final String courierName;
  final int shippingCost;
  final String statusOrder;

  Data({
    required this.items,
    required this.totalPrice,
    required this.deliveryAddress,
    required this.courierName,
    required this.shippingCost,
    required this.statusOrder,
  });

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
        totalPrice: json["totalprice"],
        deliveryAddress: json["deliveryaddress"],
        courierName: json["couriername"],
        shippingCost: json["shippingcost"],
        statusOrder: json["statusorder"],
      );

  Map<String, dynamic> toJson() => {
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
        "totalprice": totalPrice,
        "deliveryaddress": deliveryAddress,
        "couriername": courierName,
        "shippingcost": shippingCost,
        "statusorder": statusOrder,
      };
}

class Item {
  final int id;
  final String productName;
  final int price;
  final int qty;

  Item({
    required this.id,
    required this.productName,
    required this.price,
    required this.qty,
  });

  factory Item.fromRawJson(String str) => Item.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        id: json["id"],
        productName: json["productname"],
        price: json["price"],
        qty: json["qty"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "productname": productName,
        "price": price,
        "qty": qty,
      };
}
