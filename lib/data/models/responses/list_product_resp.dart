// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ListproductResponseModel {
  List<Product>? data;
  Meta? meta;

  ListproductResponseModel({
    this.data,
    this.meta,
  });

  factory ListproductResponseModel.fromRawJson(String str) =>
      ListproductResponseModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ListproductResponseModel.fromJson(Map<String, dynamic> json) =>
      ListproductResponseModel(
        data: json["data"] == null
            ? []
            : List<Product>.from(json["data"]!.map((x) => Product.fromJson(x))),
        meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
        "meta": meta?.toJson(),
      };
}

class Product {
  int? id;
  Attributes? attributes;

  Product({
    this.id,
    this.attributes,
  });

  factory Product.fromRawJson(String str) => Product.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        attributes: json["attributes"] == null
            ? null
            : Attributes.fromJson(json["attributes"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "attributes": attributes?.toJson(),
      };
}

class Attributes {
  String? name;
  String? description;
  int? quantity;
  int? price;
  bool? inStock;
  String? distributor;
  DateTime? createdAt;
  DateTime? updatedAt;
  DateTime? publishedAt;
  String? image;

  Attributes({
    this.name,
    this.description,
    this.quantity,
    this.price,
    this.inStock,
    this.distributor,
    this.createdAt,
    this.updatedAt,
    this.publishedAt,
    this.image,
  });

  factory Attributes.fromRawJson(String str) =>
      Attributes.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Attributes.fromJson(Map<String, dynamic> json) => Attributes(
        name: json["name"],
        description: json["description"],
        quantity: json["quantity"],
        price: json["price"],
        inStock: json["inStock"],
        distributor: json["distributor"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        publishedAt: json["publishedAt"] == null
            ? null
            : DateTime.parse(json["publishedAt"]),
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "description": description,
        "quantity": quantity,
        "price": price,
        "inStock": inStock,
        "distributor": distributor,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "publishedAt": publishedAt?.toIso8601String(),
        "image": image,
      };

  @override
  bool operator ==(covariant Attributes other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.description == description &&
        other.quantity == quantity &&
        other.price == price &&
        other.inStock == inStock &&
        other.distributor == distributor &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt &&
        other.publishedAt == publishedAt &&
        other.image == image;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        description.hashCode ^
        quantity.hashCode ^
        price.hashCode ^
        inStock.hashCode ^
        distributor.hashCode ^
        createdAt.hashCode ^
        updatedAt.hashCode ^
        publishedAt.hashCode ^
        image.hashCode;
  }
}

class Meta {
  Pagination? pagination;

  Meta({
    this.pagination,
  });

  factory Meta.fromRawJson(String str) => Meta.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        pagination: json["pagination"] == null
            ? null
            : Pagination.fromJson(json["pagination"]),
      );

  Map<String, dynamic> toJson() => {
        "pagination": pagination?.toJson(),
      };
}

class Pagination {
  int? page;
  int? pageSize;
  int? pageCount;
  int? total;

  Pagination({
    this.page,
    this.pageSize,
    this.pageCount,
    this.total,
  });

  factory Pagination.fromRawJson(String str) =>
      Pagination.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
        page: json["page"],
        pageSize: json["pageSize"],
        pageCount: json["pageCount"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "page": page,
        "pageSize": pageSize,
        "pageCount": pageCount,
        "total": total,
      };
}
