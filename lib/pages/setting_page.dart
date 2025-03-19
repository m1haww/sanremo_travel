import 'package:flutter/material.dart';
import 'package:sanremo_travel/pages/utils/base.dart';
import 'package:sanremo_travel/pages/utils/colors.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  final Uri _url = Uri.parse(
    'https://www.termsfeed.com/live/6f945791-2ba4-4c38-a71f-a9b4cdbf392b',
  );

  Future<void> _launchUrl() async {
    if (await canLaunchUrl(_url)) {
      await launchUrl(_url, mode: LaunchMode.externalApplication);
    } else {
      throw Exception('Could not launch $_url');
    }
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: kDarkBlack,
      appBar: AppBar(
        backgroundColor: kDarkBlack,
        centerTitle: true,
        title: Column(
          mainAxisSize: MainAxisSize.min, // Menține titlul centrat corect
          children: [
            buildHeight(context, 0.02),

            buildtextappbar(context, "Settings"),
            buildHeight(context, 0.01),
            Container(
              height: 1, // Subțire ca un Divider
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
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(height * 0.02),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildHeight(context, 0.02),
              Center(
                child: Image(
                  image: AssetImage("images/------------------- 1.png"),
                  fit: BoxFit.cover,
                ),
              ),
              buildHeight(context, 0.02),
              GestureDetector(onTap: _launchUrl, child: buildContainer()),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildContainer() {
    final height = MediaQuery.of(context).size.height;

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(13),
        color: kLightBlack,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildHeight(context, 0.003),
          Padding(
            padding: EdgeInsets.all(height * 0.012),
            child: buildTextSettings(context, "Developer Website"),
          ),
          builddiver(),
          buildHeight(context, 0.005),
          Padding(
            padding: EdgeInsets.all(height * 0.012),
            child: buildTextSettings(context, "Privacy Policy"),
          ),
          builddiver(),
          buildHeight(context, 0.005),
          Padding(
            padding: EdgeInsets.all(height * 0.012),
            child: buildTextSettings(context, "Terms of Use"),
          ),
          buildHeight(context, 0.003),
        ],
      ),
    );
  }

  Widget builddiver() {
    return Container(
      height: 0.5, // Face linia mai subțire
      width: double.infinity,
      color: Colors.grey[700], // O nuanță mai subtilă pentru separator
    );
  }
}
