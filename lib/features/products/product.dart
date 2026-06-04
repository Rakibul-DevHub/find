class Product {
  final String code;
  final String name;
  final String variant;
  final int buyPrice;
  final int sellPrice;
  int stock;

  Product({
    required this.code,
    required this.name,
    required this.variant,
    required this.buyPrice,
    required this.sellPrice,
    required this.stock,
  });
}