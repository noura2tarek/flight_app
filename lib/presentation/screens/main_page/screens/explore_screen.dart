import 'package:flight_app/presentation/core/managers/app_images.dart';
import 'package:flight_app/presentation/res_widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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
  String? date = DateFormat.yMMMd().format(DateTime.now());

  TextEditingController searchController = TextEditingController();
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
                //show bottom sheet
                showBottomSheet(
                  backgroundColor: Colors.white,
                  elevation: 0.0,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  shape: const OutlineInputBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(13.0),
                      topRight: Radius.circular(13.0),
                    ),
                    borderSide: BorderSide(
                      color: Colors.white,
                      width: 2,
                    ),
                  ),
                  context: context,
                  builder: (context) {
                    return Padding(
                      padding: const EdgeInsets.only(
                        top: 24.0,
                        right: 20.0,
                        left: 20.0,
                      ),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 52.0,
                            child: TextFormField(
                              keyboardType: TextInputType.name,
                              controller: searchController,
                              decoration: InputDecoration(
                                hintText: AppStringsEn.whereFindAirplaneTour,
                                hintStyle: const TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 17.0,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(8.0)),
                                  borderSide: BorderSide(
                                      color: AppColors.primaryColor, width: 1),
                                ),
                                enabledBorder: const OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8.0)),
                                  borderSide:
                                      BorderSide(color: Colors.grey, width: 1),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(8.0)),
                                  borderSide: BorderSide(
                                      color: AppColors.primaryColor, width: 1),
                                ),
                                prefixIcon: Icon(
                                  Icons.search_sharp,
                                  size: 26.0,
                                  color: AppColors.primaryColor,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 40.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.my_location_rounded,
                                color: AppColors.primaryColor,
                              ),
                              const SizedBox(
                                width: 10.0,
                              ),
                              Text(
                                'My location',
                                style: interSemiBold14,
                              )
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
              child: Card(
                margin: EdgeInsets.zero,
                surfaceTintColor: Colors.white,
                color: Colors.white,
                elevation: 6.0,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero),
                child: Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.location_on_outlined,
                        color: Color(0xff1D2939),
                      ),
                      const SizedBox(
                        width: 10.0,
                      ),
                      Text(
                        AppStringsEn.whereFindAirplaneTour,
                        style: const TextStyle(
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
                showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime.now(),
                  lastDate: DateTime(2025, 6, 30),
                ).then((DateTime? value) {
                  setState(() {
                    //logic
                    date = DateFormat.yMMMd().format(value!);
                  });
                }).catchError((error) {
                  print(error.toString());
                });
              },
              child: Card(
                surfaceTintColor: Colors.white,
                color: Colors.white,
                margin: EdgeInsets.zero,
                elevation: 6.0,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero),
                child: Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.calendar_today_outlined,
                        color: Color(0xff1D2939),
                      ),
                      const SizedBox(
                        width: 10.0,
                      ),
                      Text(
                        date ?? 'date',
                        style: interSemiBold16(color: const Color(0xff98A2B3)),
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
                            child: const Icon(Icons.minimize_outlined),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
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
                            child: const Icon(Icons.add),
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
            text: AppStringsEn.findTour,
            function: () {},
          ),
          const SizedBox(
            height: 16.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 24.0),
            child: Text(
              AppStringsEn.helpfulInformation,
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
                  height: 137.0,
                  width: 114.0,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                    border: Border.all(color: AppColors.primaryColor),
                  ),
                  child: Container(
                    height: 138.0,
                    width: 148.0,
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
                          textAlign: TextAlign.left,
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
