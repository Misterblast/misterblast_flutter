import 'package:easy_localization/easy_localization.dart';

String? parseUnixDatetime(int? unixTime, {String? locale}) {
  if (unixTime == null) {
    return null;
  }
  DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(unixTime * 1000);
  // Use 'd MMMM yyyy HH:mm' for full month name, or 'd MMM yyyy HH:mm' for short month
  final formatter = DateFormat('d MMM yyyy HH:mm', locale);
  return formatter.format(dateTime);
}
