import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:sanremo_travel/pages/utils/base.dart';
import 'package:sanremo_travel/pages/utils/colors.dart';

Widget buildcontainerreview(BuildContext context) {
  final height = MediaQuery.of(context).size.height;
  final width = MediaQuery.of(context).size.width;
  return Container(
    width: width * 0.65,
    height: height * 0.11,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(70),
      color: kLightBlack,
    ),
    child: Center(
      child: Text(
        "No reviews submitted yet.",
        style: TextStyle(
          fontFamily: "Inter",
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: Colors.white.withOpacity(0.5),
        ),
        textAlign: TextAlign.center,
      ),
    ),
  );
}

Widget buildStar() {
  return Row(
    mainAxisSize: MainAxisSize.min, // Prevents unnecessary stretching
    children: List.generate(
      5,
      (index) => Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 4,
        ), // Space between stars
        child: Icon(Icons.star, color: Color(0xffFFE838), size: 37),
      ),
    ),
  );
}

Widget buildcontainerSumbit(BuildContext context, String text) {
  final height = MediaQuery.of(context).size.height;
  final width = MediaQuery.of(context).size.width;
  return Container(
    width: width * 0.45,
    height: height * 0.055,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(70),
      color: kYellow,
    ),
    child: Padding(
      padding: EdgeInsets.only(left: width * 0.04, right: width * 0.04),
      child: Center(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              text,
              style: TextStyle(
                fontFamily: "Inter",
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: kWhite,
              ),
              textAlign: TextAlign.center,
            ),
            Spacer(),
            Icon(Icons.arrow_forward, color: kWhite),
          ],
        ),
      ),
    ),
  );
}

Widget buildcontainerSumbit2(BuildContext context, String text) {
  final height = MediaQuery.of(context).size.height;
  final width = MediaQuery.of(context).size.width;
  return Container(
    width: width * 0.3,
    height: height * 0.055,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(70),
      color: kYellow,
    ),
    child: Padding(
      padding: EdgeInsets.only(left: width * 0.04, right: width * 0.04),
      child: Center(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              text,
              style: TextStyle(
                fontFamily: "Inter",
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: kWhite,
              ),
              textAlign: TextAlign.center,
            ),
            Spacer(),
            Icon(Icons.arrow_forward, color: kWhite),
          ],
        ),
      ),
    ),
  );
}

Widget buildcontainerSumbit3(BuildContext context, String text) {
  final height = MediaQuery.of(context).size.height;
  final width = MediaQuery.of(context).size.width;
  return Container(
    width: width * 0.26,
    height: height * 0.055,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(70),
      color: kYellow,
    ),
    child: Padding(
      padding: EdgeInsets.only(left: width * 0.04, right: width * 0.04),
      child: Center(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              text,
              style: TextStyle(
                fontFamily: "Inter",
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: kWhite,
              ),
              textAlign: TextAlign.center,
            ),
            Spacer(),
            Icon(Icons.arrow_forward, color: kWhite),
          ],
        ),
      ),
    ),
  );
}

void showAlertDialog(BuildContext context) {
  final height = MediaQuery.of(context).size.height;
  final width = MediaQuery.of(context).size.width;

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        insetPadding: EdgeInsets.all(height * 0.02),
        backgroundColor:
            Colors.transparent, // Make the dialog background transparent
        child: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: <Widget>[
            Container(
              width: double.infinity, // Set the width to double.infinity
              height: height * 0.19,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(70),
                color: kYellow, // Example color
              ),
              child: Padding(
                padding: EdgeInsets.all(height * 0.026),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: width * 0.02,
                          right: width * 0.02,
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              textAlign: TextAlign.center,
                              "Thank you!",
                              style: TextStyle(
                                fontFamily: "Inter",
                                fontSize: 24,
                                fontWeight: FontWeight.w400,
                                color: kWhite,
                              ),
                            ),
                            Spacer(),
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Image(
                                image: AssetImage("images/x-24.png"),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    buildHeight(context, 0.02),
                    Padding(
                      padding: EdgeInsets.only(
                        left: width * 0.005,
                        right: width * 0.005,
                      ),
                      child: Text(
                        "Your review has been submitted.",
                        style: TextStyle(
                          fontFamily: "Inter",
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          // ignore: deprecated_member_use
                          color: Colors.white.withOpacity(0.82),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    },
  );
}

Widget buildContainerField(
  BuildContext context,
  String text,
  Color colortext,
  Color colorhint, {
  required TextEditingController controller,
  bool isNumericOnly = false, // Add a parameter to control input type
}) {
  final height = MediaQuery.of(context).size.height;

  // Input formatter for numeric only
  List<TextInputFormatter> inputFormatters = [];
  if (isNumericOnly) {
    inputFormatters = [
      FilteringTextInputFormatter.allow(
        RegExp(r'^\d+(\.\d{0,2})?$'),
      ), // Allows numbers with up to two decimal places
    ];
  }

  return Container(
    width: double.infinity,
    height: height * 0.055,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(30),
      color: kLightBlack,
    ),
    child: Padding(
      padding: const EdgeInsets.only(left: 15.0, right: 15),
      child: TextField(
        controller: controller,
        keyboardType:
            isNumericOnly
                ? TextInputType.number
                : TextInputType.text, // Dynamically change keyboard
        inputFormatters: inputFormatters, // Apply the input formatter if needed
        decoration: InputDecoration(
          hintText: text,
          hintStyle: TextStyle(
            fontFamily: "Sf",
            fontWeight: FontWeight.w400,
            fontSize: 16,
            color: colorhint,
          ),
          border: InputBorder.none,
        ),
        style: TextStyle(
          fontFamily: "Sf",
          fontWeight: FontWeight.w400,
          fontSize: 16,
          color: colortext,
        ),
        cursorColor: kWhite,
      ),
    ),
  );
}

Widget buildx(BuildContext context) {
  return Column(
    mainAxisSize: MainAxisSize.min, // Menține titlul centrat corect
    children: [
      buildHeight(context, 0.02),

      buildHeight(context, 0.01),
      Container(
        height: 1, // Subțire ca un Divider
        width: double.infinity,
        decoration: BoxDecoration(
          color: kLightBlack, // Culoarea liniei principale
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.5), // Culoarea umbrei
              blurRadius: 4, // Raza umbrei
              spreadRadius: 1, // Extinderea umbrei
              offset: Offset(0, 2), // Deplasare în jos
            ),
          ],
        ),
      ),
    ],
  );
}

Widget buildContainerAdd(BuildContext context) {
  final height = MediaQuery.of(context).size.height;

  return Container(
    width: double.infinity,
    height: height * 0.05,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(47),
      color: kYellow,
    ),
    child: Center(
      child: Text(
        "Add to Route",
        style: TextStyle(
          fontFamily: "Inter",
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: kWhite,
        ),
      ),
    ),
  );
}
