import 'dart:async';

import 'package:layerbit_oraculum_flutter/src/features/common/shared_pref/shared_pref.dart';
import 'package:layerbit_oraculum_flutter/src/presentation/common/responsive/device_sizes.dart';
import 'package:layerbit_oraculum_flutter/src/presentation/common/theme/theme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AppViewModel extends ChangeNotifier {
  final MainTheme _mainTheme;
  final SharedPref _sharedPref;

  AppViewModel(
    this._mainTheme,
    this._sharedPref,
  );

  Future<void> init() async {
    await _sharedPref.init();
  }

  ThemeData? setTheme(BuildContext context) {
    final mobileThemeData = _mainTheme.mobileThemeData();
    final tabletThemeData = _mainTheme.tabletThemeData();

    if (kIsWeb) {
      return DeviceSizes.isMobileSize(context) ? mobileThemeData : tabletThemeData;
    } else {
      return mobileThemeData;
    }
  }
}
