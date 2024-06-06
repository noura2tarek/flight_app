import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../../../../core/resources/color_manager.dart';
import '../../../../../core/resources/styles_manager.dart';

class NotificationContainer extends StatelessWidget {
  const NotificationContainer(
      {Key? key,
      required this.containerColor,
      required this.image,
      required this.title,
      required this.subtitle})
      : super(key: key);
  final Color containerColor;
  final String image;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70.0,
      width: 350.0,
      decoration: const BoxDecoration(
        color: Color(0xffF2F2F7),
      ),
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.only(left: 12.0),
            decoration: BoxDecoration(
              color: containerColor,
              borderRadius: const BorderRadius.all(Radius.circular(4.0)),
            ),
            width: 46.0,
            height: 46.0,
            child: Image.asset(
              image,
              color: AppColors.white,
            ),
          ),
          const SizedBox(
            width: 10.0,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: interSemiBold16(color: Color(0xff1D2939)),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                const SizedBox(
                  height: 8.0,
                ),
                Text(
                  subtitle,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: interRegular12(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
