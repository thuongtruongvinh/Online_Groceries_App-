import 'package:flutter_bloc/flutter_bloc.dart';

class BottomTabBloc extends Cubit<int> {
  BottomTabBloc() : super(0);

  changeSelectedIndex(newIndex) => emit(newIndex);
}
