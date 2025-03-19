import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:sanremo_travel/pages/final_page_route.dart';
import 'package:sanremo_travel/pages/utils/base.dart';
import 'package:sanremo_travel/pages/utils/classes.dart';
import 'package:sanremo_travel/pages/utils/colors.dart';
import 'package:sanremo_travel/pages/utils/container.dart';
import 'package:sanremo_travel/pages/utils/provider_app.dart';

class YourOwnPlace extends StatefulWidget {
  final RouteModel routeModel;

  const YourOwnPlace({super.key, required this.routeModel});
  @override
  State<YourOwnPlace> createState() => _YourOwnPlaceState();
}

class _YourOwnPlaceState extends State<YourOwnPlace> {
  File? _image; // Store the selected image

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
    ); // Change to .camera for Camera

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path); // Convert XFile to File
      });
    }
  }

  final TextEditingController _namecontroler = TextEditingController();
  final TextEditingController _namecordonitaes = TextEditingController();

  final TextEditingController _nameclong = TextEditingController();
  final TextEditingController _namelat = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
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
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildTextlcoationtitle(context, "Add your own place"),
                buildHeight(context, 0.02),
                Center(child: Image(image: AssetImage("images/Img.png"))),
                buildHeight(context, 0.02),
                buildContainerPlaces(context),
                buildHeight(context, 0.02),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildContainerPlaces(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(19),
        color: kDarkMidBlack,
      ),
      child: Padding(
        padding: EdgeInsets.all(height * 0.02),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: _pickImage, // Open image picker on tap
              child: Container(
                width: width * 0.26,
                height: height * 0.105,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: kLightBlack, // Replace with kLightBlack if needed
                ),
                child:
                    _image == null
                        ? Center(
                          child: Icon(Icons.photo_camera, color: Colors.white),
                        ) // Default icon
                        : ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.file(
                            _image!,
                            fit:
                                BoxFit
                                    .cover, // Fit the image inside the container
                            width: double.infinity,
                            height: double.infinity,
                          ),
                        ),
              ),
            ),
            buildHeight(context, 0.005),
            buildContainerField(
              context,
              "Name",
              kWhite,
              Colors.white.withOpacity(0.5),
              controller: _namecontroler,
            ),
            buildHeight(context, 0.005),
            buildContainerField(
              context,
              "Latitude",
              kWhite,
              Colors.white.withOpacity(0.5),
              controller: _namelat,
              isNumericOnly: true,
            ),
            buildHeight(context, 0.01),

            buildContainerField(
              context,
              "Longitude",
              kWhite,
              Colors.white.withOpacity(0.5),
              controller: _nameclong,
              isNumericOnly: true,
            ),

            buildHeight(context, 0.01),
            GestureDetector(
              onTap: () {
                // Validate input fields
                if (_image == null ||
                    _namecontroler.text.isEmpty ||
                    _namelat.text.isEmpty ||
                    _nameclong.text.isEmpty) {
                  // Show error message
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        'Please fill all fields before adding to route!',
                      ),
                      backgroundColor: Colors.red,
                    ),
                  );
                  return; // Stop execution if validation fails
                }

                // Create a new place if all fields are filled
                final place = Places(
                  image: _image?.path ?? "",
                  name: _namecontroler.text,
                  coordinates: _namecordonitaes.text,
                  latitudine: double.parse(_namelat.text),
                  longitudine: double.parse(_nameclong.text),
                );

                widget.routeModel.places.add(place);
                final provider = Provider.of<ProviderApp>(
                  context,
                  listen: false,
                );
                // provider.addRouteModel(widget.routeModel);

                // Navigate to the next page
                Navigator.push(
                  context,
                  CupertinoPageRoute(builder: (context) => FinalPageRoute()),
                );
              },
              child: buildContainerAdd(context),
            ),
          ],
        ),
      ),
    );
  }
}
