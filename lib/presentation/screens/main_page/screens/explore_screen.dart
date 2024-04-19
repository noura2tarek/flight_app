import 'package:flight_app/presentation/core/managers/app_images.dart';
import 'package:flight_app/presentation/res_widgets/custom_button.dart';
import 'package:flutter/material.dart';
import '../../../core/managers/app_strings.dart';
import '../../../core/managers/values.dart';
import '../../../core/resources/color_manager.dart';
import '../../../core/resources/styles_manager.dart';

//do: make it with cubit
class ExploreScreen extends StatefulWidget {
  const ExploreScreen({Key? key}) : super(key: key);

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  int passengersCount = 1;
  List<String> images = [
    AppImages.whitePlane,
    AppImages.facts,
    AppImages.water,
    AppImages.food,
  ];
  List<String> stringsOfList = [
    'Why are the airplanes white?',
    '5 interesting facts about flying',
    'We lose a lot of water during a flight',
    'Why do pilots on the same flight eat different food?',
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(padding2),
      child: ListView(
        children: [
          /* --------- Rich Text --------- */
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'Extreme',
                  style: myTextStyle(
                    color: AppColors.primaryColor,
                    size: 30.0,
                  ),
                ),
                TextSpan(
                  text: '\nairplane flight',
                  style: myTextStyle(
                    color: AppColors.textColor,
                    size: 30.0,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 40.0,
          ),
          /* --------- First Card --------- */
          SizedBox(
            height: 56.0,
            child: InkWell(
              onTap: () {
                //show bottom sheet of search
              },
              child: const Card(
                margin: EdgeInsets.zero,
                surfaceTintColor: Colors.white,
                color: Colors.white,
                elevation: 6.0,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
                child: Padding(
                  padding: EdgeInsets.only(left: 16.0),
                  child: Row(
                    children: [
                      Icon(
                        Icons.location_on_outlined,
                        color: Color(0xff1D2939),
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Text(
                        'Where to find an airplane tour?',
                        style: TextStyle(
                          color: Color(0xff98A2B3),
                          fontFamily: 'Inter',
                          fontSize: 16.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          /* --------- Second Card --------- */
          SizedBox(
            height: 56.0,
            child: InkWell(
              onTap: () {
                //show date picker
              },
              child: const Card(
                surfaceTintColor: Colors.white,
                color: Colors.white,
                margin: EdgeInsets.zero,
                elevation: 6.0,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
                child: Padding(
                  padding: EdgeInsets.only(left: 16.0),
                  child: Row(
                    children: [
                      Icon(
                        Icons.calendar_today_outlined,
                        color: Color(0xff1D2939),
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Text(
                        'Sunday, July 30',
                        style: TextStyle(
                          color: Color(0xff98A2B3),
                          fontFamily: 'Inter',
                          fontSize: 16.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 16.0,
          ),
          /* --------- Third Card --------- */
          SizedBox(
            height: 56.0,
            child: Card(
              margin: EdgeInsets.zero,
              surfaceTintColor: Colors.white,
              color: Colors.white,
              elevation: 6.0,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.zero,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  children: [
                    Image.asset(AppImages.smileIcon),
                    const SizedBox(
                      width: 10.0,
                    ),
                    const Text(
                      'Passengers',
                      style: TextStyle(
                        color: Color(0xff1D2939),
                        fontFamily: 'Inter',
                        fontSize: 16.0,
                      ),
                    ),
                    const Spacer(),
                    // plus and minns button
                    Row(
                      children: [
                        Container(
                          color: Color(0xffF2F4F7),
                          height: 28.0,
                          width: 28.0,
                          child: InkWell(
                            splashColor: Colors.grey,
                            onTap: () {
                              setState(() {
                                passengersCount--;
                              });
                            },
                            child: Icon(Icons.minimize_outlined),
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            '$passengersCount',
                            style: const TextStyle(
                              color: Color(0xff1D2939),
                              fontFamily: 'Inter',
                              fontSize: 24.0,
                            ),
                          ),
                        ),
                        Container(
                          color: Color(0xffF2F4F7),
                          height: 28.0,
                          width: 28.0,
                          child: InkWell(
                            splashColor: Colors.grey,
                            onTap: () {
                              setState(() {
                                passengersCount++;
                              });
                            },
                            child: Icon(Icons.add),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 16.0,
          ),
          /* --------- Find tour button --------- */
          CustomButton(
            text: AppStrings.findTour,
            function: () {},
          ),
          const SizedBox(
            height: 16.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 24.0),
            child: Text(
              AppStrings.helpfulInformation,
              style: const TextStyle(
                color: Color(0xff1D2939),
                fontFamily: 'Inter',
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),
            ),
          ),
          /* --------- List View (horizontal) --------- */
          SizedBox(
            height: 135.0,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Container(
                  height: 136.0,
                  width: 114.0,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                    border: Border.all(color: AppColors.primaryColor2),
                  ),
                  child: Container(
                    height: 135.0,
                    width: 124.0,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                    child: Stack(
                      alignment: Alignment.topCenter,
                      children: [
                        Image.asset(images[index]),
                        Text(
                          stringsOfList[index],
                          style: const TextStyle(
                            color: Colors.white,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w600,
                            fontSize: 10.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return const SizedBox(
                  width: 8.0,
                );
              },
              itemCount: 4,
            ),
          ),
          const SizedBox(
            height: 25.0,
          ),
        ],
      ),
    );
  }
}
