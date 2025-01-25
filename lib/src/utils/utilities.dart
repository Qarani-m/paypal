import 'package:intl/intl.dart';

class AppUtilities {
  String formatDateDateFirst(String date) {
    final DateTime dt = DateTime.parse(date);
    final List<String> months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec'
    ];
    return '${dt.day} ${months[dt.month - 1]}';
  }

  String formatDateMonthFirst(String date) {
    final DateTime dt = DateTime.parse(date);
    final List<String> months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec'
    ];
    return '${months[dt.month - 1]} ${dt.day}';
  }

  String getInitials(String fullName) {
    final names = fullName.trim().split(' ');
    if (names.length == 1) return names[0][0].toUpperCase();
    return '${names[0][0]}${names[names.length - 1][0]}'.toUpperCase();
  }

  String formatDateLong(String date) {
    final DateTime dt = DateTime.parse(date);
    final DateFormat formatter = DateFormat('MMM d, yyyy');
    return formatter.format(dt);
  }

  String formatNumber(dynamic number) {
    if (number is String) {
      number = double.parse(number);
    }

    final formatter = NumberFormat('#,##0.00');
    return formatter.format(number);
  }

String obfuscatePhoneNumber(String phoneNumber) {
  if (phoneNumber.length != 10 || !phoneNumber.startsWith('07')) {
    throw ArgumentError('Invalid phone number format. Must be 10 digits starting with "07".');
  }
  return '${phoneNumber.substring(1, 2)}** **${phoneNumber.substring(6)}';
}





}
