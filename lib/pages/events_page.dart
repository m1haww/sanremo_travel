import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sanremo_travel/pages/events_details_page.dart';
import 'package:sanremo_travel/pages/utils/base.dart';
import 'package:sanremo_travel/pages/utils/classes.dart';
import 'package:sanremo_travel/pages/utils/colors.dart';
import 'package:sanremo_travel/pages/utils/provider_app.dart';

class EventsPage extends StatefulWidget {
  const EventsPage({super.key});

  @override
  State<EventsPage> createState() => _EventsPageState();
}

class _EventsPageState extends State<EventsPage> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProviderApp>(
      context,
    ); // listen: true pentru UI updates

    return Scaffold(
      backgroundColor: kDarkBlack,
      appBar: AppBar(
        title: Column(
          mainAxisSize: MainAxisSize.min, // Menține titlul centrat corect
          children: [
            buildHeight(context, 0.02),

            buildtextappbar(context, "Events"),
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
        backgroundColor: kDarkBlack,
      ),
      body: SafeArea(
        child:
            provider.events.isEmpty
                ? Center(
                  child: Text(
                    "No events available",
                    style: TextStyle(color: Colors.white),
                  ),
                )
                : Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: buildPage(provider.events),
                ),
      ),
    );
  }

  Widget buildPage(List<Events> events) {
    return ListView.builder(
      itemCount: events.length,
      itemBuilder: (BuildContext context, int index) {
        final item = events[index];

        return Card(
          color: kLightBlack,
          margin: const EdgeInsets.symmetric(vertical: 8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(
                    item.image,
                    height: 180,
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
                            builder:
                                (context) => EventsDetailsPage(events: item),
                          ),
                        );
                      },
                      child: const Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.white,
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
