import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:sanremo_travel/pages/aaaa_route_details.dart';
import 'package:sanremo_travel/pages/maps_info.dart';
import 'package:sanremo_travel/pages/utils/base.dart';
import 'package:sanremo_travel/pages/utils/classes.dart';
import 'package:sanremo_travel/pages/utils/colors.dart';
import 'package:sanremo_travel/pages/utils/provider_app.dart';
import 'package:sanremo_travel/pages/utils/recomendations.dart';

class MapsPage extends StatefulWidget {
  const MapsPage({super.key});

  @override
  State<MapsPage> createState() => _MapsPageState();
}

class _MapsPageState extends State<MapsPage> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProviderApp>(
      context,
    ); // Access the provider to update the model

    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: kDarkBlack,
      appBar: AppBar(
        backgroundColor: kDarkBlack,
        title: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            buildHeight(context, 0.02),
            buildtextappbar(context, "My routes"),
            buildHeight(context, 0.01),
            Container(
              height: 1,
              width: double.infinity,
              decoration: BoxDecoration(
                color: kLightBlack,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.5),
                    blurRadius: 4,
                    spreadRadius: 1,
                    offset: Offset(0, 2),
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
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildTextlcoationtitle(context, "Create a route"),
                buildHeight(context, 0.02),
                // Check if routeModel is null
                provider.routemodel.isEmpty
                    ? Center(
                      child: GestureDetector(
                        onTap: () {
                          print(provider.routemodel.length);
                          setState(() {});
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                              child: Image.asset(
                                "images/1234.png",
                                height: height * 0.35,
                                width: width * 0.6,
                              ),
                            ),
                            buildHeight(context, 0.04),
                            Container(
                              width: double.infinity,
                              height: height * 0.07,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(120),
                                color: kLightBlack,
                              ),
                              child: Center(
                                child: Padding(
                                  padding: EdgeInsets.all(height * 0.02),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Recommendations",
                                        style: TextStyle(
                                          fontFamily: "Sf",
                                          color: kWhite,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 16,
                                        ),
                                      ),
                                      Spacer(),
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            CupertinoPageRoute(
                                              builder:
                                                  (context) => Recomendations(),
                                            ),
                                          );
                                        },
                                        child: Icon(
                                          Icons.arrow_forward_ios,
                                          size: 20,
                                          color: kWhite,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                    : ListView.builder(
                      shrinkWrap: true,
                      itemCount: provider.routemodel.length,
                      itemBuilder: (context, index) {
                        final route = provider.routemodel[index];
                        return Card(
                          color: Colors.grey[900],
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          margin: const EdgeInsets.symmetric(vertical: 3),
                          child: ListTile(
                            title: Text(
                              route.name,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                fontFamily: "Sf",
                              ),
                            ),
                            subtitle: Text(
                              DateFormat(
                                'yyyy.MM.dd',
                              ).format(DateTime.parse(route.date)),
                              style: TextStyle(
                                color: Colors.white.withOpacity(0.5),
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                fontFamily: "Sf",
                              ),
                            ),
                            trailing: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  CupertinoPageRoute(
                                    builder:
                                        (context) =>
                                            AaaaRouteDetails(routeModel: route),
                                  ),
                                );
                              },
                              child: Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.white,
                                size: 20,
                              ),
                            ),
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 15,
                            ),
                          ),
                        );
                      },
                    ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: Container(
        width: width * 0.18,
        height: height * 0.06,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(40)),
        child: FloatingActionButton(
          backgroundColor: kYellow,
          onPressed: () async {
            // Pass the current routeModel to MapsInfo and await updated routeModel
            final updatedRouteModel = await Navigator.push<RouteModel>(
              context,
              CupertinoPageRoute(builder: (context) => MapsInfo()),
            );

            // If MapsInfo returns an updated routeModel, update it in the provider
            if (updatedRouteModel != null) {
              provider.addRouteModel(updatedRouteModel);
            }
          },
          shape: CircleBorder(),
          child: Center(child: Icon(Icons.add, color: kWhite, size: 30)),
        ),
      ),
    );
  }
}
