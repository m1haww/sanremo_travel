import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sanremo_travel/pages/utils/base.dart';
import 'package:sanremo_travel/pages/utils/classes.dart';
import 'package:sanremo_travel/pages/utils/colors.dart';
import 'package:sanremo_travel/pages/utils/container.dart';

class LocationInfo extends StatefulWidget {
  final Full item;

  const LocationInfo({
    super.key,
    required this.item,
  }); // Make sure the passed item is of type Atractions, Restaurants, etc.

  @override
  State<LocationInfo> createState() => _LocationInfoState();
}

class _LocationInfoState extends State<LocationInfo> {
  final TextEditingController _viewController = TextEditingController();
  int _selectedStars = 0;

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
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Image(
                    image: AssetImage(widget.item.image), // Corrected usage
                    height: height * 0.25,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                buildHeight(context, 0.01),
                buildTextlcoationtitle(
                  context,
                  widget.item.title,
                ), // Corrected usage
                buildHeight(context, 0.02),
                buildTextlcoation(context, "Local"),
                buildHeight(context, 0.01),
                buildTextlcoationAlfa(
                  context,
                  widget.item.local,
                ), // Corrected usage
                buildHeight(context, 0.02),
                buildTextlcoation(context, "Description"),
                buildHeight(context, 0.01),
                buildTextlcoationAlfa(context, widget.item.description),

                buildHeight(context, 0.02),
                buildTextlcoation(context, "History"),
                buildHeight(context, 0.01),
                buildTextlcoationAlfa(
                  context,
                  widget.item.history,
                ), // Corrected usage
                buildHeight(context, 0.02),
                buildTextlcoation(context, "Interesting fact"),
                buildHeight(context, 0.01),
                buildTextlcoationAlfa(
                  context,
                  widget.item.fact,
                ), // Corrected usage
                buildHeight(context, 0.015),
                Divider(color: kYellow, thickness: 1),
                buildTextReview(context, "Reviews"),
                buildHeight(context, 0.01),
                buildReviewContainer(context),
                Divider(color: kYellow, thickness: 1),
                buildTextReview(context, "Add your rating and review!"),
                buildHeight(context, 0.01),
                buildStarRating(),
                buildHeight(context, 0.01),
                buildFIELDREVIEW(
                  context,
                  "Add your review ...",
                  controller: _viewController,
                ),
                buildHeight(context, 0.005),
                GestureDetector(
                  onTap: submitReview,
                  child: buildcontainerSumbit(context, "Submit review"),
                ),
                buildHeight(context, 0.05),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildStarRating() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(
        5,
        (index) => GestureDetector(
          onTap: () {
            setState(() {
              _selectedStars = index + 1;
            });
          },
          child: Icon(
            Icons.star,
            color: index < _selectedStars ? Color(0xffFFE838) : Colors.grey,
            size: 45,
          ),
        ),
      ),
    );
  }

  Widget buildReviewContainer(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return widget.item.review.isEmpty
        ? Container(
          width: width * 0.65,
          height: height * 0.11,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(70),
            color: kLightBlack,
          ),
          child: Center(
            child: Text(
              "No reviews submitted yet.",
              style: TextStyle(
                fontSize: 16,
                color: Colors.white.withOpacity(0.5),
              ),
              textAlign: TextAlign.center,
            ),
          ),
        )
        : Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:
              widget.item.review
                  .map((review) => buildReviewTile(review))
                  .toList(),
        );
  }

  Widget buildReviewTile(Review review) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(35),
          color: kLightBlack,
        ),
        child: Padding(
          padding: EdgeInsets.all(height * 0.019),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  ...List.generate(
                    review.starcount,
                    (index) =>
                        Icon(Icons.star, color: Color(0xffFFE838), size: 20),
                  ),
                ],
              ),
              buildHeight(context, 0.01),
              Text(review.text, style: TextStyle(fontSize: 16, color: kWhite)),
              buildHeight(context, 0.015),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Guest",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white.withOpacity(0.5),
                      fontWeight: FontWeight.w400,
                      fontFamily: "Inter",
                    ),
                  ),
                  Spacer(),
                  Text(
                    review.date_time,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white.withOpacity(0.5),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void submitReview() {
    if (_viewController.text.trim().isEmpty || _selectedStars == 0) {
      // Show a message to let the user know they need to fill the fields
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Please fill in both the review text and rating.',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.red,
        ),
      );
    } else {
      // Proceed with submitting the review if fields are filled
      final String formattedDate = DateFormat(
        'yyyy-MM-dd HH:mm:ss',
      ).format(DateTime.now());

      setState(() {
        List<Review> updatedReviews = List.from(widget.item.review);
        updatedReviews.add(
          Review(
            starcount: _selectedStars,
            text: _viewController.text.trim(),
            date_time: formattedDate,
          ),
        );

        widget.item.review = updatedReviews;

        _viewController.clear();
        _selectedStars = 0;
      });

      // Show a dialog or alert that submission is successful
      showAlertDialog(context);
    }
  }

  Widget buildFIELDREVIEW(
    BuildContext context,
    String text, {
    required TextEditingController controller,
  }) {
    final height = MediaQuery.of(context).size.height;

    return Container(
      width: double.infinity,
      height: height * 0.13,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(35),
        color: kLightBlack,
      ),
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.multiline,
        maxLines: null,
        expands: true,
        decoration: InputDecoration(
          hintText: text,
          hintStyle: TextStyle(
            fontFamily: "Inter",
            fontWeight: FontWeight.w400,
            fontSize: 16,
            color: Colors.white.withOpacity(0.5),
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 12,
          ),
          border: InputBorder.none,
        ),
        style: TextStyle(
          fontFamily: "Inter",
          fontWeight: FontWeight.w400,
          fontSize: 16,
          color: kWhite,
        ),
        cursorColor: Colors.white,
      ),
    );
  }
}
