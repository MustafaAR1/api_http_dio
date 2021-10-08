class Products {
  final name;
  final unitId;

  Products(this.name, this.unitId);

  factory Products.fromJson(Map<String, dynamic> json) {
    return Products(json['name'], json['unit_id'] ?? '');
  }
}
