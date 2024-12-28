import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import '../api/end_ponits.dart';
import '../constants/constants.dart';

class InternetController extends ChangeNotifier {
  bool _isLoading = false;
  static Future<bool> hasGlobalNetwork() async {
    try {
      final result = await InternetAddress.lookup('example.com');
      return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } on SocketException catch (_) {
      return false;
    }
  }

  ///checks for global network using hasGloblaNetwork function and then checks for server connection
  static Future<bool> hasNetwork() async {
    try {
      if (!await InternetController.hasGlobalNetwork()) {
        return false;
      }
      // print("connected to global netowrk ");

      var url = "${ApiConstants.baseUrl}/";
      var res = await http.get(Uri.parse(url), headers: {
        "Access-Control_Allow_Origin": "*"
      }).timeout(const Duration(seconds: Constants.TIMEOUT_SECONDS));
      return res.statusCode == 200;
    } on Exception {
      return false;
    }
  }

  bool get isLoading => _isLoading;

  void loadingState(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }
}
