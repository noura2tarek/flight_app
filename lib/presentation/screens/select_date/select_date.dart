import 'package:flight_app/presentation/core/managers/strings.dart';
import 'package:flight_app/presentation/res_widgets/custom_button.dart';
import 'package:flight_app/presentation/screens/verify_code/verify_code_screen.dart';
import 'package:flutter/material.dart';
import 'package:scroll_date_picker/scroll_date_picker.dart';
import '../../core/managers/values.dart';
import '../../core/resources/color_manager.dart';
import '../../core/resources/styles_manager.dart';

class SelectDateScreen extends StatefulWidget {
  const SelectDateScreen({Key? key}) : super(key: key);

  @override
  State<SelectDateScreen> createState() => _SelectDateScreenState();
}

class _SelectDateScreenState extends State<SelectDateScreen> {
  DateTime _selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
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
            /* ------------ Date Picker ------------- */
            Text(
              '$_selectedDate',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            // Padding(
            //   padding: const EdgeInsets.symmetric(vertical: 100.0),
            //   child: ScrollWheelDatePicker(
            //     onSelectedItemChanged: (value) {
            //       setState(() {
            //         _selectedDate = value;
            //       });
            //     },
            //     loopDays: true,
            //     loopMonths: true,
            //     loopYears: true,
            //     initialDate: _selectedDate,
            //     theme: FlatDatePickerTheme(
            //       wheelPickerHeight: 240.0,
            //       monthFormat: MonthFormat.full,
            //       overlay: ScrollWheelDatePickerOverlay.highlight,
            //       itemTextStyle: defaultItemTextStyle.copyWith(color: AppColors.primaryColor.withOpacity(0.6)),
            //       overlayColor: AppColors.overlayDateColor,
            //       overAndUnderCenterOpacity: 0.2,
            //       backgroundColor: Colors.white,
            //     ),
            //   ),
            // ),
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
