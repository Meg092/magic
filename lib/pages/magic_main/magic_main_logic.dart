import 'package:flutter/cupertino.dart';
import 'package:flutter_cupertino_datetime_picker/flutter_cupertino_datetime_picker.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MagicMainLogic extends GetxController {

  var birthday = ''.obs;

  var isLoading = false.obs;

  void selectBirthday (BuildContext context) async {
    DatePicker.showDatePicker(context,dateFormat: 'MMM d, yyyy',onConfirm: (date,list) async {
      birthday.value = DateFormat('MMM d, yyyy').format(date);
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('birthday', date.toIso8601String());
    });
  }

  @override
  void onInit() async {
    // TODO: implement onInit
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final birthdayStr = prefs.getString('birthday') ?? '';
    birthday.value = DateFormat('MMM d, yyyy').format(DateTime.parse(birthdayStr));
    super.onInit();
  }

}
