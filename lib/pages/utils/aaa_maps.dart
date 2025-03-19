import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sanremo_travel/pages/routes_page.dart';
import 'package:sanremo_travel/pages/utils/base.dart';
import 'package:sanremo_travel/pages/utils/classes.dart';
import 'package:sanremo_travel/pages/utils/colors.dart';
import 'package:sanremo_travel/pages/utils/container.dart';
import 'package:table_calendar/table_calendar.dart';

class AaaMaps extends StatefulWidget {
  final RouteModel routeModel;

  const AaaMaps({super.key, required this.routeModel});
  @override
  State<AaaMaps> createState() => _AaaMapsState();
}

class _AaaMapsState extends State<AaaMaps> {
  late DateTime _selectedDay;

  @override
  void initState() {
    super.initState();
    _selectedDay = DateTime.now(); // Inițializează cu ziua curentă
    widget.routeModel.date = _selectedDay.toString();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: kDarkBlack,

      appBar: AppBar(
        leading: buildIconBack(context),
        backgroundColor: kDarkBlack,

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
                buildTextlcoationtitle(context, "Create a route"),
                Center(child: Image(image: AssetImage("images/Img.png"))),
                buildHeight(context, 0.02),
                buildTextMap(context, "Choose a date"),
                buildHeight(context, 0.01),

                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(13),
                    color: kLightBlack,
                  ),
                  width: double.infinity,
                  child: Stack(
                    children: [
                      Container(
                        child: TableCalendar(
                          focusedDay: _selectedDay,
                          firstDay: DateTime.utc(2000, 1, 1),
                          lastDay: DateTime.utc(2100, 12, 31),
                          calendarFormat: CalendarFormat.month,
                          selectedDayPredicate:
                              (day) => isSameDay(_selectedDay, day),
                          onDaySelected: (selectedDay, focusedDay) {
                            setState(() {
                              _selectedDay = selectedDay;
                              widget.routeModel.date = _selectedDay.toString();
                            });
                          },
                          calendarStyle: CalendarStyle(
                            todayTextStyle: TextStyle(
                              fontSize: 20, // Adjust size
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                              fontFamily: "Sf",
                            ),
                            todayDecoration: const BoxDecoration(
                              color: Color.fromARGB(255, 189, 186, 186),
                              shape: BoxShape.circle,
                            ),
                            selectedDecoration: BoxDecoration(
                              color: kYellow,
                              shape: BoxShape.circle,
                            ),
                            selectedTextStyle: const TextStyle(
                              fontSize: 20, // Adjust size
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                              fontFamily: "Sf",
                            ),
                            defaultTextStyle: const TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontFamily: "Sf",
                              fontWeight: FontWeight.w400,
                            ),
                            weekendTextStyle: const TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontFamily: "Sf",
                              fontWeight: FontWeight.w400,
                            ),
                            outsideTextStyle: const TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontFamily: "Sf",
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          daysOfWeekStyle: DaysOfWeekStyle(
                            weekdayStyle: TextStyle(
                              fontSize: 13,
                              color: Color(0xffEBEBF5).withOpacity(0.3),
                              fontFamily: "Sf",

                              fontWeight: FontWeight.w600,
                            ),
                            weekendStyle: TextStyle(
                              fontSize: 13,
                              color: Color(0xffEBEBF5).withOpacity(0.3),
                              fontFamily: "Sf",
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          headerStyle: const HeaderStyle(
                            formatButtonVisible:
                                false, // Remove "2 weeks" button
                            titleCentered:
                                false, // Ensures title is NOT centered
                            leftChevronVisible:
                                false, // Hide default left arrow
                            rightChevronVisible:
                                false, // Hide default right arrow
                            titleTextStyle: TextStyle(
                              color: Colors.transparent,
                            ),
                          ),
                        ),
                      ),

                      // Month name in the top-left corner
                      Positioned(
                        top: 8, // Adjust vertical positioning
                        left: 16, // Align to left

                        child: Text(
                          DateFormat.yMMMM().format(
                            _selectedDay,
                          ), // Format month text
                          style: const TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                            fontFamily: "Montserrat",
                          ),
                        ),
                      ),

                      // Arrows in the top-right corner
                      Positioned(
                        right: 8, // Align to right
                        child: Row(
                          children: [
                            IconButton(
                              icon: Icon(
                                Icons.chevron_left,
                                color: kYellow,
                                size: 30,
                              ),
                              onPressed: () {
                                setState(() {
                                  _selectedDay = DateTime(
                                    _selectedDay.year,
                                    _selectedDay.month - 1,
                                    _selectedDay.day,
                                  );
                                });
                              },
                            ),
                            IconButton(
                              icon: Icon(
                                Icons.chevron_right,
                                color: kYellow,
                                size: 30,
                              ),
                              onPressed: () {
                                setState(() {
                                  _selectedDay = DateTime(
                                    _selectedDay.year,
                                    _selectedDay.month + 1,
                                    _selectedDay.day,
                                  );
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                buildHeight(context, 0.02),
                Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        CupertinoPageRoute(
                          builder:
                              (context) =>
                                  RoutesPage(routeModel: widget.routeModel),
                        ),
                      );
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
}
