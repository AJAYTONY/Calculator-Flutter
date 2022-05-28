import 'package:calculator_flutter/controller/calculate_controller.dart';
import 'package:calculator_flutter/controller/theme_controller.dart';
import 'package:calculator_flutter/utils/colors.dart';
import 'package:calculator_flutter/widget/button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class MainSceen extends StatelessWidget {
  MainSceen({Key? key}) : super(key: key);

  final List<String> buttons = [
    "C",
    "DEL",
    "%",
    "/",
    "9",
    "8",
    "7",
    "x",
    "6",
    "5",
    "4",
    "-",
    "3",
    "2",
    "1",
    "+",
    "0",
    ".",
    "ANS",
    "=",
  ];

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<CalculateController>();
    var themeController = Get.find<ThemeController>();

    return GetBuilder<ThemeController>(builder: (context) {
      return Scaffold(
        backgroundColor: themeController.isDark
            ? DarkColors.scaffoldBgColor
            : LightColors.scaffoldBgColor,
        body: Column(
          children: [
            GetBuilder<CalculateController>(builder: (context) {
              return outputSection(themeController, controller);
            }),
            inputSection(themeController, controller)
          ],
        ),
      );
    });
  }


  Expanded inputSection(
      ThemeController themeController, CalculateController controller) {
    return Expanded(
        flex: 2,
        child: Container(
          padding: const EdgeInsets.all(3),
          decoration: BoxDecoration(
              color: themeController.isDark
                  ? DarkColors.sheetBgColor
                  : LightColors.sheetBgColor,
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30), topRight: Radius.circular(30))),
          child: GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: buttons.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4),
              itemBuilder: (context, index) {
                switch (index) {
                  //TODO: Custom Button
                  case 0:
                    return CustomButton(
                        color: themeController.isDark
                            ? DarkColors.btnBgColor
                            : LightColors.btnBgColor,
                        textColor: themeController.isDark
                            ? DarkColors.leftOperatorColor
                            : LightColors.leftOperatorColor,
                        text: buttons[index],
                        buttonTapped: () {
                          controller.clearInputAndOutput();
                        });

                //TODO: DELETE Button
                  case 1:
                    return CustomButton(
                        buttonTapped: () {
                          controller.deleteBtnAction();
                        },
                        color: themeController.isDark
                            ? DarkColors.btnBgColor
                            : LightColors.btnBgColor,
                        textColor: themeController.isDark
                            ? DarkColors.leftOperatorColor
                            : LightColors.leftOperatorColor,
                        text: buttons[index]);

                //TODO: EQUAL Button
                  case 19:
                    return CustomButton(
                        buttonTapped: () {
                          controller.equalPressed();
                        },
                        color: themeController.isDark
                            ? DarkColors.btnBgColor
                            : LightColors.btnBgColor,
                        textColor: themeController.isDark
                            ? DarkColors.leftOperatorColor
                            : LightColors.leftOperatorColor,
                        text: buttons[index]);

                  default:
                    return CustomButton(
                        buttonTapped: () {
                          controller.onBtnTapped(buttons, index);
                        },
                        color: themeController.isDark
                            ? DarkColors.btnBgColor
                            : LightColors.btnBgColor,
                        textColor: isOperator(buttons[index])
                            ? LightColors.operatorColor
                            : themeController.isDark
                            ? Colors.white
                            : Colors.black,
                        text: buttons[index]);
                }
              }),
        ));
  }

  //TODO:  OUTPUT --> Show Result
  Expanded outputSection(
      ThemeController themeController, CalculateController controller) {
    return Expanded(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.topCenter,
              width: 100,
              height: 45,
              decoration: BoxDecoration(
                  color: themeController.isDark
                      ? DarkColors.sheetBgColor
                      : LightColors.sheetBgColor,
                  borderRadius: BorderRadius.circular(20)),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        themeController.lightTheme();
                      },
                      child: Icon(
                        Icons.light_mode_outlined,
                        color: themeController.isDark
                            ? Colors.grey
                            : Colors.black,
                        size: 25,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        themeController.darkTheme();
                      },
                      child: Icon(
                        Icons.dark_mode_outlined,
                        color: themeController.isDark
                            ? Colors.white
                            : Colors.grey,
                        size: 25,
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20, top: 70),
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.centerRight,
                    child: Text(
                      controller.userInput,
                      style: TextStyle(
                          color:
                          themeController.isDark
                              ? Colors.white
                              : Colors.black,
                          fontSize: 25),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    alignment: Alignment.bottomRight,
                    child: Text(controller.userOutput,
                        style: TextStyle(
                            color: themeController.isDark
                                ? Colors.white
                                : Colors.black,
                            fontSize: 32)),
                  ),
                ],
              ),
            ),
          ],
        ));
  }

  bool isOperator(String y) {
    if (y == "%" || y == "/" || y == "x" || y == "-" || y == "+" || y == "=") {
      return true;
    }
    return false;
  }
}
