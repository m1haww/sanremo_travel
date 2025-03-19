import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sanremo_travel/pages/location_info.dart';
import 'package:sanremo_travel/pages/utils/base.dart';
import 'package:sanremo_travel/pages/utils/classes.dart';
import 'package:sanremo_travel/pages/utils/colors.dart';
import 'package:sanremo_travel/pages/utils/provider_app.dart';

class LocationPage extends StatefulWidget {
  const LocationPage({super.key});

  @override
  State<LocationPage> createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProviderApp>(context, listen: false);

    final size = MediaQuery.of(context).size;
    final height = size.height;

    return Scaffold(
      backgroundColor: kDarkBlack,
      appBar: AppBar(
        backgroundColor: kDarkBlack,
        centerTitle: true,
        title: Column(
          mainAxisSize: MainAxisSize.min, // Menține titlul centrat corect
          children: [
            buildHeight(context, 0.02),

            buildtextappbar(context, "Best places in Sanremo"),
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
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(height * 0.01),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildHeight(context, 0.02),
              SizedBox(
                height: 40,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    _buildCategoryCard("Attractions", 0, context),
                    _buildCategoryCard("Restaurants & cafes", 1, context),
                    _buildCategoryCard("Beaches & embankments", 2, context),
                    _buildCategoryCard("Shopping", 3, context),
                  ],
                ),
              ),
              buildHeight(context, 0.01),
              Expanded(
                child: Consumer<ProviderApp>(
                  builder: (context, locationProvider, _) {
                    // Listă de liste pentru categorii
                    List<List<Full>> categories = [
                      locationProvider.atractions,
                      locationProvider.restaurants,
                      locationProvider.beaches,
                      locationProvider.shopping,
                    ];

                    // Verifică dacă indexul selectat este valid
                    if (locationProvider.selectedIndex >= 0 &&
                        locationProvider.selectedIndex < categories.length) {
                      List<Full> selectedCategory =
                          categories[locationProvider.selectedIndex];

                      return buildPage(selectedCategory);
                    } else {
                      return const Center(
                        child: Text(
                          'No category selected',
                          style: TextStyle(color: Colors.white),
                        ),
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryCard(String title, int index, BuildContext context) {
    bool isSelected = context.watch<ProviderApp>().selectedIndex == index;

    return GestureDetector(
      onTap: () {
        context.read<ProviderApp>().setSelectedIndex(index);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        margin: const EdgeInsets.only(right: 20),
        decoration: BoxDecoration(
          color: isSelected ? kYellow : Colors.transparent,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(color: isSelected ? kWhite : kGRray, fontSize: 16),
          ),
        ),
      ),
    );
  }

  Widget buildPage(List<Full> categoryList) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return ListView.builder(
      itemCount: categoryList.length,
      itemBuilder: (BuildContext context, int index) {
        final item = categoryList[index];

        return Card(
          color: kLightBlack,
          margin: EdgeInsets.all(height * 0.008),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: EdgeInsets.all(width * 0.03),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(
                    item.image,
                    height: height * 0.2,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                buildHeight(context, 0.02),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    buildtextappbar(context, item.title),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          CupertinoPageRoute(
                            builder: (context) => LocationInfo(item: item),
                          ),
                        );
                      },
                      child: const Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
