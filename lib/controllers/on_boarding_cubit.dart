import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../data/data_source/local/cache_helper.dart';
import '../data/data_source/static/lists.dart';
import '../presentation/screens/enter_data/enter_data_screen.dart';
part 'on_boarding_state.dart';

class OnBoardingCubit extends Cubit<OnBoardingState> {
  OnBoardingCubit() : super(OnBoardingInitialState());
  PageController controller = PageController();
  int currentIndex = 0;

  //
  static OnBoardingCubit get(BuildContext context) {
    return BlocProvider.of(context);
  }

  //on page changed
  onPageChanged(int value){
    currentIndex = value;
    emit(ChangePageState());
  }

  // Skip function
  skip({required BuildContext context}) {
    CacheHelper.savaData(key: 'skipBoarding', value: true);
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
      builder: (context) {
        return  EnterData();
      },
    ), (route) => false);
    emit(OnBoardingSkipState());
  }

  // next page function
  next({required BuildContext context}) {
    if (currentIndex < boardingList.length - 1) {
      controller.nextPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.fastLinearToSlowEaseIn,
      );
      emit(OnBoardingNextState());
    } else if (currentIndex == boardingList.length - 1) {
      skip(context: context);
      emit(OnBoardingSkipState());
    }
  }

// init(){
//
// }
}
