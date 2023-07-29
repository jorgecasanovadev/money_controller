class DateFormatter {
  static DateTime formatByTimeHour(DateTime dateTime, String timeHour) {
    return DateTime.parse(
      '${dateTime.toString().split(" ").first} $timeHour:00:00.000',
    );
  }

  static DateTime basicDate(DateTime dateTime) {
    return DateTime.parse(
      '${formatByTimeHour(dateTime, '00').toString().split(" ").first} 12:00:00',
    );
  }

  // DateTime first = DateTime.parse(
  //     "${widget.firstDate.toString().split(" ").first} 00:00:00.000");

  // DateTime last = DateTime.parse(
  //     "${widget.lastDate.toString().split(" ").first} 23:00:00.000");

  // DateTime basicDate =
  //     DateTime.parse("${first.toString().split(" ").first} 12:00:00.000");
}
