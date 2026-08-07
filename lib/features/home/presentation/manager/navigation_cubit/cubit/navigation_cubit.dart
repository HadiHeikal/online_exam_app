import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class NavigationCubit extends Cubit<int> {
  NavigationCubit() : super(0);

  void changeIndex(int index) {
    emit(index);
  }
}
