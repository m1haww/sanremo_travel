import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sanremo_travel/pages/utils/base.dart';
import 'package:sanremo_travel/pages/utils/colors.dart';

class Recomendations extends StatefulWidget {
  const Recomendations({super.key});

  @override
  State<Recomendations> createState() => _RecomendationsState();
}

class _RecomendationsState extends State<Recomendations> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: kDarkBlack,
      appBar: AppBar(
        backgroundColor: kDarkBlack,
        centerTitle: true,
        title: buildText1(context, "Recommendations"),
        leading: buildIconBack(context),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(height * 0.02),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildText1(context, "Early Start"),
                buildHeight(context, 0.005),
                buildText2(
                  context,
                  "Start your day as early as possible, preferably before sunrise. The morning hours are a magical time when the city is still asleep, and you can enjoy the peace and quiet. This is especially important if you plan to visit popular attractions that can get crowded during the day. For example, if you plan to visit a monument or a museum, check when they open and try to be there right at opening time.",
                ),
                buildHeight(context, 0.02),
                //
                buildText1(context, "Plan Ahead"),
                buildHeight(context, 0.005),
                buildText2(
                  context,
                  "Before you head out on your trip, take some time to research the places you want to visit. Make a list of attractions, restaurants, and interesting spots. You can use apps for route planning, such as Google Maps or specialized travel apps, which can help create an optimal itinerary. Try to group places by proximity to minimize travel time.",
                ),
                buildHeight(context, 0.02),
                //
                buildText1(context, "Breaks for Rest"),
                buildHeight(context, 0.005),
                buildText2(
                  context,
                  "Don’t forget that traveling is not just about sightseeing but also about relaxing and enjoying the atmosphere. Schedule breaks to sit in a café, observe the local life, or just take a stroll in the park. This will help you recharge and appreciate the surrounding nature.",
                ),
                buildHeight(context, 0.02),
                //
                buildText1(context, "Flexibility in Schedule"),
                buildHeight(context, 0.005),
                buildText2(
                  context,
                  "While planning is good, sometimes it’s worth leaving room for improvisation. If you stumble upon something interesting along the way, don’t hesitate to change your plans. You might find a unique café, a street market, or a local festival that you didn’t know about beforehand. Flexibility in your schedule will make your journey more exciting and memorable.",
                ),
                buildHeight(context, 0.02),
                //
                buildText1(context, "Explore Local Culture"),
                buildHeight(context, 0.005),
                buildText2(
                  context,
                  "Before heading to a new place, familiarize yourself with its history, customs, and traditions. This will not only help you understand the local atmosphere better but also avoid awkward situations. For example, in some countries, there may be specific rules of behavior in public places or when interacting with locals. Respecting culture and traditions will enhance your travel experience.",
                ),
                buildHeight(context, 0.02),
                //
                buildText1(context, "Check Opening Hours"),
                buildHeight(context, 0.005),
                buildText2(
                  context,
                  "Before heading to any location, check its opening hours. Many attractions, shops, and restaurants may have limited hours, especially during holidays or weekends. Make sure you have enough time to visit all the planned places to avoid missing out on something interesting.",
                ),
                buildHeight(context, 0.02),
                //
                buildText1(context, "Eat Well"),
                buildHeight(context, 0.005),
                buildText2(
                  context,
                  "One of the best parts of traveling is the opportunity to try local cuisine. Don’t miss the chance to visit local markets and restaurants serving traditional dishes. This is not only delicious but also allows you to learn more about the culture of the country. Try to ask locals for their recommendations—this often leads to the most interesting discoveries.",
                ),
                buildHeight(context, 0.02),
                //
                buildText1(context, "Capture Memories"),
                buildHeight(context, 0.005),
                buildText2(
                  context,
                  "Take photos and keep a travel journal. This will help you preserve memories of the wonderful moments you experienced. Write down your impressions, thoughts, and emotions while you’re in a particular place. Later, these entries will be a great way to reminisce about your adventures and share them with friends and family.",
                ),
                buildHeight(context, 0.02),
                //
                buildText1(context, "Use Public Transport"),
                buildHeight(context, 0.005),
                buildText2(
                  context,
                  "Explore public transport options in the city you’re visiting. It’s not only cost-effective but also gives you a chance to get a better feel for local life. Using the subway, buses, or trams can save you time and allow you to see more than just tourist areas. Additionally, this can be an exciting experience, immersing you in the everyday lives of locals.",
                ),
                buildHeight(context, 0.02),
                //
                buildText1(context, "Take Care of Your Health"),
                buildHeight(context, 0.005),
                buildText2(
                  context,
                  "It’s important to keep an eye on your health while traveling. Make sure you drink enough water, especially in hot weather. Don’t forget to snack to maintain your energy levels. If you feel tired, don’t hesitate to take a break and rest. Sometimes it’s better to spend an hour or two in the shade than to overexert yourself and ruin your day.",
                ),
                buildHeight(context, 0.04),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget buildText1(BuildContext context, String text) {
  return Text(
    text,
    style: TextStyle(
      fontFamily: "Sf",
      fontSize: 16,
      color: kWhite,
      fontWeight: FontWeight.w600,
    ),
  );
}

Widget buildText2(BuildContext context, String text) {
  return Text(
    text,
    style: TextStyle(
      fontFamily: "Sf",
      fontSize: 14,
      color: Colors.white.withOpacity(0.5),
      fontWeight: FontWeight.w400,
    ),
  );
}
