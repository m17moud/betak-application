import 'package:internet_connection_checker/internet_connection_checker.dart';

import 'network_controller.dart';

abstract class NetworkInfo {
  Future<bool> get isConnected;
  Future<bool> get isConnectedToServer;
}

class NetworkInfoImpl extends NetworkInfo {
  final InternetConnectionChecker connectionChecker;
  bool wasConnced = false;
  DateTime? testConnectionTime;
  NetworkInfoImpl(this.connectionChecker);

  @override
  Future<bool> get isConnected async => await connectionChecker.hasConnection;

  ///this function checks if the user is connected to the server by checking the internet connection and calling the server to get the status code of its connection
  ///if the user is connected to the server the function will save the time of connection and return true
  ///the next time the user tries to check the server availability it will return the last connection status if the last trial was less than `10` seconds ago
  ///if the last trial was more than `10` seconds ago it will try to connect to the server again and save the new connection status and time
  ///if the user is not connected to the server it will return false
  ///this help in reducing the number of calls to the server.
  @override
  Future<bool> get isConnectedToServer async {
    if (wasConnced &&
        testConnectionTime != null &&
        DateTime.now().difference(testConnectionTime!).inSeconds < 10) {
      return wasConnced;
    }
    wasConnced = await InternetController.hasNetwork();
    testConnectionTime = DateTime.now();
    return wasConnced;
  }
}
