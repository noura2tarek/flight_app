import 'package:flight_app/controllers/payment_controller/payment_cubit.dart';
import 'package:flight_app/presentation/core/resources/styles_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterme_credit_card/flutterme_credit_card/utils/constants.dart';
import 'package:flutterme_credit_card/flutterme_credit_card/widgets/card/credit_card.dart';
import 'package:flutterme_credit_card/flutterme_credit_card/widgets/field/cvv_field.dart';
import 'package:flutterme_credit_card/flutterme_credit_card/widgets/field/hold_field.dart';
import 'package:flutterme_credit_card/flutterme_credit_card/widgets/field/number_field.dart';
import 'package:flutterme_credit_card/flutterme_credit_card/widgets/field/valid_thru_field.dart';
import '../../res_widgets/custom_button.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  // @override
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PaymentCubit(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text(
            'Payment',
            style: interSemiBold17(color: const Color(0xff1d2939)),
          ),
        ),
        body: SingleChildScrollView(
          child: BlocConsumer<PaymentCubit, PaymentState>(
            listener: (context, state) {},
            builder: (context, state) {
              var cubit = PaymentCubit.get(context);
              return Column(
                children: [
                  //the credit card shape field
                  FMCreditCard(
                    number: cubit.numberController.text,
                    numberMaskType: FMMaskType.first6last2,
                    cvv: cubit.cvvController.text,
                    cvvMaskType: FMMaskType.full,
                    validThru: cubit.validThruController.text,
                    validThruMaskType: FMMaskType.none,
                    holder: cubit.holderController.text,
                  ),
                  Container(
                    margin: const EdgeInsets.all(20.0),
                    child: Form(
                      key: cubit.formKey,
                      child: Column(
                        children: [
                          // person name
                          FMHolderField(
                            controller: cubit.holderController,
                            cursorColor: const Color(0xFF49B7AE),
                            onChanged: (value) {
                              cubit.onChangeField();
                            },
                            decoration: const InputDecoration(
                              labelText: "Card Holder",
                              hintText: "John Doe",
                            ),
                          ),
                          const SizedBox(height: 30),
                          //card number
                          FMNumberField(
                            controller: cubit.numberController,
                            onChanged: (value) {
                              cubit.onChangeField();
                            },
                            cursorColor: const Color(0xFF49B7AE),
                            decoration: const InputDecoration(
                              labelText: "Card Number",
                              hintText: "0000 0000 0000 0000",

                            ),
                          ),
                          const SizedBox(height: 30),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              //
                              Flexible(
                                child: FMValidThruField(
                                  controller: cubit.validThruController,
                                  cursorColor: const Color(0xFF49B7AE),
                                  onChanged: (value) => cubit.onChangeField(),
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0xFF49B7AE),
                                      ),
                                    ),
                                    labelStyle: TextStyle(
                                        color: Color(0xFF49B7AE)),
                                    labelText: "Valid Thru",
                                    hintText: "****",
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10),
                              //CVV
                              Flexible(
                                child: FMCvvField(
                                  controller: cubit.cvvController,
                                  cursorColor: const Color(0xFF49B7AE),
                                  onChanged: (value) {
                                    cubit.onChangeField();
                                  },
                                  decoration: const InputDecoration(
                                    labelText: "CVV",
                                    hintText: "***",
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: CustomButton(
                      text: 'Pay',
                      function: () {
                        //function
                        cubit.pay(context: context);
                      },
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
