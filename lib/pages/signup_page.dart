import 'package:flutter/material.dart';
import 'package:sanremo_travel/pages/utils/base.dart';
import 'package:sanremo_travel/pages/utils/classes.dart';
import 'package:sanremo_travel/pages/utils/colors.dart';
import 'package:sanremo_travel/pages/utils/container.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  bool Save = false;

  final TextEditingController _controllername = TextEditingController();
  final TextEditingController _controllersurname = TextEditingController();
  final TextEditingController _controllerphonenumber = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controllername.addListener(_updateSaveButtonState);
    _controllersurname.addListener(_updateSaveButtonState);
    _controllerphonenumber.addListener(_updateSaveButtonState);
  }

  @override
  void dispose() {
    _controllername.dispose();
    _controllersurname.dispose();
    _controllerphonenumber.dispose();
    super.dispose();
  }

  void _updateSaveButtonState() {
    setState(() {
      Save =
          _controllername.text.isNotEmpty &&
          _controllersurname.text.isNotEmpty &&
          _controllerphonenumber.text.isNotEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: kDarkBlack,
      appBar: AppBar(
        backgroundColor: kDarkBlack,
        centerTitle: false,
        title: buildappbar(context),
        leading: buildIconBack(context),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(height * 0.02),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildTextlcoationtitle(context, "Recording for an event"),
              buildHeight(context, 0.02),
              Center(child: Image(image: AssetImage("images/123.png"))),
              buildHeight(context, 0.02),
              buildContainerField(
                context,
                "Name",
                kWhite,
                Colors.white.withOpacity(0.5),
                controller: _controllername,
              ),
              buildHeight(context, 0.008),
              buildContainerField(
                context,
                "Surname",
                kWhite,
                Colors.white.withOpacity(0.5),
                controller: _controllersurname,
              ),
              buildHeight(context, 0.008),
              buildContainerField(
                context,
                "Phone number",
                kWhite,
                Colors.white.withOpacity(0.5),
                isNumericOnly: true,
                controller: _controllerphonenumber,
              ),
              Spacer(),
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () {
                    if (!_controllername.text.isNotEmpty ||
                        !_controllersurname.text.isNotEmpty ||
                        !_controllerphonenumber.text.isNotEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Please complete all fields."),
                          backgroundColor: Colors.red,
                        ),
                      );
                    } else {
                      showAlertDialog(context);
                    }
                  },
                  child: buildcontainerSumbit3(context, "Done"),
                ),
              ),
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
                width:
                    double
                        .infinity, // Set the width to double.infinity to take full screen width
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
                          "You have an appointment for the event",
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
        );
      },
    );
  }
}
