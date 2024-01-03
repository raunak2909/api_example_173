import 'dart:convert';

import 'package:api_example_173/product_data_model.dart';
import 'package:api_example_173/product_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as httpClient;

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  ProductDataModel? productData;

  @override
  void initState() {
    super.initState();
    getProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Products'),
      ),
      body: productData != null
          && productData!.products!.isNotEmpty ?
      ListView.builder(
        itemCount: productData!.products!.length,
          itemBuilder: (_, index){
        var eachProduct = productData!.products![index];
        return Column(
          children: [
            ListTile(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDetailPage(thisProduct: eachProduct),));
              },
              title: Text(eachProduct.title!),
              subtitle: Text(eachProduct.description!),
              leading: Image.network(eachProduct.thumbnail!, width: 40, height: 40,),
              trailing: Text('\u{20B9} ${eachProduct.price!.toString()}'),
            ),
            Container(
              height: 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: eachProduct.images!.length,
                  itemBuilder: (_, childIndex){
                  var eachImg = eachProduct.images![childIndex];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.network(eachImg,),
                  );
                  }),
            )
          ],
        );
      }) : Container(
        child: Center(
          child: Text('No Products!!'),
        ),
      ),
    );
  }

  void getProducts() async{

    var uri = Uri.parse("https://dummyjson.com/products");

    var response = await httpClient.get(uri);

    print("code: ${response.statusCode}");
    print("body: ${response.body}");

    if(response.statusCode==200){
      var rawData = jsonDecode(response.body);
      productData = ProductDataModel.fromJson(rawData);
      setState(() {

      });
      print(productData);
    }


  }
}
