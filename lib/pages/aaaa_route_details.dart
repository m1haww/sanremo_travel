import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:sanremo_travel/pages/utils/base.dart';
import 'package:sanremo_travel/pages/utils/classes.dart';
import 'package:sanremo_travel/pages/utils/colors.dart';
import 'package:sanremo_travel/pages/utils/provider_app.dart';

class AaaaRouteDetails extends StatefulWidget {
  final RouteModel routeModel;

  const AaaaRouteDetails({super.key, required this.routeModel});

  @override
  State<AaaaRouteDetails> createState() => _AaaaRouteDetailsState();
}

class _AaaaRouteDetailsState extends State<AaaaRouteDetails> {
  late GoogleMapController mapController;

  @override
  void dispose() {
    mapController.dispose();
    super.dispose();
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    // final provider = Provider.of(context)<ProviderApp>(lsiten: false);
    print(widget.routeModel.attractions.length);
    print(widget.routeModel.restaurant.length);
    print(widget.routeModel.beach.length);
    print(widget.routeModel.shopping.length);
    return Scaffold(
      backgroundColor: kDarkBlack,
      appBar: AppBar(
        leading: buildIconBack(context),
        backgroundColor: kDarkBlack,
        centerTitle: false,
        title: buildappbar(context),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 300, // Ajustează înălțimea după preferință
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: GoogleMap(
                  myLocationButtonEnabled: false,
                  onMapCreated: _onMapCreated,
                  initialCameraPosition: CameraPosition(
                    target:
                        widget.routeModel.beach.isNotEmpty
                            ? widget.routeModel.beach[0].coordinates
                            : LatLng(0, 0),
                    zoom: 12.0,
                  ),
                  markers: {
                    for (var place in widget.routeModel.attractions)
                      Marker(
                        onTap: () {
                          _showInfoDialogRouteMdeol(
                            context,
                            widget.routeModel.attractions,
                          );
                        },
                        markerId: MarkerId(place.title),
                        position: place.coordinates,
                        infoWindow: InfoWindow(title: place.title),
                      ),
                    for (var place in widget.routeModel.restaurant)
                      Marker(
                        onTap: () {
                          _showInfoDialogRouteMdeol(
                            context,
                            widget.routeModel.restaurant,
                          );
                        },
                        markerId: MarkerId(place.title),
                        position: place.coordinates,
                        infoWindow: InfoWindow(title: place.title),
                      ),
                    for (var place in widget.routeModel.beach)
                      Marker(
                        onTap: () {
                          _showInfoDialogRouteMdeol(
                            context,
                            widget.routeModel.beach,
                          );
                        },
                        markerId: MarkerId(place.title),
                        position: place.coordinates,
                        infoWindow: InfoWindow(title: place.title),
                      ),
                    for (var place in widget.routeModel.shopping)
                      Marker(
                        onTap: () {
                          _showInfoDialogRouteMdeol(
                            context,

                            widget.routeModel.shopping,
                          );
                        },
                        markerId: MarkerId(place.title),
                        position: place.coordinates,
                        infoWindow: InfoWindow(title: place.title),
                      ),

                    for (var place in widget.routeModel.places)
                      Marker(
                        onTap: () {
                          _showInfoDialog(context, place);
                          print(place.latitudine);
                        },
                        markerId: MarkerId(place.name),
                        position: LatLng(place.latitudine, place.longitudine),
                        infoWindow: InfoWindow(title: place.name),
                      ),
                  },
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(height * 0.02),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildTextlcoationtitle(context, widget.routeModel.name),
                  buildTextlcoatdadsda(context, "Date"),
                  buildHeight(context, 0.01),
                  buildTextDate(
                    context,
                    DateFormat(
                      'yyyy-MM-dd',
                    ).format(DateTime.parse(widget.routeModel.date)),
                  ),
                  buildHeight(context, 0.02),
                  buildTextlcoatdadsda(
                    context,
                    "Approximate time to travel between locations",
                  ),

                  buildHeight(context, 0.01),
                  buildTextDate(context, "4 hours"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showInfoDialog(BuildContext context, Places place) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    showDialog(
      context: context,
      builder:
          (context) => Dialog(
            backgroundColor: Colors.transparent, // Fundal transparent
            insetPadding: EdgeInsets.all(height * 0.1),
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Container(
                  width: width * 0.52, // Ajustează lățimea
                  padding: EdgeInsets.all(height * 0.01),
                  decoration: BoxDecoration(
                    color: kLightBlack,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.all(height * 0.02),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Center(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(16),
                              child: Image.asset(
                                place.image,
                                height: height * 0.11,
                                width: width * 0.42,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(height: 8),
                          buildtextappbar(context, place.name),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
    );
  }

  void _showInfoDialogRouteMdeol(BuildContext context, List<Full> places) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    showDialog(
      context: context,
      builder:
          (context) => Dialog(
            backgroundColor:
                Colors.transparent, // Face fundalul dialogului transparent
            insetPadding: EdgeInsets.all(height * 0.1),
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Container(
                  width: width * 0.52, // Ajustează lățimea după nevoie

                  padding: EdgeInsets.all(height * 0.01),
                  decoration: BoxDecoration(
                    color: kLightBlack,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children:
                          places.isNotEmpty
                              ? places.map((place) {
                                return Padding(
                                  padding: EdgeInsets.all(height * 0.01),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Center(
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(
                                            16,
                                          ),
                                          child: Image.asset(
                                            place.image,
                                            height: height * 0.11,
                                            width: width * 0.42,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 8),
                                      buildtextappbar(context, place.title),
                                    ],
                                  ),
                                );
                              }).toList()
                              : [
                                Center(
                                  child: Text(
                                    "Nicio locație disponibilă",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ],
                    ),
                  ),
                ),
              ],
            ),
          ),
    );
  }
}
