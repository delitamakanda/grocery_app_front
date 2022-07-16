class Product {
  int? _count;
  String? _next;
  String? _previous;
  late List<ProductModel> _results;
  List<ProductModel> get products => _results;

  Product(
      {required count, required next, required previous, required products}) {
    this._count = count;
    this._next = next;
    this._previous = previous;
    this._results = products;
  }

  Product.fromJson(Map<String, dynamic> json) {
    _count = json['count'];
    _next = json['next'];
    _previous = json['previous'];
    if (json['results'] != null) {
      _results = <ProductModel>[];
      json['results'].forEach((product) {
        _results.add(ProductModel.fromJson(product));
      });
    }
  }
}

class ProductModel {
  late String id;
  String? name;
  String? description;
  String? price;
  int? stars;
  String? img;
  String? location;
  String? createdAt;
  String? updatedAt;
  int? category;

  ProductModel(
      {required this.id,
      this.name,
      this.description,
      this.price,
      this.stars,
      this.img,
      this.location,
      this.createdAt,
      this.updatedAt,
      this.category});
  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    price = json['price'];
    stars = json['stars'];
    img = json['img'];
    location = json['location'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    category = json['category'];
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "price": price,
      "img": img,
      "location": location,
      "created_at": createdAt,
      "updated_at": updatedAt,
      "category": category,
    };
  }
}
