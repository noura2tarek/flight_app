import 'package:flutter/material.dart';

import 'color_manager.dart';

ThemeData theme = ThemeData(
  primaryColor: AppColors.primaryColor,
  colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
  useMaterial3: true,
);