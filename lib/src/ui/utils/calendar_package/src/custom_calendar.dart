import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:money_controller/src/ui/themes/themes.dart';
import 'package:money_controller/src/ui/utils/date_formatter.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../calendar_package.dart';
import 'full_calendar.dart';

class CustomCalendar extends StatefulWidget implements PreferredSizeWidget {
  // Calendar controller variables
  final CalendarController? controller;
  final FullCalendarScroll fullCalendarScroll;
  final List<DateTime>? events;

  // DateTime variables
  final DateTime initialDate;
  final DateTime firstDate;
  final DateTime lastDate;
  final Function onDateSelected;

  // Design variables
  final bool appbar;
  final Widget? leading;
  final double? padding;
  final double leftMargin;
  final Color? dateColor;
  final Color? backgroundColor;
  final Color? selectedDateColor;
  final Color? unselectedDateColor;
  final Color? calendarEventSelectedColor;
  final Color? calendarEventColor;
  final Color? fullCalendarBackgroundColor;
  final Widget? calendarLogo;
  final Widget? selectedDayLogo;
  final Widget? eventIcon;
  final Widget? selectedEventIcon;
  final Decoration? decoration;
  final Decoration? selectedDecoration;

  // Use calendar variables
  final bool? fullCalendar;
  final String? locale;
  final WeekDay weekDay;
  final WeekDay fullCalendarDay;
  final SelectedDayPosition selectedDayPosition;

  CustomCalendar({
    Key? key,
    required this.initialDate,
    required this.firstDate,
    required this.lastDate,
    required this.onDateSelected,
    this.eventIcon,
    this.selectedEventIcon,
    this.decoration,
    this.selectedDecoration,
    this.controller,
    this.backgroundColor,
    this.dateColor = white,
    this.selectedDateColor = black,
    this.unselectedDateColor = white,
    this.calendarEventSelectedColor = white,
    this.calendarEventColor = blue500,
    this.fullCalendarBackgroundColor = grey200,
    this.calendarLogo,
    this.selectedDayLogo,
    this.locale = 'en',
    this.padding,
    this.leading,
    this.appbar = false,
    this.events,
    this.fullCalendar = true,
    this.leftMargin = 0,
    this.fullCalendarScroll = FullCalendarScroll.vertical,
    this.fullCalendarDay = WeekDay.short,
    this.weekDay = WeekDay.short,
    this.selectedDayPosition = SelectedDayPosition.left,
    //TODO: change to translations file
  })  : assert(
          initialDate.difference(firstDate).inDays >= 0,
          'initialDate must be on or after firstDate',
        ),
        assert(
          !initialDate.isAfter(lastDate),
          'initialDate must be on or before lastDate',
        ),
        assert(
          !firstDate.isAfter(lastDate),
          'lastDate must be on or after firstDate',
        ),
        super(key: key);

  @override
  CustomCalendarState createState() => CustomCalendarState();

  @override
  Size get preferredSize => const Size.fromHeight(250.0);
}

class CustomCalendarState extends State<CustomCalendar>
    with TickerProviderStateMixin {
  final ItemScrollController _scrollController = ItemScrollController();

  late Color backgroundColor;
  late double padding;
  late Widget leading;
  late double _scrollAlignment;

  int? _daySelectedIndex;
  DateTime? _selectedDate;
  List<DateTime> _dates = [];
  final List<String> _eventDates = [];

  String get _locale =>
      widget.locale ?? Localizations.localeOf(context).languageCode;

  @override
  void initState() {
    super.initState();
    initializeDateFormatting(_locale);
    _initCalendar();
    padding = widget.padding ?? 25.0;
    leading = widget.leading ?? Container();
    _scrollAlignment = widget.leftMargin / 440;

    if (widget.events != null) {
      for (var event in widget.events!) {
        _eventDates.add(event.toString().split(" ").first);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    backgroundColor = widget.backgroundColor ?? Theme.of(context).primaryColor;

    Widget dayList() {
      return Container(
        width: MediaQuery.of(context).size.width,
        height: widget.appbar ? 125 : 120,
        padding: const EdgeInsets.all(5.0),
        alignment: Alignment.bottomCenter,
        child: ScrollablePositionedList.builder(
          padding: _dates.length < 5
              ? EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width *
                      (5 - _dates.length) /
                      10)
              : const EdgeInsets.symmetric(horizontal: 10.0),
          initialScrollIndex: _daySelectedIndex ?? 0,
          initialAlignment:
              widget.selectedDayPosition == SelectedDayPosition.center
                  ? 78 / 200
                  : _scrollAlignment,
          reverse: widget.selectedDayPosition == SelectedDayPosition.left
              ? false
              : true,
          scrollDirection: Axis.horizontal,
          itemScrollController: _scrollController,
          physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics(),
          ),
          itemCount: _dates.length,
          itemBuilder: (context, index) {
            DateTime date = _dates[index];
            bool isSelected = _daySelectedIndex == index;

            return Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 5.0,
                  horizontal: 5.0,
                ),
                child: GestureDetector(
                  onTap: () => _goToActualDay(index),
                  child: Container(
                    height: 120.0,
                    width: (widget.weekDay == WeekDay.long)
                        ? MediaQuery.of(context).size.width / 5 - 10
                        : MediaQuery.of(context).size.width / 7 - 10,
                    decoration: isSelected && widget.selectedDecoration != null
                        ? widget.selectedDecoration!
                        : !isSelected && widget.decoration != null
                            ? widget.decoration!
                            : BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: isSelected ? white : null,
                                boxShadow: [
                                  isSelected
                                      ? BoxShadow(
                                          color: black.withOpacity(0.2),
                                          spreadRadius: 1,
                                          blurRadius: 10,
                                          offset: const Offset(0, 3),
                                        )
                                      : BoxShadow(
                                          color: greyColors.withOpacity(0.0),
                                          spreadRadius: 5,
                                          blurRadius: 20,
                                          offset: const Offset(0, 3),
                                        ),
                                ],
                              ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(height: 12.0),
                        Text(
                          DateFormat("dd").format(date),
                          style: isSelected
                              ? TypographyStyle.h9
                                  .copyWith(color: widget.selectedDateColor)
                              : TypographyStyle.h9.w500
                                  .copyWith(color: widget.unselectedDateColor),
                        ),
                        Text(
                          widget.weekDay == WeekDay.long
                              ? DateFormat.EEEE(Locale(_locale).toString())
                                  .format(date)
                              : DateFormat.E(Locale(_locale).toString())
                                  .format(date),
                          style: isSelected
                              ? TypographyStyle.overline
                                  .copyWith(color: widget.selectedDateColor)
                              : TypographyStyle.overline.w400
                                  .copyWith(color: widget.unselectedDateColor),
                        ),
                        const Spacer(),
                        _eventDates.contains(date.toString().split(" ").first)
                            ? isSelected && widget.selectedEventIcon != null
                                ? widget.selectedEventIcon!
                                : !isSelected && widget.eventIcon != null
                                    ? widget.eventIcon!
                                    : const SizedBox(height: 5.0)
                            : const SizedBox(height: 5.0),
                        const Spacer(),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      );
    }

    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: widget.appbar ? 210 : 120.0,
      child: Stack(
        children: [
          Positioned(
            top: 0.0,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 190.0,
              color: backgroundColor,
            ),
          ),
          Positioned(
            bottom: 0.0,
            child: dayList(),
          ),
        ],
      ),
    );
  }

  void _generateDates() {
    _dates.clear();

    DateTime first = DateFormatter.formatByTimeHour(widget.firstDate, '00');
    DateTime last = DateFormatter.formatByTimeHour(widget.lastDate, '23');
    DateTime basicDate = DateFormatter.basicDate(widget.firstDate);

    List<DateTime> listDates = List.generate(
      (last.difference(first).inHours / 24).round(),
      (index) => basicDate.add(Duration(days: index)),
    );

    widget.selectedDayPosition == SelectedDayPosition.left
        ? listDates.sort((b, a) => b.compareTo(a))
        : listDates.sort((b, a) => a.compareTo(b));

    setState(() {
      _dates = listDates;
    });
  }

  void showFullCalendar() {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: widget.fullCalendarBackgroundColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.0),
          topRight: Radius.circular(30.0),
        ),
      ),
      builder: (BuildContext context) {
        double height;
        DateTime? endDate = widget.lastDate;

        if (widget.firstDate.year == endDate.year &&
            widget.firstDate.month == endDate.month) {
          height = ((MediaQuery.of(context).size.width - 2 * padding) / 7) * 5 +
              150.0;
        } else {
          height = (MediaQuery.of(context).size.height - 100.0);
        }
        return SizedBox(
          height: widget.fullCalendarScroll == FullCalendarScroll.vertical
              ? height
              : (MediaQuery.of(context).size.height / 7) * 4.3,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 20.0),
              Container(
                width: 60,
                height: 6,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(3.0),
                  color: const Color(0xFFE0E0E0),
                ),
              ),
              const SizedBox(height: 20.0),
              Expanded(
                child: FullCalendar(
                  startDate: widget.firstDate,
                  endDate: endDate,
                  padding: padding,
                  dateColor: widget.dateColor,
                  dateSelectedBackgroundColor: widget.calendarEventColor,
                  dateSelectedColor: widget.calendarEventSelectedColor,
                  events: _eventDates,
                  selectedDate: _selectedDate,
                  fullCalendarDay: widget.fullCalendarDay,
                  calendarScroll: widget.fullCalendarScroll,
                  calendarBackground: widget.calendarLogo,
                  locale: widget.locale,
                  onDateChange: (value) {
                    getDate(value);
                    Navigator.pop(context);
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _selectedDay() {
    DateTime getSelected = DateTime.parse(
        "${_selectedDate.toString().split(" ").first} 00:00:00.000");

    _daySelectedIndex = _dates.indexOf(_dates.firstWhere((dayDate) =>
        DateTime.parse("${dayDate.toString().split(" ").first} 00:00:00.000") ==
        getSelected));
  }

  void _goToActualDay(int index) {
    _moveToDayIndex(index);
    setState(() {
      _daySelectedIndex = index;
      _selectedDate = _dates[index];
    });
    widget.onDateSelected(_selectedDate);
  }

  void _moveToDayIndex(int index) {
    _scrollController.scrollTo(
      index: index,
      alignment: widget.selectedDayPosition == SelectedDayPosition.center
          ? 78 / 200
          : _scrollAlignment,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  void getDate(DateTime value) {
    setState(() {
      _selectedDate = value;
    });
    _selectedDay();
    _goToActualDay(_daySelectedIndex!);
  }

  void _initCalendar() {
    if (widget.controller != null && widget.controller is CalendarController) {
      widget.controller!.bindState(this);
    }
    _selectedDate = widget.initialDate;
    _generateDates();
    _selectedDay();
  }
}
