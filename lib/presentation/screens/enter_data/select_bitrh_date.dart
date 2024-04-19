import 'package:flight_app/presentation/core/managers/app_strings.dart';
import 'package:flight_app/presentation/res_widgets/custom_button.dart';
import 'package:flight_app/presentation/screens/verify_code/verify_code_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:scroll_date_picker/scroll_date_picker.dart';
import '../../../data/local/cache_helper.dart';
import '../../core/managers/values.dart';
import '../../core/resources/color_manager.dart';
import '../../core/resources/styles_manager.dart';

//make it with cubit
class SelectBirthDateScreen extends StatefulWidget {
  const SelectBirthDateScreen({Key? key}) : super(key: key);

  @override
  State<SelectBirthDateScreen> createState() => _SelectBirthDateScreenState();
}

class _SelectBirthDateScreenState extends State<SelectBirthDateScreen> {
  DateTime _selectedDate = DateTime.now();

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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /* --------- Rich Text( select date) ---------- */
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Select your',
                    style: myTextStyle(
                      color: AppColors.textColor,
                      size: 30.0,
                    ),
                  ),
                  TextSpan(
                    text: '\ndate of birth',
                    style: myTextStyle(
                      color: AppColors.primaryColor,
                      size: 30.0,
                    ),
                  ),
                ],
              ),
            ),

            Text(
              '$_selectedDate',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            /* ------------Scroll Date Picker ------------- */
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 100.0),
              child: SizedBox(
                height: 240.0,
                child: ScrollDatePicker(
                  viewType: const [
                    DatePickerViewType.month,
                    DatePickerViewType.day,
                    DatePickerViewType.year,
                  ],
                  options: const DatePickerOptions(
                    backgroundColor: Colors.white,
                  ),
                  selectedDate: _selectedDate,
                  locale: Locale('en'),
                  onDateTimeChanged: (DateTime value) {
                    setState(() {
                      _selectedDate = value;
                    });
                  },
                ),
              ),
            ),

            /* ------------ Next Button ------------- */
            CustomButton(
              text: AppStrings.next,
              function: () {
                CacheHelper.savaData(key: 'passBirthDate', value: true);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const VerifyCode();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
