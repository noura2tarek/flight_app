import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phone_form_field/phone_form_field.dart';
import '../../data/data_source/local/cache_helper.dart';
import '../../presentation/core/resources/routes_manager.dart';
part 'enter_data_state.dart';

class EnterDataCubit extends Cubit<EnterDataState> {
  EnterDataCubit() : super(EnterDataInitial());

  // get method
  static EnterDataCubit get(BuildContext context) {
    return BlocProvider.of(context);
  }

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  PhoneController phoneNumberController = PhoneController();
  final FocusNode focusNode = FocusNode();
  bool outlineBorder = true;
  bool mobileOnly = true;
  bool isCountryButtonPersistent = true;
  bool withLabel = true;
  CountrySelectorNavigator selectorNavigator =
      const CountrySelectorNavigator.page();
  Locale locale = const Locale('en');
  final formKey = GlobalKey<FormState>();

  // on change field
  dynamic onChangeField(PhoneNumber p) {
    print('changed $p');
    emit(ChangePhoneFieldState());
  }

  // next method
  next(BuildContext context) {
    CacheHelper.savaData(key: 'passEnterDate', value: true);
    Navigator.pushNamed(context, AppRoutes.enterBirthDateRoute);
  }
}
