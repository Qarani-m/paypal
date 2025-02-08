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
  try {
    if (number is String) {
      // Return default for empty or invalid strings
      if (number.trim().isEmpty) return '0.00';
      number = double.tryParse(number) ?? 0.0;
    }

    if (number is! num) return '0.00';

    final formatter = NumberFormat('#,##0.00');
    return formatter.format(number);
  } catch (e) {
    return '0.00'; // Fallback in case of any error
  }
}

  String obfuscatePhoneNumber(String phoneNumber) {


print('=======================${phoneNumber.trim().length}');


    if (phoneNumber.trim().length < 10 ) {
      throw ArgumentError(
          'Invalid phone number format. Must be 10 digits starting with "07".');
    }

return !phoneNumber.startsWith('07') 
    ? '${phoneNumber.substring(0, 4)}** **${phoneNumber.substring(phoneNumber.length - 3)}'
    : '${phoneNumber.substring(1, 2)}** **${phoneNumber.substring(6)}';


  }
}
