import 'package:intl/intl.dart';

String getFullDate (String? date) {
  if(date == null || date == ""){
    return "";
  }
  DateTime parsedDate = DateTime.parse(date);
  return DateFormat('yyyy年M月d日').format(parsedDate);
}
String getYearAndMonth (String? date) {
  if(date == null || date == ""){
    return "";
  }
  DateTime parsedDate = DateTime.parse(date);
  return DateFormat('yyyy年M月').format(parsedDate);
}