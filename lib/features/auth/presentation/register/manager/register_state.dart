import 'package:online_exam_app/features/auth/domain/entities/auth_entity.dart';

sealed class RegisterState {}

class RegisterInitialState extends RegisterState {}

class RegisterLoadingState extends RegisterState {}

class RegisterSuccessState extends RegisterState {
  final AuthEntity userEntity;
  RegisterSuccessState(this.userEntity);
}

class RegisterErrorState extends RegisterState {
  final String error;

  RegisterErrorState(this.error);
}

class HomeState {
  final bool isLoadingProducts;
  final String errorProducts;
  final List listProducts;

  final bool isLoadingCategories;
  final String errorCategories;
  final List listCategories;

  final bool isLoadingFavorities;
  final String errorFavorities;
  final List listFavorities;

  HomeState({
    this.isLoadingProducts = false,
    this.errorProducts = '',
    this.listProducts = const [],
    this.isLoadingCategories = false,
    this.listCategories = const [],
    this.errorCategories = '',
    this.isLoadingFavorities = false,
    this.errorFavorities = '',
    this.listFavorities = const [],
  });

  HomeState copyWith({
    bool? isLoadingProductsArgument,
    String? errorProductsArgument,
    List? listProductsArgument,
    bool? isLoadingCategoriesArgument,
    String? errorCategoriesArgument,
    List? listCategoriesArgument,
    bool? isLoadingFavoritiesArgument,
    String? errorFavoritiesArgument,
    List? listFavoritiesArgument,
  }) {
    return HomeState(
      isLoadingProducts: isLoadingProductsArgument ?? isLoadingProducts,
      errorProducts: errorProductsArgument ?? errorProducts,
      listProducts: listProductsArgument ?? listProducts,
      isLoadingCategories: isLoadingCategoriesArgument ?? isLoadingCategories,
      errorCategories: errorCategoriesArgument ?? errorCategories,
      listCategories: listCategoriesArgument ?? listCategories,
      isLoadingFavorities: isLoadingFavoritiesArgument ?? isLoadingFavorities,
      errorFavorities: errorFavoritiesArgument ?? errorFavorities,
      listFavorities: listFavoritiesArgument ?? listFavorities,
    );
  }
}
