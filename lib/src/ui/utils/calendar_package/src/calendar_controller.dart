// CalendarController
import '../calendar_package.dart';

class CalendarController {
  CustomCalendarState? state;

  void bindState(CustomCalendarState state) {
    this.state = state;
  }

  void goToDay(DateTime date) {
    state!.getDate(date);
  }

  void dispose() {
    state = null;
  }

  void openCalendar() {
    state?.showFullCalendar();
  }
}
