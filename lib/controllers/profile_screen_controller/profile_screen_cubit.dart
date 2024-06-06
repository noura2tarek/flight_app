import 'dart:io';
import 'package:flight_app/presentation/core/resources/routes_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
part 'profile_screen_state.dart';

class ProfileScreenCubit extends Cubit<ProfileScreenState> {
  ProfileScreenCubit() : super(ProfileScreenInitial());

  static ProfileScreenCubit get (BuildContext context){
    return BlocProvider.of(context);
  }

  final ImagePicker picker = ImagePicker();
  File? myImage;

  Future pickImage() async {
    XFile? pickedImage = await picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      myImage = File(pickedImage.path);
      emit(ProfileGetImageSuccessState());
    } else {
      print('No Image Selected');
      emit(ProfileGetImageErrorState());
    }
  }

  navToNotifications(BuildContext context){
    Navigator.pushNamed(context, AppRoutes.notificationsRoute);
  }
}
