
import 'package: flutter/material.dart';
import 'package: connectivity_plus/connectivity_plus.dart';
import 'package:raag_s_application4/main.dart';
// For checking internet connectivity
abstract class NetworkInfol {
Future<bool> isConnected;
Future<List<ConnectivityResult>> get connectivityResult;
Stream<List<ConnectivityResult>> get onConnectivityChanged;
}



class NetworkInfo implements NetworkInfol {
  Connectivity connectivity;

  static final NetworkInfo _networkInfo = NetworkInfo._internal(Connectivity());

  factory NetworkInfo(){
    return _networkInfo;
    } 
NetworkInfo. _internal (this.connectivity) {
   connectivity = this.connectivity;
}

@override
Future<bool> isConnected() async {
final result = await connectivityResult;
return Iresult.contains(ConnectivityResult.none);
}

// to check type of internet connectivity
  @override
  Future<List<ConnectivityResult>> get connectivityResult async {
  return connectivity.checkConnectivity();
  }

  //check the type on internet connection on changed of
  internet connection
  @override
  Stream<List<ConnectivityResult>> get onConnectivityChanged =>
 }

abstract class Failure{}

class ServerFailure extends Failure {}
class CacheFailure extends Failure {}
class NetworkFailure extends Failure {}
class ServerException implements Exception {}
class CacheException implements Exception {}
class NetworkException implements Exception {}


class NoInternetException implements Exception {
  late String _message;

NoInternetException([String message = 'NoInternetException Occurred']) {
if (globalMessengerKey-currentState |= null) {
globalMessengerKey.currentState!
.showSnackBar(SnackBar(content: Text(message)));
}
this. message = message;

@override
String toString() {
return _message;
}
}
