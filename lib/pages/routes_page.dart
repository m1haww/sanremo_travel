import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sanremo_travel/pages/utils/base.dart';
import 'package:sanremo_travel/pages/utils/classes.dart';
import 'package:sanremo_travel/pages/utils/colors.dart';
import 'package:sanremo_travel/pages/utils/container.dart';
import 'package:sanremo_travel/pages/your_own_place.dart';

class RoutesPage extends StatefulWidget {
  final RouteModel routeModel;

  const RoutesPage({super.key, required this.routeModel});

  @override
  State<RoutesPage> createState() => _RoutesPageState();
}

class _RoutesPageState extends State<RoutesPage> {
  bool save = false;

  final List<Full> _beaches = [
    Full(
      title: "Tre Ponti",
      image: "images/e.png",
      description:
          "A sandy beach with crystal-clear waters, perfect for families.",
      local: "Located near Sanremo, offering a relaxing atmosphere.",
      history: "A popular destination for locals and visitors for decades.",
      fact: "Great spot for surfing and sunbathing.",
      coordinates: LatLng(43.8193, 7.7597), // Near Sanremo, land-based beach
    ),
    Full(
      title: "Bagni Serenella",
      image: "images/f.png",
      description: "A well-maintained beach with sunbeds and a beach bar.",
      local: "Situated in a quiet bay with scenic views.",
      history: "Has been a go-to summer escape for generations.",
      fact: "Known for its excellent beachside service and fresh seafood.",
      coordinates: LatLng(43.8182, 7.7738), // Near Sanremo city center
    ),
    Full(
      title: "Bagni Paradiso",
      image: "images/g.png",
      description:
          "A tropical-style beach with soft sand and turquoise waters.",
      local: "Nestled in a peaceful area with a laid-back vibe.",
      history: "One of the oldest beaches in the region, loved by locals.",
      fact: "Offers sunset yoga sessions right on the shore.",
      coordinates: LatLng(43.8175, 7.7750), // Near Sanremo, land-based beach
    ),
  ];

  final List<Full> _shopping = [
    Full(
      title: "Mercato Bisettimanale di Sanremo",
      image: "images/g.png",
      description: "A bustling open-air market with a variety of local goods.",
      local: "Held twice a week in the heart of Sanremo.",
      history:
          "A traditional marketplace offering fresh produce and artisanal crafts.",
      fact: "A great place to find unique souvenirs and fresh delicacies.",
      coordinates: LatLng(43.8180, 7.7730), // Sanremo city center
    ),
    Full(
      title: "Mercato Annonario",
      image: "images/h.png",
      description:
          "A vibrant indoor market with fresh food and local specialties.",
      local: "Located in a historic building in the city center.",
      history: "A long-standing market offering the best of Italian cuisine.",
      fact: "Famous for its selection of cheeses, meats, and fresh pasta.",
      coordinates: LatLng(43.8131, 7.7752), // Sanremo city center
    ),
    Full(
      title: "The Mall Sanremo",
      image: "images/i.png",
      description: "A luxury shopping destination with top designer brands.",
      local: "Situated just outside the city, offering a high-end experience.",
      history: "A modern shopping center attracting fashion lovers.",
      fact: "Home to exclusive fashion outlets with great discounts.",
      coordinates: LatLng(43.8195, 7.7582), // Near Sanremo
    ),
  ];

  final List<Full> _atractions = [
    Full(
      title: "San Remo",
      image: "images/1.jpg",
      description:
          "A famous casino known for its elegant Art Nouveau architecture and rich history.",
      local: "Corso degli Inglesi, 18, 18038 Sanremo IM, Italy",
      history:
          "Opened in 1905, the casino has been a hotspot for high society and a symbol of San Remo's nightlife.",
      fact:
          "The San Remo Music Festival, Italy’s most famous song contest, originated here in 1951.",
      coordinates: LatLng(43.8108, 7.7732), // San Remo city center
    ),
    Full(
      title: "Villa Nobel",
      image: "images/2.png",
      description:
          "The historic home of Alfred Nobel, now a museum showcasing his life and work.",
      local: "Corso Felice Cavallotti, 116, 18038 Sanremo IM, Italy",
      history:
          "Alfred Nobel, the inventor of dynamite and founder of the Nobel Prize, lived here in the late 19th century.",
      fact:
          "Alfred Nobel referred to this villa as 'my nest' and spent his last years here working on his inventions.",
      coordinates: LatLng(43.8125, 7.7743), // Near Sanremo
    ),
    Full(
      title: "Portosole",
      image: "images/3.png",
      description:
          "A luxurious marina with high-end yachts, restaurants, and scenic sea views.",
      local: "Portosole, 18038 Sanremo IM, Italy",
      history:
          "One of the most important marinas in the Ligurian Riviera, attracting international visitors and yacht owners.",
      fact:
          "Portosole is one of the largest marinas in the Mediterranean, accommodating yachts over 90 meters long.",
      coordinates: LatLng(43.8123, 7.7648), // Near Sanremo, land-based
    ),
    Full(
      title: "La Pigna (Old Town)",
      image: "images/4.png",
      description:
          "A charming medieval district with narrow streets, stairways, and historic buildings.",
      local: "Centro Storico, 18038 Sanremo IM, Italy",
      history:
          "Dating back to the Middle Ages, La Pigna offers a glimpse into the old-world charm of San Remo.",
      fact:
          "The winding streets of La Pigna were designed to protect the town from pirate invasions in medieval times.",
      coordinates: LatLng(43.8137, 7.7753), // Sanremo city center
    ),
  ];
  final List<Full> _restaurants = [
    Full(
      title: "Il Giardino Restaurant & Bar",
      image: "images/a.png",
      description: "Enjoy a delightful culinary experience in a cozy ambiance.",
      local: "Located in the heart of the city, offering authentic flavors.",
      history: "A historic venue known for its exquisite Italian cuisine.",
      fact: "Famous for its handcrafted pasta and signature cocktails.",
      coordinates: LatLng(43.8156, 7.7766), // Near Sanremo
    ),
    Full(
      title: "Nessun Dorma Cinque Terre",
      image: "images/b.png",
      description:
          "A perfect place to enjoy fresh local ingredients with a view.",
      local: "Situated on a cliffside, overlooking the stunning coastline.",
      history: "A well-loved spot for both locals and tourists alike.",
      fact:
          "Named after the famous opera, offering a musical dining experience.",
      coordinates: LatLng(43.8150, 7.7765), // Updated to near Sanremo
    ),
    Full(
      title: "L'Ancora Della Tortuga",
      image: "images/c.png",
      description:
          "A romantic seaside restaurant with top-tier Mediterranean dishes.",
      local: "Nestled near the water, offering a serene dining experience.",
      history:
          "A family-run business that has been serving fresh seafood for decades.",
      fact: "Renowned for its lobster pasta and sunset views.",
      coordinates: LatLng(43.8140, 7.7750), // Near Sanremo
    ),
    Full(
      title: "Consani Osteria",
      image: "images/d.png",
      description: "A rustic spot offering authentic Ligurian cuisine.",
      local: "Tucked away in a picturesque alley, full of character.",
      history:
          "A hidden gem known for its warm hospitality and classic recipes.",
      fact: "Famous for its handmade focaccia and local wines.",
      coordinates: LatLng(43.8227, 7.7763), // Near Sanremo
    ),
  ];
  int? selectedRestaurant;
  int? selectedAttraction;
  int? selectedShopping;
  int? selectedBeach;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: kDarkBlack,
      appBar: AppBar(
        backgroundColor: kDarkBlack,
        centerTitle: false,
        leading: buildIconBack(context),
        title: buildappbar(context),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.02),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildTextlcoationtitle(context, "Create a route"),
                buildHeight(context, 0.02),

                buildTextMap(context, "Attractions"),
                buildHeight(context, 0.02),
                _buildCategory("Attractions", _atractions, (index) {
                  setState(() {
                    print(widget.routeModel.attractions.length);
                    selectedAttraction = index;
                    if (!widget.routeModel.attractions.contains(
                      _atractions[index],
                    )) {
                      widget.routeModel.attractions.clear();
                      widget.routeModel.attractions.add(_atractions[index]);
                    }
                  });
                }, selectedAttraction),

                buildHeight(context, 0.005),

                buildTextMap(context, "Restaurants & cafes"),
                buildHeight(context, 0.02),
                _buildCategory("Restaurants", _restaurants, (index) {
                  setState(() {
                    print(widget.routeModel.restaurant.length);
                    selectedRestaurant = index;
                    if (!widget.routeModel.restaurant.contains(
                      _restaurants[index],
                    )) {
                      widget.routeModel.restaurant.clear();
                      widget.routeModel.restaurant.add(_restaurants[index]);
                    }
                  });
                }, selectedRestaurant),

                buildHeight(context, 0.005),

                buildTextMap(context, "Beaches & embankments"),
                buildHeight(context, 0.02),
                _buildCategory("Beaches", _beaches, (index) {
                  print(widget.routeModel.beach.length);
                  setState(() {
                    selectedBeach = index;
                    if (!widget.routeModel.beach.contains(_beaches[index])) {
                      widget.routeModel.beach.clear();
                      widget.routeModel.beach.add(_beaches[index]);
                    }
                  });
                }, selectedBeach),

                buildHeight(context, 0.005),

                buildTextMap(context, "Shopping"),
                buildHeight(context, 0.02),
                _buildCategory("Shopping", _shopping, (index) {
                  setState(() {
                    print(widget.routeModel.shopping.length);
                    selectedShopping = index;
                  });
                  if (!widget.routeModel.shopping.contains(_shopping[index])) {
                    widget.routeModel.shopping.clear();
                    widget.routeModel.shopping.add(_shopping[index]);
                  }
                }, selectedShopping),

                buildHeight(context, 0.02),
                Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: () {
                      // Check if any of the routeModel lists are empty
                      if (widget.routeModel.attractions.isEmpty ||
                          widget.routeModel.restaurant.isEmpty ||
                          widget.routeModel.beach.isEmpty ||
                          widget.routeModel.shopping.isEmpty) {
                        // If any list is empty, show a message using ScaffoldMessenger
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('You need to select all the routes!'),
                            backgroundColor: Colors.red,
                          ),
                        );
                      } else {
                        // If all lists have selections, proceed to the next page
                        Navigator.push(
                          context,
                          CupertinoPageRoute(
                            builder:
                                (context) =>
                                    YourOwnPlace(routeModel: widget.routeModel),
                          ),
                        );
                      }
                    },
                    child: buildcontainerSumbit3(context, "Done"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCategory(
    String title,
    List<Full> items,
    Function(int) onTap,
    int? selectedIndex,
  ) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: List.generate(items.length, (index) {
            return GestureDetector(
              onTap: () => onTap(index),
              child: Container(
                margin: EdgeInsets.only(bottom: 10),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.grey[900],
                  borderRadius: BorderRadius.circular(34),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(height * 0.005),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(30),
                            child: Image.asset(
                              items[index].image,
                              width: width * 0.3,
                              height: height * 0.11,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Spacer(),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(
                            selectedIndex == index
                                ? Icons.radio_button_checked
                                : Icons.radio_button_off,
                            color:
                                selectedIndex == index ? kYellow : Colors.grey,
                          ),
                        ),
                      ],
                    ),
                    buildHeight(context, 0.005),
                    Padding(
                      padding: EdgeInsets.all(height * 0.005),
                      child: Text(
                        items[index].title,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
        ),
        SizedBox(height: 20),
      ],
    );
  }
}
