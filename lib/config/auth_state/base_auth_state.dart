// ignore_for_file: public_member_api_docs, sort_constructors_first
class BaseAuthState<T> {
  final bool isBoxChecked;
  final bool isLoading;
  final T? data;
  final String errorMesage;
  BaseAuthState({
     this.isBoxChecked = false,
     this.isLoading =   false,
     this.data,
     this.errorMesage = "",
  });

  BaseAuthState<T> copyWith({
    bool? isBoxChecked,
    bool? isLoading,
    T? data,
    String? errorMesage,
  }) {
    return BaseAuthState<T>(
      isBoxChecked: isBoxChecked ?? this.isBoxChecked,
      isLoading: isLoading ?? this.isLoading,
      data: data ?? this.data,
      errorMesage: errorMesage ?? this.errorMesage,
    );
  }
}
