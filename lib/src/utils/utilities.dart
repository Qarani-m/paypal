class AppUtilities{

  String formatDateDateFirst(String date) {
 final DateTime dt = DateTime.parse(date);
 final List<String> months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
 return '${dt.day} ${months[dt.month - 1]}';
}

String formatDateMonthFirst(String date) {
 final DateTime dt = DateTime.parse(date);
 final List<String> months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
 return '${months[dt.month - 1]} ${dt.day}';
}

String getInitials(String fullName) {
 final names = fullName.trim().split(' ');
 if (names.length == 1) return names[0][0].toUpperCase();
 return '${names[0][0]}${names[names.length-1][0]}'.toUpperCase();
}
}