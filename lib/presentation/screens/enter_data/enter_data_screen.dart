import 'package:flight_app/presentation/core/managers/strings.dart';
import 'package:flight_app/presentation/core/managers/values.dart';
import 'package:flight_app/presentation/core/resources/color_manager.dart';
import 'package:flight_app/presentation/res_widgets/custom_button.dart';
import 'package:flight_app/presentation/screens/enter_data/widgets/custom_text_form.dart';
import 'package:flight_app/presentation/screens/select_date/select_date.dart';
import 'package:flutter/material.dart';
import '../../core/resources/styles_manager.dart';

class EnterData extends StatelessWidget {
  const EnterData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(padding),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //enter phone text
              RichText(
                text: TextSpan(
                  style: myTextStyle(
                    color: Colors.black,
                  ),
                  children: [
                    TextSpan(
                      text: 'Enter',
                      style: myTextStyle(
                        color: AppColors.textColor,
                      ),
                    ),
                    TextSpan(
                      text: ' phone \nnumber',
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
             const CustomTextForm(hintText: '+25555066654', type: TextInputType.phone),
              const SizedBox(
                height: 25,
              ),
              //enter name text
              RichText(
                text: TextSpan(
                  style: myTextStyle(
                    color: Colors.black,
                  ),
                  children: [
                    TextSpan(
                      text: 'Enter',
                      style: myTextStyle(
                        color: AppColors.textColor,
                      ),
                    ),
                    TextSpan(
                      text: ' first ',
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
                      text: '\nlast name ',
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
              CustomTextForm(hintText: AppStrings.enterFirstName, type: TextInputType.name,),
              const SizedBox(
                height: 20.0,
              ),
              //last name text form
              CustomTextForm(hintText: AppStrings.enterLastName, type: TextInputType.name,),
              const SizedBox(
                height: 50.0,
              ),
              //next button
              CustomButton(
                text: AppStrings.next,
                function: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return SelectDateScreen();
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
