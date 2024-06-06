import 'package:flight_app/presentation/screens/main_page/screens/profile/widgets/notification_container.dart';
import 'package:flutter/material.dart';
import '../../../../core/managers/app_images.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/styles_manager.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Notifications',
          style: interSemiBold16(color: const Color(0xff1D2939)),
        ),
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 15.0, right: 20.0, left: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Today',
              style: interRegular14(color: const Color(0xff667085)),
            ),
            const SizedBox(
              height: 16.0,
            ),
            NotificationContainer(
              title: 'Air tour has been processed',
              subtitle: 'Airfield: Bychye Polye, July 30th',
              containerColor: AppColors.lightPurple,
              image: AppImages.planeIcon,
            ),
            const SizedBox(
              height: 40.0,
            ),
            Text(
              'November 16, 2021',
              style: interRegular14(color: Color(0xff667085)),
            ),
            const SizedBox(
              height: 16.0,
            ),
            NotificationContainer(
              title: 'Refund issued',
              subtitle: 'Airfield: Bychye Polye, November 16',
              containerColor: const Color(0xFF72EAC6),
              image: AppImages.refundIcon,
            ),
            const SizedBox(
              height: 16.0,
            ),
            NotificationContainer(
              title: 'Flight for November 16 canceled',
              subtitle: 'Inclement weather',
              containerColor: const Color(0xFF7CD4FD),
              image: AppImages.windIcon,
            ),
            const SizedBox(
              height: 40.0,
            ),
            Text(
              'November 14, 2021',
              style: interRegular14(color: const Color(0xff667085)),
            ),
            const SizedBox(
              height: 16.0,
            ),
            NotificationContainer(
              title: 'Air tour has been processed',
              subtitle: 'Airfield: Bychye Polye, November 16',
              containerColor: AppColors.lightPurple,
              image: AppImages.planeIcon,
            ),
            const SizedBox(
              height: 16.0,
            ),
            NotificationContainer(
              title: 'Welcome to Flights 🛩',
              subtitle: 'Enjoy your flights and have a great experience!',
              containerColor: const Color(0xFFFEA3D4),
              image: AppImages.clapping,
            ),
          ],
        ),
      ),
    );
  }
}
