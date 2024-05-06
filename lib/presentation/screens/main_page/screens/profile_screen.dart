import 'package:flight_app/presentation/core/managers/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../controllers/profile_screen_controller/profile_screen_cubit.dart';
import '../../../core/resources/color_manager.dart';
import '../../../core/resources/routes_manager.dart';
import '../../../core/resources/styles_manager.dart';

//make it with cubit
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileScreenCubit(),
      child: BlocConsumer<ProfileScreenCubit, ProfileScreenState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = ProfileScreenCubit.get(context);
          return SingleChildScrollView(
            child: Column(
              children: [
                /* ---------- photo & name Card ---------- */
                SizedBox(
                  height: 285.0,
                  width: double.infinity,
                  child: Card(
                    color: Colors.white,
                    surfaceTintColor: Colors.white,
                    shape: const OutlineInputBorder(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(12.0),
                          bottomRight: Radius.circular(12.0)),
                      borderSide: BorderSide(
                        color: Colors.white,
                        style: BorderStyle.none,
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Stack(
                          alignment: Alignment.bottomRight,
                          children: [
                            if (cubit.myImage != null)
                              Container(
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                height: 100.0,
                                width: 100.0,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                ),
                                child: Image.file(cubit.myImage!),
                              ),
                            if (cubit.myImage == null)
                              Container(
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                height: 100.0,
                                width: 100.0,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                ),
                                child: Image.asset(
                                  AppImages.defaultPhoto,
                                  filterQuality: FilterQuality.high,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 0.0),
                              child: InkWell(
                                onTap: () => cubit.pickImage(),
                                child: Container(
                                  width: 32.0,
                                  height: 32.0,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[200],
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(5.0)),
                                  ),
                                  child: const Icon(Icons.edit),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 16.0,
                        ),
                        Text(
                          'Noura Tarek',
                          style: interSemiBold24,
                        ),
                        const SizedBox(
                          height: 6.0,
                        ),
                        Text(
                          '+1 555 555 55 55',
                          style: interMedium14,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 19.0,
                ),
                /* ---------- big Second card  ---------- */
                SizedBox(
                  height: 455.0,
                  width: double.infinity,
                  child: Card(
                    color: Colors.white.withOpacity(0.9),
                    surfaceTintColor: Colors.white,
                    shape: const OutlineInputBorder(
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(12.0), topRight: Radius.circular(12.0)),
                      borderSide: BorderSide(color: Colors.white, style: BorderStyle.none,),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        children: [
                          /* ---------- Notifications  ---------- */
                          ListTile(
                            splashColor: Colors.white70,
                            onTap: () {},
                            tileColor: const Color(0xfff2f2f7).withOpacity(0.5),
                            shape: const OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(8.0)),
                              borderSide: BorderSide(color: Colors.white, style: BorderStyle.none,),
                            ),
                            leading: Icon(
                              Icons.notifications_none_outlined,
                              color: AppColors.primaryColor,
                            ),
                            title: Text('Notifications', style: interRegular14,),
                          ),
                          const SizedBox(height: 16.0,),
                          /* ---------- tickets & cards  ---------- */
                          SizedBox(
                            height: 124.0,
                            width: 350.0,
                            child: Card(
                              surfaceTintColor: const Color(0xfff2f2f7).withOpacity(0.5),
                               shape: const OutlineInputBorder(
                                 borderRadius: BorderRadius.all(Radius.circular(8.0)),
                                 borderSide: BorderSide(color: Colors.white, style: BorderStyle.none,),
                               ),
                               child: Column(
                                 children: [
                                   /* ---------- tickets list tile  ---------- */
                                   ListTile(
                                     splashColor: Colors.white70,
                                     onTap: () {},
                                     tileColor: const Color(0xfff2f2f7).withOpacity(0.5),
                                     shape: const OutlineInputBorder(
                                       borderSide: BorderSide(color: Colors.white, style: BorderStyle.none,),
                                     ),
                                     leading: Icon(
                                       Icons.airplane_ticket_outlined,
                                       color: AppColors.primaryColor,
                                     ),
                                     title: Text('My tickets', style: interRegular14,),
                                   ),
                                   /* ---------- cards list tile  ---------- */
                                   ListTile(
                                     splashColor: Colors.white70,
                                     onTap: () {
                                       //payment
                                       Navigator.pushNamed(context, AppRoutes.checkOutRoute);
                                     },
                                     tileColor: const Color(0xfff2f2f7).withOpacity(0.5),
                                     shape: const OutlineInputBorder(
                                       borderSide: BorderSide(color: Colors.white, style: BorderStyle.none,),
                                     ),
                                     leading: Icon(
                                       Icons.credit_card,
                                       color: AppColors.primaryColor,
                                     ),
                                     title: Text('My Cards', style: interRegular14,),
                                   ),

                                 ],
                               ),
                            ),
                          ),
                          const SizedBox(height: 16.0,),
                          /* ---------- customer service & settings  ---------- */
                          SizedBox(
                            height: 124.0,
                            width: 350.0,
                            child: Card(
                              surfaceTintColor: const Color(0xfff2f2f7).withOpacity(0.5),
                              shape: const OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(8.0)),
                                borderSide: BorderSide(color: Colors.white, style: BorderStyle.none,),
                              ),
                              child: Column(
                                children: [
                                  /* ---------- customer service tile  ---------- */
                                  ListTile(
                                    splashColor: Colors.white70,
                                    onTap: () {},
                                    tileColor: const Color(0xfff2f2f7).withOpacity(0.5),
                                    shape: const OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.white, style: BorderStyle.none,),
                                    ),
                                    leading: Icon(
                                      Icons.comment_bank_outlined,
                                      color: AppColors.primaryColor,
                                    ),
                                    title: Text('Customer Service', style: interRegular14,),
                                  ),
                                  /* ---------- settings tile  ---------- */
                                  ListTile(
                                    splashColor: Colors.white70,
                                    onTap: () {},
                                    tileColor: const Color(0xfff2f2f7).withOpacity(0.5),
                                    shape: const OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.white, style: BorderStyle.none,),
                                    ),
                                    leading: Icon(
                                      Icons.settings_outlined,
                                      color: AppColors.primaryColor,
                                    ),
                                    title: Text('Settings', style: interRegular14,),
                                  ),

                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 16.0,),
                          /* ---------- log out Card ---------- */
                          ListTile(
                            splashColor: Colors.white70,
                            onTap: () {},
                            tileColor: const Color(0xfff2f2f7).withOpacity(0.5),
                            shape: const OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(8.0)),
                              borderSide: BorderSide(color: Colors.white, style: BorderStyle.none,),
                            ),
                            leading: Icon(
                              Icons.cancel_outlined,
                              color: AppColors.primaryColor,
                            ),
                            title: Text('Log out', style: interRegular14,),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
