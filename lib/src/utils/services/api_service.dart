import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class UserService extends GetxService {
  final String _baseUrl = "https://lock-9d9s.onrender.com/status";

  /// Add a user to the blocked list
  Future<bool> addUser(String userId, String userEmail) async {
    try {
      final response = await http.post(
        Uri.parse("$_baseUrl/pp-update-blocked-users"),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "userId": userId,
          "userEmail": userEmail,
          "action": "add",
          "type": "paypal",
        }),
      );

      if (response.statusCode == 200) {
        return true;
      } else {
        print("Error adding user: ${response.body}");
        return false;
      }
    } catch (e) {
      print("Exception in addUser: $e");
      return false;
    }
  }

  /// Remove a user (sets `isActive: false`)
  Future<bool> updateUser(String userId, String userEmail) async {
    try {
      final response = await http.post(
        Uri.parse("$_baseUrl/pp-update-blocked-users"),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "userId": userId,
          "userEmail": userEmail,
          "action": "remove",
        }),
      );

      if (response.statusCode == 200) {
        return true;
      } else {
        print("Error updating user: ${response.body}");
        return false;
      }
    } catch (e) {
      print("Exception in updateUser: $e");
      return false;
    }
  }

  /// Check if a user exists and is active
  Future<bool> checkUserStatus(String userId) async {
    try {
      final response = await http.post(
        Uri.parse("$_baseUrl/check-user-status"),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({"userId": userId}),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return data['isActive'] == true;
      } else {
        print("Error checking user status: ${response.body}");
        return false;
      }
    } catch (e) {
      print("Exception in checkUserStatus: $e");
      return false;
    }
  }

  Future<bool?> checkAppStatus() async {
    try {
      final response = await http.get(Uri.parse("$_baseUrl/pp-status"));
      print(response.body);
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return data["isAppBlocked"] == false;
      }
    } catch (e) {
      print("Error fetching app status: $e");
    }
    return null; // Handle errors gracefully
  }
}
