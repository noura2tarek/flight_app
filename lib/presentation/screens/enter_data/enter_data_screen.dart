import 'package:flight_app/presentation/core/managers/app_strings.dart';
import 'package:flight_app/presentation/core/managers/values.dart';
import 'package:flight_app/presentation/core/resources/color_manager.dart';
import 'package:flight_app/presentation/res_widgets/custom_button.dart';
import 'package:flight_app/presentation/screens/enter_data/widgets/custom_text_form.dart';
import 'package:flight_app/presentation/screens/enter_data/widgets/phone_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:phone_form_field/phone_form_field.dart';
import '../../../data/data_source/local/cache_helper.dart';
import '../../core/resources/routes_manager.dart';
import '../../core/resources/styles_manager.dart';

//make it with cubit
class EnterData extends StatefulWidget {
  EnterData({Key? key}) : super(key: key);

  @override
  State<EnterData> createState() => _EnterDataState();
}

class _EnterDataState extends State<EnterData> {
  late TextEditingController firstNameController;
  late TextEditingController lastNameController;
  late PhoneController phoneNumberController;
  final FocusNode focusNode = FocusNode();
  bool outlineBorder = true;
  bool mobileOnly = true;
  bool isCountryButtonPersistent = true;
  bool withLabel = true;
  CountrySelectorNavigator selectorNavigator =
      const CountrySelectorNavigator.page();
  Locale locale = const Locale('en');
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    phoneNumberController = PhoneController();
    phoneNumberController.addListener(() {
      setState(() {});
    });
    firstNameController = TextEditingController();
    lastNameController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    phoneNumberController.dispose();
  }

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
          child: Form(
            key: formKey,
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
                  controller: phoneNumberController,
                  focusNode: focusNode,
                  selectorNavigator: selectorNavigator,
                  withLabel: withLabel,
                  outlineBorder: outlineBorder,
                  isCountryButtonPersistant: isCountryButtonPersistent,
                  mobileOnly: mobileOnly,
                  locale: locale,
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
      ),
    );
  }
}
