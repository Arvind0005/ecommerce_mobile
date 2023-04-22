import 'dart:convert';

import 'package:flutter/material.dart';

List<ProductModel> ProductModelFromJson(String str) => List<ProductModel>.from(
    json.decode(str)['products'].map((x) => ProductModel.fromJson(x)));

class ProductModel {
  int id;
  String title;
  String description;
  String image;
  int price;
  String brand;
  String category;
  double discountPercentage;
  ProductModel(
      {this.id,
      this.title,
      this.category,
      this.price,
      this.description,
      this.brand,
      this.discountPercentage,
      this.image});

  Map toJson() => {
        'id': id,
        'title': title,
        'category': category,
        'price': price,
        'description': description,
        'brand': brand,
        'discountPerceentage': discountPercentage,
        'image': image,
      };

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    print("xxxxxzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz");
    print(json);
    return ProductModel(
      id: json['id'],
      title: json['title'],
      category: json['category'],
      price: json['price'],
      description: json['description'],
      brand: json['brand'],
      discountPercentage: json['discountPercentage'],
      image: json['images'][0],
    );
  }
}
