import 'package:flight_app/presentation/core/managers/strings.dart';
import 'package:flight_app/presentation/core/managers/values.dart';
import 'package:flight_app/presentation/res_widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import '../../core/resources/color_manager.dart';
import '../../core/resources/styles_manager.dart';

class VerifyCode extends StatelessWidget {
  const VerifyCode({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(padding),
        child: ListView(
          children: [
            /* ---------- Rich Text(enter data) ---------- */
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Enter the',
                    style: myTextStyle(
                      color: AppColors.textColor,
                      size: 30.0,
                    ),
                  ),
                  TextSpan(
                    text: '\nconfirmation code',
                    style: myTextStyle(
                      color: AppColors.primaryColor,
                      size: 30.0,
                    ),
                  ),
                ],
              ),
            ),

            /* -------------- Otp Field --------------- */
            Container(
              margin: const EdgeInsets.symmetric(vertical: 50.0),
              child: OtpTextField(
                numberOfFields: 5,
                borderColor: AppColors.greyColor!,
                enabledBorderColor: AppColors.greyColor!,
                focusedBorderColor: AppColors.primaryColor.withOpacity(0.7),
                cursorColor: Colors.black,
                textStyle: TextStyle(color: AppColors.textColor),
                fieldWidth: 50.0,
                fieldHeight: 50.0,
                margin: const EdgeInsets.only(right: 12.0),
                borderRadius: BorderRadius.circular(8.0),
                //set to true to show as box or false to show as dash
                showFieldAsBox: true,
                //runs when a code is typed in
                onCodeChanged: (String code) {
                  //handle validation or checks here
                },
                //runs when every text field is filled
                onSubmit: (String verificationCode) {
                  //controller.goToResetPassword();
                }, // end onSubmit
              ),
            ),
            const SizedBox(
              height: 100.0,
            ),
            /* ----------- Next Button ------------ */
            CustomButton(
              text: AppStrings.next,
              function: () {},
            ),
          ],
        ),
      ),
    );
  }
}
