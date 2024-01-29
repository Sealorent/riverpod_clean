// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:flutter_project/shared/domain/models/product/product_model.dart';

enum DashboardConcreteState {
  initial,
  loading,
  loaded,
  failure,
  detailProduct,
  fetchingMore,
  fetchedAllProducts
}

class DashboardState extends Equatable {
  final List<Product> productList;
  final int total;
  final int page;
  final bool hasData;
  final DashboardConcreteState state;
  final String message;
  final bool isLoading;
  final Product? product;

  const DashboardState({
    this.productList = const [],
    this.isLoading = false,
    this.hasData = false,
    this.state = DashboardConcreteState.initial,
    this.message = '',
    this.page = 0,
    this.total = 0,
    this.product,
  });

  const DashboardState.initial({
    this.productList = const [],
    this.total = 0,
    this.page = 0,
    this.isLoading = false,
    this.hasData = false,
    this.state = DashboardConcreteState.initial,
    this.product,
    this.message = '',
  });


  DashboardState copyWith({
    List<Product>? productList,
    int? total,
    int? page,
    bool? hasData,
    DashboardConcreteState? state,
    Product? product,
    String? message,
    bool? isLoading,
  }) {
    return DashboardState(
      isLoading: isLoading ?? this.isLoading,
      productList: productList ?? this.productList,
      total: total ?? this.total,
      page: page ?? this.page,
      hasData: hasData ?? this.hasData,
      state: state ?? this.state,
      message: message ?? this.message,
      product: product ?? this.product,
    );
  }

  @override
  String toString() {
    return 'DashboardState(isLoading:$isLoading, productLength: ${productList.length},total:$total page: $page, hasData: $hasData, state: $state, message: $message , product: $product)';
  }

  @override
  List<Object?> get props => [productList, page, hasData, state, message , product];
}
