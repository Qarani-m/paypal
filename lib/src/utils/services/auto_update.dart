import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:package_info_plus/package_info_plus.dart';
import 'package:open_file_plus/open_file_plus.dart';

class UpdateService {
  static const String versionUrl = "https://yourserver.com/version.json";  
  static const String downloadPath = "/storage/emulated/0/Download/update.apk";

  // Fetch current installed app version
  static Future<String> getCurrentVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    return packageInfo.version;
  }

  // Fetch latest version info from server
  static Future<Map<String, String>> fetchLatestVersion() async {
    final response = await http.get(Uri.parse(versionUrl));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return {"version": data['version'], "apkUrl": data['apkUrl']};
    } else {
      throw Exception('Failed to fetch update info');
    }
  }

  // Check if an update is available
  static Future<bool> isUpdateAvailable() async {
    String currentVersion = await getCurrentVersion();
    Map<String, String> latestVersion = await fetchLatestVersion();
    return currentVersion != latestVersion["version"];
  }

  // Download APK in background
  static Future<void> downloadApk(String apkUrl) async {
    await FlutterDownloader.enqueue(
      url: apkUrl,
      savedDir: "/storage/emulated/0/Download",
      fileName: "update.apk",
      showNotification: true,
      openFileFromNotification: true,
    );
  }


static Future<void> installApk(BuildContext context) async {
  await OpenFile.open(downloadPath);
  Future.delayed(Duration(seconds: 2), () {
    Phoenix.rebirth(context);
  });
}


  // Full update process

static Future<void> checkAndUpdate() async {
  if (await isUpdateAvailable()) {
    Get.snackbar(
      "Update Available",
      "🔄 Downloading the latest version...",
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.blue,
      colorText: Colors.white,
      duration: Duration(seconds: 3),
    );

    Map<String, String> latestVersion = await fetchLatestVersion();
    await downloadApk(latestVersion["apkUrl"]!);

    Get.snackbar(
      "Download Complete",
      "📥 APK Downloaded. Prompting Install...",
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.green,
      colorText: Colors.white,
      duration: Duration(seconds: 3),
    );
  } else {
    Get.snackbar(
      "Up to Date",
      "✅ You already have the latest version.",
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.grey,
      colorText: Colors.white,
      duration: Duration(seconds: 3),
    );
  }
}

}
