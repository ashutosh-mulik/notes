
import 'package:intl/intl.dart';

String getTitleForCard(String title){
  if(title.length > 100) {
    return "${title.substring(0, 100)}...";
  }
  return title;
}

String getCustomFormatDate(String date){
  return DateFormat("yMMMMd").format(DateTime.parse(date).toLocal());
}
