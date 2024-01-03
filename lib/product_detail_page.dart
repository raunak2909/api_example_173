import 'package:api_example_173/product_data_model.dart';
import 'package:flutter/material.dart';

class ProductDetailPage extends StatelessWidget {
  ProductModel thisProduct;
  ProductDetailPage({required this.thisProduct});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${thisProduct.title}'),
      ),
      body: Column(
        children: [
          Image.network(thisProduct.thumbnail!),
          Text(thisProduct.title!),
          Text(thisProduct.description!),
        ],
      ),
    );
  }
}
