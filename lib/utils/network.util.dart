import 'dart:io';

import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:logger/logger.dart';

abstract class NetworkUtil {
  Future<bool> get isConnected;
  Future<String?> get ipAddress;
}

class NetworkUtilImpl extends NetworkUtil {
  final InternetConnectionChecker _connectionChecker;

  NetworkUtilImpl({required InternetConnectionChecker connectionChecker})
      : _connectionChecker = connectionChecker;

  @override
  Future<bool> get isConnected => _connectionChecker.hasConnection;
  @override
  Future<String?> get ipAddress async {
    String ipAddress = '';
    final interfaces = await NetworkInterface.list(
        type: InternetAddressType.IPv4, includeLinkLocal: true);

    try {
      // Try VPN connection first
      NetworkInterface vpnInterface =
          interfaces.firstWhere((element) => element.name == "tun0");
      ipAddress = vpnInterface.addresses.first.address;
    } on StateError catch (e) {
      Logger().e('getLocalIpAddress: $e');
      // Try wlan connection next
      try {
        NetworkInterface interface =
            interfaces.firstWhere((element) => element.name == "wlan0");
        ipAddress = interface.addresses.first.address;
      } catch (ex) {
        Logger().e('getLocalIpAddress: $ex');
        // Try any other connection next
        try {
          NetworkInterface interface = interfaces.firstWhere((element) =>
              !(element.name == "tun0" || element.name == "wlan0"));
          ipAddress = interface.addresses.first.address;
        } catch (er) {
          Logger().e('getLocalIpAddress: $er');
          ipAddress = '0.0.0.0';
        }
      }
    }

    Logger().d('NetworkUtil: $ipAddress');
    return ipAddress;
  }
}