import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:money_controller/src/ui/themes/themes.dart';
import 'package:money_controller/src/ui/utils/date_formatter.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../calendar_package.dart';

class FullCalendar extends StatefulWidget {
  const FullCalendar({
    super.key,
    required this.startDate,
    this.endDate,
    this.selectedDate,
    this.dateColor,
    this.dateSelectedColor,
    this.dateSelectedBackgroundColor,
    this.padding,
    this.locale,
    this.fullCalendarDay,
    this.calendarScroll,
    this.calendarBackground,
    this.events,
    required this.onDateChange,
  });

  final DateTime startDate;
  final DateTime? endDate;
  final DateTime? selectedDate;
  final Color? dateColor;
  final Color? dateSelectedColor;
  final Color? dateSelectedBackgroundColor;
  final double? padding;
  final String? locale;
  final WeekDay? fullCalendarDay;
  final FullCalendarScroll? calendarScroll;
  final Widget? calendarBackground;
  final List<String>? events;
  final Function onDateChange;

  @override
  State<FullCalendar> createState() => _FullCalendarState();
}

class _FullCalendarState extends State<FullCalendar> {
  // Datess
  late DateTime startDate;
  late DateTime endDate;

  // Page controllers
  late int _initialPage;
  late PageController _horizontalScroll;

  List<String>? _events = [];

  @override
  void initState() {
    setState(() {
      startDate = DateFormatter.formatByTimeHour(widget.startDate, '00');
      endDate = DateFormatter.formatByTimeHour(widget.startDate, '23');

      _events = widget.events;
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<String> partsStart = startDate.toString().split(" ").first.split("-");

    DateTime firstDate = DateTime.parse(
        "${partsStart.first}-${partsStart[1].padLeft(2, '0')}-01 00:00:00.000");

    List<String> partsEnd = endDate.toString().split(" ").first.split("-");

    DateTime lastDate = DateTime.parse(
            "${partsEnd.first}-${(int.parse(partsEnd[1]) + 1).toString().padLeft(2, '0')}-01 23:00:00.000")
        .subtract(const Duration(days: 1));

    double width = MediaQuery.of(context).size.width - (2 * widget.padding!);

    List<DateTime?> dates = [];

    DateTime referenceDate = firstDate;

    while (referenceDate.isBefore(lastDate)) {
      List<String> referenceParts = referenceDate.toString().split(" ");
      DateTime newDate = DateTime.parse("${referenceParts.first} 12:00:00.000");
      dates.add(newDate);

      referenceDate = newDate.add(const Duration(days: 1));
    }

    if (firstDate.year == lastDate.year && firstDate.month == lastDate.month) {
      return Padding(
        padding: EdgeInsets.fromLTRB(
          widget.padding!,
          40.0,
          widget.padding!,
          0.0,
        ),
        child: month(
          dates: dates,
          width: width,
          locale: widget.locale,
          weekday: widget.fullCalendarDay,
        ),
      );
    } else {
      List<DateTime?> months = [];
      for (int i = 0; i < dates.length; i++) {
        if (i == 0 || (dates[i]!.month != dates[i - 1]!.month)) {
          months.add(dates[i]);
        }
      }

      months.sort((b, a) => a!.compareTo(b!));

      final index = months.indexWhere((element) =>
          element!.month == widget.selectedDate!.month &&
          element.year == widget.selectedDate!.year);

      _initialPage = index;
      _horizontalScroll = PageController(initialPage: _initialPage);

      return Container(
        padding: const EdgeInsets.fromLTRB(25, 10.0, 25, 20.0),
        child: widget.calendarScroll == FullCalendarScroll.horizontal
            ? Stack(
                children: [
                  Opacity(
                    opacity: 0.2,
                    child: Center(child: widget.calendarBackground),
                  ),
                  PageView.builder(
                    physics: const BouncingScrollPhysics(),
                    controller: _horizontalScroll,
                    reverse: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: months.length,
                    itemBuilder: (context, index) {
                      DateTime? date = months[index];
                      List<DateTime?> daysOfMonth = [];
                      for (var item in dates) {
                        if (date!.month == item!.month &&
                            date.year == item.year) {
                          daysOfMonth.add(item);
                        }
                      }

                      bool isLast = index == 0;

                      return Container(
                        padding: EdgeInsets.only(bottom: isLast ? 0.0 : 10.0),
                        child: month(
                          dates: daysOfMonth,
                          width: width,
                          locale: widget.locale,
                          weekday: widget.fullCalendarDay,
                        ),
                      );
                    },
                  ),
                  Positioned(
                    bottom: 0,
                    width: MediaQuery.of(context).size.width * 0.88,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () {
                            _horizontalScroll.nextPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.ease,
                            );
                          },
                          icon: const Icon(Icons.arrow_back),
                        ),
                        IconButton(
                          onPressed: () {
                            _horizontalScroll.previousPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.ease,
                            );
                          },
                          icon: const Icon(Icons.arrow_forward),
                        ),
                      ],
                    ),
                  )
                ],
              )
            : Stack(
                children: [
                  Opacity(
                    opacity: 0.2,
                    child: Center(child: widget.calendarBackground),
                  ),
                  ScrollablePositionedList.builder(
                    initialScrollIndex: index,
                    itemCount: months.length,
                    reverse: true,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      DateTime? date = months[index];
                      List<DateTime?> daysOfMonth = [];
                      for (var item in dates) {
                        if (date!.month == item!.month &&
                            date.year == item.year) {
                          daysOfMonth.add(item);
                        }
                      }

                      bool isLast = index == 0;

                      return Container(
                        padding: EdgeInsets.only(bottom: isLast ? 0.0 : 25.0),
                        child: month(
                          dates: daysOfMonth,
                          width: width,
                          locale: widget.locale,
                          weekday: widget.fullCalendarDay,
                        ),
                      );
                    },
                  ),
                ],
              ),
      );
    }
  }

  Widget daysOfWeek({
    required double width,
    String? locale,
    WeekDay? weekday,
  }) {
    List daysNames = [];
    for (var day = 12; day <= 18; day++) {
      weekday == WeekDay.long
          ? daysNames.add(DateFormat.EEEE(locale.toString())
              .format(DateTime.parse('1970-01-$day')))
          : daysNames.add(DateFormat.E(locale.toString())
              .format(DateTime.parse('1970-01-$day')));
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        dayName(width / 7, daysNames[0]),
        dayName(width / 7, daysNames[1]),
        dayName(width / 7, daysNames[2]),
        dayName(width / 7, daysNames[3]),
        dayName(width / 7, daysNames[4]),
        dayName(width / 7, daysNames[5]),
        dayName(width / 7, daysNames[6]),
      ],
    );
  }

  Widget dayName(double width, String text) {
    return Container(
      width: width,
      alignment: Alignment.center,
      child: Text(
        text,
        style: TypographyStyle.overline.w700,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  Widget dateInCalendar({
    required double width,
    required DateTime date,
    required bool outOfRange,
    required bool event,
  }) {
    bool isSelectedDate = date.toString().split(" ").first ==
        widget.selectedDate.toString().split(" ").first;
    return GestureDetector(
      onTap: () => outOfRange ? null : widget.onDateChange(date),
      child: Container(
        width: width / 7,
        height: width / 7,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color:
              isSelectedDate ? widget.dateSelectedBackgroundColor : transparent,
        ),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 5.0),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: Text(
                DateFormat("dd").format(date),
                style: TextStyle(
                  color: outOfRange
                      ? isSelectedDate
                          ? widget.dateSelectedColor!.withOpacity(0.9)
                          : widget.dateColor!.withOpacity(0.4)
                      : isSelectedDate
                          ? widget.dateSelectedColor
                          : widget.dateColor,
                ),
              ),
            ),
            event
                ? Container(
                    width: 5.0,
                    height: 5.0,
                    decoration: BoxDecoration(
                      color: isSelectedDate
                          ? widget.dateSelectedColor!.withOpacity(0.9)
                          : widget.dateSelectedBackgroundColor,
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  )
                : const SizedBox(height: 5.0),
          ],
        ),
      ),
    );
  }

  Widget month({
    required List dates,
    required double width,
    String? locale,
    WeekDay? weekday,
  }) {
    DateTime first = dates.first;
    while (DateFormat("E").format(dates.first) != "Mon") {
      dates.add(dates.first.subtract(const Duration(days: 1)));
      dates.sort();
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          DateFormat.yMMMM(Locale(locale!).toString()).format(first),
          style: TypographyStyle.b3.w700.copyWith(color: widget.dateColor),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 30.0),
          child: daysOfWeek(
            width: width,
            locale: widget.locale,
            weekday: widget.fullCalendarDay,
          ),
        ),
        Container(
          padding: const EdgeInsets.only(top: 10.0),
          height: dates.length > 28
              ? dates.length > 35
                  ? 6.2 * width / 7
                  : 5.2 * width / 7
              : 4 * width / 7,
          width: MediaQuery.of(context).size.width - 2 * widget.padding!,
          child: GridView.builder(
            itemCount: dates.length,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 7,
            ),
            itemBuilder: (context, index) {
              DateTime date = dates[index];

              bool outOfRange =
                  date.isBefore(startDate) || date.isAfter(endDate);

              if (date.isBefore(first)) {
                return Container(
                  width: width / 7,
                  height: width / 7,
                  color: transparent,
                );
              } else {
                return dateInCalendar(
                  width: width,
                  date: date,
                  outOfRange: outOfRange,
                  event: _events!.contains(date.toString().split(" ").first) &&
                      !outOfRange,
                );
              }
            },
          ),
        )
      ],
    );
  }
}
