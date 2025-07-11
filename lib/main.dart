import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:lucky_magic/pages/magic_computed/magic_computed_binding.dart';
import 'package:lucky_magic/pages/magic_computed/magic_computed_view.dart';
import 'package:lucky_magic/pages/magic_disconnect/magic_disconnect_binding.dart';
import 'package:lucky_magic/pages/magic_disconnect/magic_disconnect_view.dart';
import 'package:lucky_magic/pages/magic_main/magic_main_binding.dart';
import 'package:lucky_magic/pages/magic_main/magic_main_output.dart';
import 'package:lucky_magic/pages/magic_main/magic_main_view.dart';
import 'package:lucky_magic/pages/magic_result/magic_result_binding.dart';
import 'package:lucky_magic/pages/magic_result/magic_result_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

Color primaryColor = Colors.black;
Color bgColor = Colors.black;

List<String> magicTitles = [
  'Lucky numbers',
  'Lucky lottery',
  'Lucky date',
  'Lucky color'
];

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final birthday = prefs.getString('birthday');
  if (birthday == null) {
    await prefs.setString('birthday', DateTime.now().toIso8601String());
  }
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: PPRO,
      initialRoute: '/magic',
      theme: ThemeData(
        useMaterial3: true,
        primaryColor: primaryColor,
        scaffoldBackgroundColor: bgColor,
        colorScheme: ColorScheme.light(
          primary: primaryColor,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          scrolledUnderElevation: 0,
          centerTitle: true,
          titleTextStyle: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize: 20,
          ),
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: primaryColor,
          selectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
          elevation: 0,
          backgroundColor: Colors.white,
        ),
        inputDecorationTheme: const InputDecorationTheme(
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
        cardTheme: const CardTheme(
          color: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
        dialogTheme: const DialogTheme(
          actionsPadding: EdgeInsets.only(right: 10, bottom: 5),
        ),
        dividerTheme: DividerThemeData(
          thickness: 1,
          color: Colors.grey[200],
        ),
      ),
    );
  }
}
List<GetPage<dynamic>> PPRO = [
  GetPage(name:'/magic', page: () => const MagicComputedView(), binding: MagicComputedBinding()),
  GetPage(name:'/magic_main', page: () => const MagicMainPage(), binding: MagicMainBinding()),
  GetPage(name: '/magic_result', page: () => MagicResultPage(), binding: MagicResultBinding()),
  GetPage(name: '/magic_output', page: () => MagicMainOutput()),
  GetPage(name: '/magic_disconnect', page: () => MagicDisconnectView(), binding: MagicDisconnectBinding()),
];