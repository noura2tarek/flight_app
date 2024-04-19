import 'package:flight_app/presentation/core/managers/app_images.dart';
import 'package:flight_app/presentation/core/resources/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SuccessPaymentScreen extends StatelessWidget {
  const SuccessPaymentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        elevation: 0.0,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: AppColors.primaryColor,
          statusBarBrightness: Brightness.light,
          statusBarIconBrightness: Brightness.light,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 170.0, bottom: 25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(AppImages.successPayment),
            const SizedBox(
              height: 24.0,
            ),
            const Text(
              textAlign: TextAlign.center,
              'Paid',
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w600,
                fontSize: 24.0,
              ),
            ),
            const SizedBox(
              height: 12.0,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.0),
              child: Text(
                'In case of flight cancellation the money will be refunded',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xffF2F2F7),
                  fontFamily: 'Inter',
                  fontSize: 16.0,
                ),
              ),
            ),
            Spacer(),
            /* --------- perfect button --------- */
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Container(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                width: double.infinity,
                height: 50.0,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                ),
                child: MaterialButton(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  onPressed: () {},
                  color: Colors.white,
                  child: Text(
                    'Perfect',
                    style: TextStyle(
                      color: AppColors.primaryColor,
                      shadows: [
                        Shadow(color: Colors.grey),
                        Shadow(color: Colors.grey),
                        Shadow(color: Colors.grey),
                      ],
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w500,
                      fontSize: 16.0,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
