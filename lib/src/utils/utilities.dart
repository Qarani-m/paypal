class AppUtilities{

  String formatDate(String date) {
 final DateTime dt = DateTime.parse(date);
 final List<String> months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
 return '${dt.day} ${months[dt.month - 1]}';
}
}