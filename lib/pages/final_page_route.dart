import 'package:flutter/material.dart';
import 'package:sanremo_travel/pages/utils/base.dart';
import 'package:sanremo_travel/pages/utils/colors.dart';

class FinalPageRoute extends StatefulWidget {
  const FinalPageRoute({super.key});

  @override
  State<FinalPageRoute> createState() => _FinalPageRouteState();
}

class _FinalPageRouteState extends State<FinalPageRoute> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: kDarkBlack,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(height * 0.02),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width:
                    double
                        .infinity, // Adjust the width to be a larger percentage
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
                                  Navigator.pop(context);
                                  Navigator.pop(context);
                                  Navigator.pop(context);
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
        ),
      ),
    );
  }
}
