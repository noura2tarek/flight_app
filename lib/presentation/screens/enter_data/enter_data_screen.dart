import 'package:flight_app/presentation/core/managers/app_strings.dart';
import 'package:flight_app/presentation/core/managers/values.dart';
import 'package:flight_app/presentation/core/resources/color_manager.dart';
import 'package:flight_app/presentation/res_widgets/custom_button.dart';
import 'package:flight_app/presentation/screens/enter_data/widgets/custom_text_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
//import 'package:phone_form_field/phone_form_field.dart';
import '../../../data/data_source/local/cache_helper.dart';
import '../../core/resources/routes_manager.dart';
import '../../core/resources/styles_manager.dart';

//make it with cubit
class EnterData extends StatelessWidget {
  EnterData({Key? key}) : super(key: key);
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              //phone text form
              SizedBox(
                height: 50.0,
                width: 350.0,
                child: TextFormField(
                  controller: phoneNumberController,
                  keyboardType: TextInputType.phone,
                  style: TextStyle(
                    color: AppColors.formFillColor,
                  ),
                  decoration: InputDecoration(
                    hintText: '+7 999 895 85 85',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide(color: AppColors.primaryColor),
                    ),
                  ),
                ),
              ),
              //phone form field of phone form package
              // params
              // PhoneFormField(
              //   initialValue: PhoneNumber.parse('+02155558754'),
              //   // or use the controller
              //   validator: PhoneValidator.compose([
              //     PhoneValidator.required(context,
              //         errorText: 'phone not correct'),
              //     PhoneValidator.validMobile(context,
              //         errorText: 'phone not correct')
              //   ]),
              //   countrySelectorNavigator: const CountrySelectorNavigator.page(),
              //   onChanged: (phoneNumber) => print('changed into $phoneNumber'),
              //   enabled: true,
              //   isCountrySelectionEnabled: true,
              //   isCountryButtonPersistent: true,
              //   countryButtonStyle: const CountryButtonStyle(
              //       showDialCode: true,
              //       showIsoCode: true,
              //       showFlag: true,
              //       flagSize: 16),
              // ),

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
                controller: firstNameController,
                hintText: AppStringsEn.enterFirstName,
                type: TextInputType.name,
              ),
              const SizedBox(
                height: 20.0,
              ),
              //last name text form
              CustomTextForm(
                controller: lastNameController,
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
                  CacheHelper.savaData(key: 'passEnterDate', value: true);
                  Navigator.pushNamed(context, AppRoutes.enterBirthDateRoute);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
