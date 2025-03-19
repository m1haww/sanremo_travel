import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sanremo_travel/pages/utils/aaa_maps.dart';
import 'package:sanremo_travel/pages/utils/base.dart';
import 'package:sanremo_travel/pages/utils/classes.dart';
import 'package:sanremo_travel/pages/utils/colors.dart';
import 'package:sanremo_travel/pages/utils/container.dart';
import 'package:sanremo_travel/pages/utils/provider_app.dart';

class MapsInfo extends StatefulWidget {
  const MapsInfo({super.key});

  @override
  State<MapsInfo> createState() => _MapsInfoState();
}

class _MapsInfoState extends State<MapsInfo> {
  bool save = false;
  @override
  void initState() {
    super.initState();
    _controllerroute.addListener(_updateSaveButtonState);
  }

  @override
  void dispose() {
    _controllerroute.dispose();

    super.dispose();
  }

  void _updateSaveButtonState() {
    setState(() {
      save = _controllerroute.text.isNotEmpty;
    });
  }

  TextEditingController _controllerroute = TextEditingController();
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildTextlcoationtitle(context, "Create a route"),
              Center(child: Image(image: AssetImage("images/Img.png"))),
              buildContainerField(
                context,
                "Route name",
                kWhite,
                Colors.white.withOpacity(0.5),
                controller: _controllerroute,
              ),
              Spacer(),
              Align(
                alignment: Alignment.bottomRight,
                child: GestureDetector(
                  onTap: () {
                    if (_controllerroute.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Please complete all fields."),
                          backgroundColor: Colors.red,
                        ),
                      );
                    } else {
                      // If the input is valid, proceed with saving
                      final provider = Provider.of<ProviderApp>(
                        context,
                        listen: false,
                      );

                      // Create a RouteModel instance
                      final route = RouteModel(
                        name: _controllerroute.text,
                        date: "date",
                      );

                      Navigator.push(
                        context,
                        CupertinoPageRoute(
                          builder: (context) => AaaMaps(routeModel: route),
                        ),
                      );

                      provider.addRouteModel(route);
                    }
                  },
                  child: buildcontainerSumbit3(context, "Done"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
