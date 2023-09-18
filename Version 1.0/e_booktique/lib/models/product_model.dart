class ProdcutModel {
  final int id;
  final String imgUrl;
  final String title;
  final double price;
  final String description;
  final String genero;
  final int reviews;
  final double rating;
  final bool isSelected;
  final int cantidad;

  ProdcutModel({
    required this.id,
    required this.imgUrl,
    required this.title,
    required this.price,
    required this.description,
    required this.genero,
    required this.reviews,
    required this.rating,
    this.isSelected = false,
    this.cantidad = 1,
  });
}
