import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sanremo_travel/pages/signup_page.dart';
import 'package:sanremo_travel/pages/utils/base.dart';
import 'package:sanremo_travel/pages/utils/classes.dart';
import 'package:sanremo_travel/pages/utils/colors.dart';
import 'package:sanremo_travel/pages/utils/container.dart';

class EventsDetailsPage extends StatefulWidget {
  final Events events;

  const EventsDetailsPage({super.key, required this.events});
  @override
  State<EventsDetailsPage> createState() => _EventsDetailsPageState();
}

class _EventsDetailsPageState extends State<EventsDetailsPage> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: kDarkBlack,
      appBar: AppBar(
        backgroundColor: kDarkBlack,
        leading: buildIconBack(context),
        centerTitle: false,
        title: buildappbar(context),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(height * 0.02),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Image(
                    image: AssetImage(widget.events.image), // Corrected usage
                    height: height * 0.25,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                buildHeight(context, 0.02),
                buildTextlcoationtitle(
                  context,
                  widget.events.title,
                ), // Corrected usage
                buildHeight(context, 0.02),
                buildTextlcoation(context, "Date"),
                buildHeight(context, 0.01),
                buildTextlcoationAlfa(
                  context,
                  widget.events.date,
                ), // Corrected usage
                buildHeight(context, 0.02),
                buildTextlcoation(context, "Local"),
                buildHeight(context, 0.01),
                buildTextlcoationAlfa(
                  context,
                  widget.events.local,
                ), // Corrected usage
                buildHeight(context, 0.02),
                buildTextlcoation(context, "History"),
                buildHeight(context, 0.01),
                buildTextlcoationAlfa(context, widget.events.description),
                buildHeight(context, 0.02),

                buildHeight(context, 0.005),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      CupertinoPageRoute(builder: (context) => SignupPage()),
                    );
                  },
                  child: buildcontainerSumbit2(context, "Sign up"),
                ),
                buildHeight(context, 0.05),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
