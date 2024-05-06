import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../presentation/core/resources/routes_manager.dart';
part 'payment_state.dart';

class PaymentCubit extends Cubit<PaymentState> {
  PaymentCubit() : super(PaymentInitial());

  final formKey = GlobalKey<FormState>();
  var holderController = TextEditingController();
  var numberController = TextEditingController();
  var validThruController = TextEditingController();
  var cvvController = TextEditingController();

  //getter of payment bloc
  static PaymentCubit get(BuildContext context) {
    return BlocProvider.of(context);
  }

  //on change field to update controller
  void onChangeField(){
    emit(ChangeFieldState());
  }

  //pay button function
  void pay({required BuildContext context}) {
    if (formKey.currentState!.validate()) {
      // function here
      print("success");
      Navigator.pushReplacementNamed(context, AppRoutes.successPaymentRoute);
    }
  }

}
