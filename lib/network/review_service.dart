// ignore_for_file: constant_identifier_names

import 'package:in_app_review/in_app_review.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:valo/network/shared_preferences_helper.dart';

const KEY = 'FIRST_TIME_OPEN';
const COUNTER = 'OPEN_COUNTER';

class ReviewService {
  late SharedPreferences _sharedPreferences;
  late int openCounter;

  final InAppReview _inAppReview = InAppReview.instance;
  Future<bool> isSecondTimeOpen() async {
    _sharedPreferences = SharedPreferencesHelper.instance;
    openCounter = _sharedPreferences.getInt(COUNTER) ?? 1;
    try {
      if (openCounter == 3) {
        _sharedPreferences.setBool(KEY, true);
        openCounter += 1;
        _sharedPreferences.setInt(COUNTER, openCounter);
        return true;
      } else if (openCounter == 15) {
        _sharedPreferences.setBool(KEY, true);
        openCounter += 1;
        _sharedPreferences.setInt(COUNTER, openCounter);
        return true;
      } else if (openCounter == 50) {
        _sharedPreferences.setBool(KEY, true);
        openCounter += 1;
        _sharedPreferences.setInt(COUNTER, openCounter);
        return true;
      } else if (openCounter == 100) {
        _sharedPreferences.setBool(KEY, true);
        openCounter += 1;
        _sharedPreferences.setInt(COUNTER, openCounter);
        return true;
      } else {
        _sharedPreferences.setBool(KEY, false);
        openCounter += 1;
        _sharedPreferences.setInt(COUNTER, openCounter);
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  Future<bool> showRating() async {
    try {
      final available = await _inAppReview.isAvailable();
      if (available) {
        _inAppReview.requestReview();
      } else {
        _inAppReview.openStoreListing(
          appStoreId: 'com.yagizdokumaci.valorantTips',
        );
      }
      return true;
    } catch (e) {
      return false;
    }
  }
}
