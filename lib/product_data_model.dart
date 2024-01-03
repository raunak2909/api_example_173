class ProductDataModel {
  int? limit;
  int? skip;
  int? total;
  List<ProductModel>? products;

  ProductDataModel({required this.limit,
    required this.skip,
    required this.total,
    required this.products});

  factory ProductDataModel.fromJson(Map<String, dynamic> json){
    List<ProductModel> listData = [];

    for(Map<String, dynamic> eachProduct in json['products']){
      listData.add(ProductModel.fromJson(eachProduct));
    }


    return ProductDataModel(
        limit: json['limit'],
        skip: json['skip'],
        total: json['total'],
        products: listData);
  }

}

class ProductModel {
  String? brand;
  String? category;
  String? description;
  String? thumbnail;
  String? title;
  num? discountPercentage;
  int? id;
  num? price;
  num? rating;
  int? stock;
  List<dynamic>? images;

  ProductModel({required this.brand,
    required this.category,
    required this.description,
    required this.thumbnail,
    required this.title,
    required this.discountPercentage,
    required this.id,
    required this.price,
    required this.rating,
    required this.stock,
    required this.images});

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
        brand: json['brand'],
        category: json['category'],
        description: json['description'],
        thumbnail: json['thumbnail'],
        title: json['title'],
        discountPercentage: json['discountPercentage'],
        id: json['id'],
        price: json['price'],
        rating: json['rating'],
        stock: json['stock'],
        images: json['images']);
  }
}
