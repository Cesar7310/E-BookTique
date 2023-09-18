import 'package:e_booktique/data/product_list.dart';
import 'package:e_booktique/models/product_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductNotifier extends StateNotifier<List<ProdcutModel>> {
  ProductNotifier() : super(productsItems);
}

final productNotifierProvider =
    StateNotifierProvider<ProductNotifier, List<ProdcutModel>>((ref) {
  return ProductNotifier();
});
