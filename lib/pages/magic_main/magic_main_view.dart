import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:lucky_magic/main.dart';
import 'package:lucky_magic/pages/magic_main/shake_widget.dart';
import 'package:styled_widget/styled_widget.dart';

import 'magic_main_logic.dart';

class MagicMainPage extends StatefulWidget {
  const MagicMainPage({Key? key}) : super(key: key);

  @override
  State<MagicMainPage> createState() => _MagicMainPageState();
}

class _MagicMainPageState extends State<MagicMainPage> {
  MagicMainLogic controller = Get.find();

  void ghjgfahksxcca() async {
    final hadNetwork = await InternetConnectionChecker.instance.hasConnection;
    if (!hadNetwork) {
      Get.toNamed('/magic_disconnect');
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    ghjgfahksxcca();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: <Widget>[
        Image.asset(
          'assets/bg.webp',
          fit: BoxFit.fill,
          width: double.infinity,
          height: double.infinity,
        ),
        SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: SafeArea(
              child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: <Widget>[
              Image.asset('assets/img0.webp', fit: BoxFit.cover),
              const Text(
                'Lucky Magic Hat',
                style: TextStyle(
                    fontSize: 41,
                    fontStyle: FontStyle.italic,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                width: double.infinity,
                height: 56,
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: <Widget>[
                  const Text(
                    'Birthday',
                    style: TextStyle(color: Colors.white),
                  ),
                  <Widget>[
                    Obx(() {
                      return Text(
                        controller.birthday.value,
                        style: const TextStyle(
                            color: Color(0xfff0bf37), fontSize: 18),
                      );
                    }),
                    const Icon(
                      Icons.keyboard_arrow_right,
                      size: 25,
                      color: Colors.grey,
                    )
                  ].toRow(mainAxisAlignment: MainAxisAlignment.end)
                ].toRow(mainAxisAlignment: MainAxisAlignment.spaceBetween),
              )
                  .decorated(
                      color: const Color(0xff180b48),
                      borderRadius: BorderRadius.circular(28),
                      border: Border.all(color: const Color(0xff7d7b1d)))
                  .gestures(onTap: () {
                controller.selectBirthday(context);
              }),
              const SizedBox(
                height: 15,
              ),
              <Widget>[
                Image.asset(
                  'assets/img3.webp',
                  width: double.infinity,
                  height: 302,
                  fit: BoxFit.fill,
                ),
                SizedBox(
                  height: 302,
                  child: Padding(
                    padding: const EdgeInsets.all(25),
                    child: GridView.builder(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 20,
                                crossAxisSpacing: 20,
                                childAspectRatio: 100 / 83),
                        itemCount: magicTitles.length,
                        itemBuilder: (_, index) {
                          return <Widget>[
                            Image.asset(
                              'assets/icon$index.webp',
                              fit: BoxFit.cover,
                            ),
                            Text(
                              magicTitles[index],
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            )
                          ].toColumn().gestures(onTap: () {
                            controller.isLoading.value = true;
                            Future.delayed(const Duration(seconds: 2), () {
                              Get.toNamed('/magic_result',
                                  arguments: index);
                            }).then((_) {
                              Future.delayed(const Duration(milliseconds: 300),(){
                                controller.isLoading.value = false;
                              });
                            });
                          });
                        }),
                  ),
                )
              ].toStack(alignment: Alignment.center)
            ].toColumn(),
          ).marginAll(15)),
        ),
        Obx(() {
          return Visibility(
              visible: controller.isLoading.value,
              child: <Widget>[
                Image.asset(
                  'assets/bg.webp',
                  fit: BoxFit.fill,
                  width: double.infinity,
                  height: double.infinity,
                ),
                <Widget>[
                  ShakeWidget(
                      child: Image.asset(
                    'assets/img2.webp',
                    fit: BoxFit.cover,
                  )),
                  const Text(
                    'In magic...',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontStyle: FontStyle.italic),
                  )
                ].toStack(alignment: Alignment.bottomCenter)
              ].toStack(alignment: Alignment.center));
        })
      ].toStack(),
    );
  }
}
