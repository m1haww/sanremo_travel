import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sanremo_travel/pages/utils/colors.dart';

Widget buildtextappbar(BuildContext context, String text) {
  return Text(
    text,
    style: TextStyle(
      fontFamily: "Inter",
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: kWhite,
    ),
  );
}

Widget buildHeight(BuildContext context, double percentage) {
  final height = MediaQuery.of(context).size.height;
  return SizedBox(height: height * percentage);
}

Widget buildWidth(BuildContext context, double percentage) {
  final width = MediaQuery.of(context).size.width;
  return SizedBox(width: width * percentage);
}

Widget buildtextListViewTitle(BuildContext context, String text) {
  return Text(
    text,
    style: TextStyle(
      fontFamily: "Inter",
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: kWhite,
    ),
  );
}

Widget buildIconBack(BuildContext context) {
  return GestureDetector(
    onTap: () {
      Navigator.pop(context);
    },
    child: Icon(Icons.arrow_back_ios, color: kWhite),
  );
}

Widget buildappbar(BuildContext context) {
  return Text(
    "Back",
    style: TextStyle(
      fontFamily: "Sf",
      fontSize: 19,
      color: kWhite,
      fontWeight: FontWeight.w400,
    ),
  );
}

Widget buildTextlcoation(BuildContext context, String text) {
  return Text(
    text,
    style: TextStyle(
      fontFamily: "Inter",
      fontSize: 13,
      color: Colors.white.withOpacity(0.5),
      fontWeight: FontWeight.w300,
    ),
  );
}

Widget buildTextlcoationAlfa(BuildContext context, String? text) {
  return Text(
    text ?? "",
    style: TextStyle(
      fontFamily: "Inter",
      fontSize: 14,
      color: kWhite,
      fontWeight: FontWeight.w300,
    ),
  );
}

Widget buildTextlcoationtitle(BuildContext context, String? text) {
  return Text(
    text ?? "",
    style: TextStyle(
      fontFamily: "Inter",
      fontSize: 26,
      color: kYellow,
      fontWeight: FontWeight.w400,
    ),
  );
}

Widget buildTextReview(BuildContext context, String text) {
  return Text(
    text,
    style: TextStyle(
      fontFamily: "Inter",
      fontSize: 24,
      color: kYellow,
      fontWeight: FontWeight.w400,
    ),
  );
}

Widget buildTextSettings(BuildContext context, String text) {
  return Text(
    text,
    style: TextStyle(
      fontFamily: "Inter",
      fontSize: 16,
      color: kWhite,
      fontWeight: FontWeight.w400,
    ),
  );
}

Widget buildTextMap(BuildContext context, String text) {
  return Text(
    text,
    style: TextStyle(
      fontFamily: "Inter",
      fontSize: 14,
      color: kWhite,
      fontWeight: FontWeight.w500,
    ),
  );
}

Widget buildTextDate(BuildContext context, String text) {
  return Text(
    text,
    style: TextStyle(
      fontFamily: "Inter",
      fontSize: 14,
      color: kWhite,
      fontWeight: FontWeight.w400,
    ),
  );
}

Widget buildTextlcoatdadsda(BuildContext context, String text) {
  return Text(
    text,
    style: TextStyle(
      fontFamily: "Inter",
      fontSize: 12,
      color: Colors.white.withOpacity(0.5),
      fontWeight: FontWeight.w400,
    ),
  );
}
