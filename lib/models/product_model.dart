class ProductModel {
  final String imgUrl;
  final String desc;
  final String price;
  final String? disc;

  ProductModel(
      {required this.imgUrl,
      required this.desc,
      required this.price,
      this.disc});
  factory ProductModel.fromJson(data) {
    return ProductModel(
        imgUrl: data["img"],
        desc: data["desc"],
        price: data["price"],
        disc: data["disc"]);
  }
  Map<String, Object?> toMap() {
    return {
      "img": imgUrl,
      "desc": desc,
      "price": price,
      "disc": disc,
    };
  }
}
