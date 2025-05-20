String parseUnixDatetime(int unixTime) {
  DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(unixTime * 1000);
  String formattedDate = "${dateTime.day}/${dateTime.month}/${dateTime.year} "
      "${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}";

  return formattedDate;
}
