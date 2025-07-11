import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lucky_magic/main.dart';
import 'package:styled_widget/styled_widget.dart';

import 'magic_result_logic.dart';

class MagicResultPage extends GetView<MagicResultLogic> {
  Widget _typeWidget() {
    if (controller.type == 0) {
      final randomNumber = Random().nextInt(100);
      return Text(
        randomNumber.toString(),
        style: const TextStyle(
            fontSize: 47, color: Colors.white, fontWeight: FontWeight.bold),
      );
    }
    if (controller.type == 1) {
      final random = Random();
      final randomFirstStr = random.nextInt(90) + 10;
      final randomSecondStr = random.nextInt(90) + 10;
      final randomThirdStr = random.nextInt(90) + 10;
      final randomFourthStr = random.nextInt(9) + 1;
      final randomFifthStr = random.nextInt(9) + 1;
      final randomSixthStr = random.nextInt(9) + 1;
      final randomResult =
          '$randomFirstStr $randomSecondStr $randomThirdStr $randomFourthStr $randomFifthStr $randomSixthStr';
      return Text(
        randomResult,
        style: const TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 34),
      );
    }
    if (controller.type == 2) {
      final random = Random();
      final year = 1980 + random.nextInt(45);
      final month = 1 + random.nextInt(12);
      final day = 1 + random.nextInt(28);

      const monthAbbr = {
        1: 'Jan',
        2: 'Feb',
        3: 'Mar',
        4: 'Apr',
        5: 'May',
        6: 'Jun',
        7: 'Jul',
        8: 'Aug',
        9: 'Sep',
        10: 'Oct',
        11: 'Nov',
        12: 'Dec'
      };
      final dateStr = '${monthAbbr[month]} $day ,$year';
      return Text(
        dateStr,
        style: const TextStyle(
            fontSize: 34, color: Colors.white, fontWeight: FontWeight.bold),
      );
    }
    final randomRed = Random().nextInt(256);
    final randomGreen = Random().nextInt(256);
    final randomBlue = Random().nextInt(256);
    final randomColor = Color.fromARGB(255, randomRed, randomGreen, randomBlue);
    final colorHexStr =
        randomColor.value.toRadixString(16).substring(2).toUpperCase();
    return <Widget>[
      Container(
        width: 76,
        height: 76,
      ).decorated(color: randomColor, borderRadius: BorderRadius.circular(38)),
      const SizedBox(
        width: 26,
      ),
      Text(
        '#$colorHexStr',
        style: const TextStyle(
            color: Colors.white, fontSize: 26, fontWeight: FontWeight.bold),
      )
    ].toRow(mainAxisAlignment: MainAxisAlignment.center);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: null,
        foregroundColor: Colors.white,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: <Widget>[
          Image.asset(
            'assets/icon${controller.type}.webp',
            fit: BoxFit.cover,
          ),
          const SizedBox(
            height: 6,
          ),
          Text(
            magicTitles[controller.type],
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 70,
          ),
          <Widget>[
            Image.asset(
              'assets/img1.webp',
              fit: BoxFit.cover,
            ),
            _typeWidget()
          ].toStack(alignment: Alignment.center)
        ].toColumn(mainAxisAlignment: MainAxisAlignment.center),
      ).decorated(
          image: const DecorationImage(
              image: AssetImage('assets/bg.webp'), fit: BoxFit.fill)),
    );
  }
}
