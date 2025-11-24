import 'package:plux/src/data/models/product/product_model.dart';

class AllProductState {
  final List<ProductModel> allProducts;

  const AllProductState({this.allProducts = const []});

  factory AllProductState.initial() => const AllProductState();

  AllProductState copyWith({List<ProductModel>? allProducts}) {
    return AllProductState(allProducts: allProducts ?? this.allProducts);
  }
}

class SearchProductState {
  final List<ProductModel> products;

  const SearchProductState({this.products = const []});

  factory SearchProductState.initial() => const SearchProductState();

  SearchProductState copyWith({List<ProductModel>? products}) {
    return SearchProductState(products: products ?? this.products);
  }
}
