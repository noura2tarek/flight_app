import 'package:flight_app/controllers/enter_data_controller/enter_data_cubit.dart';
import 'package:flight_app/presentation/core/managers/app_strings.dart';
import 'package:flight_app/presentation/core/managers/values.dart';
import 'package:flight_app/presentation/core/resources/color_manager.dart';
import 'package:flight_app/presentation/res_widgets/custom_button.dart';
import 'package:flight_app/presentation/screens/enter_data/widgets/custom_text_form.dart';
import 'package:flight_app/presentation/screens/enter_data/widgets/phone_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/resources/styles_manager.dart';

class EnterData extends StatelessWidget {
  EnterData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EnterDataCubit(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarIconBrightness: Brightness.dark,
            statusBarColor: Colors.white,
            statusBarBrightness: Brightness.dark,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(padding),
          child: SingleChildScrollView(
            child: BlocConsumer<EnterDataCubit, EnterDataState>(
              listener: (context, state) {},
              builder: (context, state) {
                var cubit = EnterDataCubit.get(context);
                return Form(
                  key: cubit.formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /* --------- Rich Text(enter phone) --------- */
                      RichText(
                        text: TextSpan(
                          style: myTextStyle(
                            color: Colors.black,
                          ),
                          children: [
                            TextSpan(
                              text: AppStringsEn.enter,
                              style: myTextStyle(
                                color: AppColors.textColor,
                              ),
                            ),
                            TextSpan(
                              text: AppStringsEn.phoneNumber,
                              style: myTextStyle(
                                color: AppColors.primaryColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 25.0,
                      ),
                      //phone form field of phone form package
                      PhoneFieldView(
                        controller: cubit.phoneNumberController,
                        focusNode: cubit.focusNode,
                        selectorNavigator: cubit.selectorNavigator,
                        withLabel: cubit.withLabel,
                        outlineBorder: cubit.outlineBorder,
                        isCountryButtonPersistant:
                            cubit.isCountryButtonPersistent,
                        mobileOnly: cubit.mobileOnly,
                        locale: cubit.locale,
                        onChange: cubit.onChangeField(cubit.phoneNumberController.value),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      /* ---------- Rich Text(enter name) ---------- */
                      RichText(
                        text: TextSpan(
                          style: myTextStyle(
                            color: Colors.black,
                          ),
                          children: [
                            TextSpan(
                              text: AppStringsEn.enter,
                              style: myTextStyle(
                                color: AppColors.textColor,
                              ),
                            ),
                            TextSpan(
                              text: AppStringsEn.first,
                              style: myTextStyle(
                                color: AppColors.primaryColor,
                              ),
                            ),
                            TextSpan(
                              text: '&',
                              style: myTextStyle(
                                color: AppColors.textColor,
                              ),
                            ),
                            TextSpan(
                              text: AppStringsEn.lastName,
                              style: myTextStyle(
                                color: AppColors.primaryColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 25.0,
                      ),
                      //first name text form
                      CustomTextForm(
                        controller: cubit.firstNameController,
                        hintText: AppStringsEn.enterFirstName,
                        type: TextInputType.name,
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      //last name text form
                      CustomTextForm(
                        controller: cubit.lastNameController,
                        hintText: AppStringsEn.enterLastName,
                        type: TextInputType.name,
                      ),
                      const SizedBox(
                        height: 50.0,
                      ),
                      //next button
                      CustomButton(
                        text: AppStringsEn.next,
                        function: () {
                          cubit.next(context);
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
