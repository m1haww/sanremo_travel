import 'package:google_maps_flutter/google_maps_flutter.dart';

class Review {
  final int starcount;
  final String text;
  final String date_time;

  Review({
    required this.starcount,
    required this.text,
    required this.date_time,
  });
}

class Restaurants {
  final String title;
  final String image;
  final String description;
  final String local;
  final String history;
  final String fact;
  List<Review> review = [];

  Restaurants({
    required this.title,
    required this.image,
    required this.description,
    required this.local,
    required this.history,
    required this.fact,
    this.review = const [],
  });
}

class Full {
  final String title;
  final String image;
  final String description;
  final String local;
  final String history;
  final String fact;
  LatLng coordinates;
  List<Review> review = [];

  Full({
    required this.title,
    required this.image,
    required this.description,
    required this.local,
    required this.history,
    required this.fact,
    required this.coordinates,

    this.review = const [],
  });
}

class Events {
  final String title;
  final String image;
  final String date;
  final String description;
  final String local;

  Events({
    required this.title,
    required this.image,
    required this.date,
    required this.description,
    required this.local,
  });
}

class RouteModel {
  final String name;
  String date;
  List<Places> places = [];
  List<Full> attractions = [];
  List<Full> restaurant = [];
  List<Full> beach = [];
  List<Full> shopping = [];

  RouteModel({required this.name, required this.date});
}

class Places {
  final String image;
  final String name;
  double latitudine;
  double longitudine;

  Places({
    required this.image,
    required this.name,
    required this.latitudine,
    required this.longitudine,
    required String coordinates,
  });
}

class Recomendation {
  final String name;
  final String descirption;

  Recomendation({required this.name, required this.descirption});
}

final List<Recomendation> _recomand = [
  Recomendation(
    name: "Early Start",
    descirption:
        "Start your day as early as possible, preferably before sunrise. The morning hours are a magical time when the city is still asleep, and you can enjoy the peace and quiet. This is especially important if you plan to visit popular attractions that can get crowded during the day. \n For example, if you plan to visit a monument or a museum, check when they open and try to be there right at opening time.",
  ),
  Recomendation(
    name: "Plan Ahead",
    descirption:
        "Before you head out on your trip, take some time to research the places you want to visit. \n  Make a list of attractions, restaurants, and interesting spots. You can use apps for route planning, such as Google Maps or specialized travel apps, which can help create an optimal itinerary. Try to group places by proximity to minimize travel time.",
  ),
  Recomendation(
    name: "Breaks for Rest",
    descirption:
        "Don’t forget that traveling is not just about sightseeing but also about relaxing and enjoying the atmosphere. \n Schedule breaks to sit in a café, observe the local life, or just take a stroll in the park. This will help you recharge and appreciate the surrounding nature.",
  ),
  Recomendation(
    name: "Flexibility in Schedule",
    descirption:
        "While planning is good, sometimes it’s worth leaving room for improvisation. If you stumble upon something interesting along the way, don’t hesitate to change your plans.\n You might find a unique café, a street market, or a local festival that you didn’t know about beforehand. Flexibility in your schedule will make your journey more exciting and memorable.",
  ),
  Recomendation(
    name: "Explore Local Culture",
    descirption:
        "Before heading to a new place, familiarize yourself with its history, customs, and traditions. This will not only help you understand the local atmosphere better but also avoid awkward situations. \n For example, in some countries, there may be specific rules of behavior in public places or when interacting with locals. Respecting culture and traditions will enhance your travel experience.",
  ),
  Recomendation(
    name: "Check Opening Hours",
    descirption:
        "Before heading to any location, check its opening hours. Many attractions, shops, and restaurants may have limited hours, especially during holidays or weekends. \n Make sure you have enough time to visit all the planned places to avoid missing out on something interesting.",
  ),
  Recomendation(
    name: "Eat Well",
    descirption:
        "One of the best parts of traveling is the opportunity to try local cuisine. Don’t miss the chance to visit local markets and restaurants serving traditional dishes. \n This is not only delicious but also allows you to learn more about the culture of the country. Try to ask locals for their recommendations—this often leads to the most interesting discoveries.",
  ),
  Recomendation(
    name: "Capture Memories",
    descirption:
        "Take photos and keep a travel journal. This will help you preserve memories of the wonderful moments you experienced. \n Write down your impressions, thoughts, and emotions while you’re in a particular place. Later, these entries will be a great way to reminisce about your adventures and share them with friends and family.",
  ),
  Recomendation(
    name: "Use Public Transport",
    descirption:
        "Explore public transport options in the city you’re visiting. It’s not only cost-effective but also gives you a chance to get a better feel for local life. \n Using the subway, buses, or trams can save you time and allow you to see more than just tourist areas. Additionally, this can be an exciting experience, immersing you in the everyday lives of locals.",
  ),
  Recomendation(
    name: "Take Care of Your Health",
    descirption:
        "It’s important to keep an eye on your health while traveling. Make sure you drink enough water, especially in hot weather.  \n Don’t forget to snack to maintain your energy levels. If you feel tired, don’t hesitate to take a break and rest. Sometimes it’s better to spend an hour or two in the shade than to overexert yourself and ruin your day.",
  ),
];
