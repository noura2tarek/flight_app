import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'main_page_controller_state.dart';

class MainPageControllerCubit extends Cubit<MainPageControllerState> {
  MainPageControllerCubit() : super(MainPageControllerInitial());

  ///////////////////start

  static MainPageControllerCubit get(BuildContext context) {
    return BlocProvider.of(context);
  }

  int currentIndex = 0;

void onTap(int value) {
    currentIndex = value;
    emit(MainPageChangeIndex());
  }
}
