import 'package:mobile_store/models/product/product_category.dart';
import 'package:mobile_store/models/product/product_image.dart';
import 'package:mobile_store/models/product/product_manufacturer.dart';
import 'package:mobile_store/models/product/product_memory.dart';
import 'package:mobile_store/models/product/product_review.dart';
import 'package:mobile_store/models/product/product_seri.dart';
import 'package:mobile_store/models/product/product_tech.dart';

import 'product_color.dart';

class Product {
  final int? id;
  final String? name;
  final Category? category;
  final Manufacturer? manufacturer;
  final String? description;
  final double? price;
  final int? stocks;
  final bool? status;
  final int? views;
  final double? star;
  final List<ProductTech>? productTechs;
  final List<Seri>? series;
  final List<ColorDTO>? colors;
  final List<Memory>? memories;
  final List<Review>? reviews;
  final List<Image>? images;

  Product(
      {this.id,
      this.category,
      this.manufacturer,
      this.description,
      this.price,
      this.stocks,
      this.status,
      this.views,
      this.star,
      this.productTechs,
      this.series,
      this.colors,
      this.memories,
      this.reviews,
      this.images,
      this.name});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
        id: json["id"],
        category: Category.fromJson(json["categoriesDTO"]),
        manufacturer: Manufacturer.fromJson(json["manufacturerDTO"]),
        description: json["description"],
        price: json["price"],
        stocks: json["stocks"],
        status: json["status"],
        views: json["views"],
        star: json["star"],
        productTechs: List<ProductTech>.from(json["productTechDTOs"]
            .map((e) => ProductTech.fromJson(e))
            .toList()),
        series: List<Seri>.from(
            json["seriDTOs"].map((e) => Seri.fromJson(e)).toList()),
        colors: List<ColorDTO>.from(
            json["colorDTOs"].map((e) => ColorDTO.fromJson(e)).toList()),
        memories: List<Memory>.from(
            json["memoryDTOs"].map((e) => Memory.fromJson(e)).toList()),
        reviews: List<Review>.from(
            json["reviewDTOs"].map((e) => Review.fromJson(e)).toList()),
        images: List<Image>.from(
            json["imageDTOs"].map((e) => Image.fromJson(e)).toList()),
        name: json["name"]);
  }
}
