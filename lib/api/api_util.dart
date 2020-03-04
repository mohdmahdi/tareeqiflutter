import 'package:connectivity/connectivity.dart';
import 'package:tareeqinew/exceptions/exceptions.dart';

class ApiUtl{
  static const String MAIN_API_URL = "http://192.168.100.18/tareeqi/public/index.php/api/";

  static const String AUTH_REGISTER = MAIN_API_URL + "auth/register";

  static const String AUTH_LOGIN = MAIN_API_URL + "auth/login";

  static const String SECTIONS = MAIN_API_URL + "sections";

  static const String SECTION = MAIN_API_URL + "section/";


}

Future<void> checkInternet() async {
  var connectivityResult = await (Connectivity().checkConnectivity());
  if (connectivityResult != ConnectivityResult.mobile && connectivityResult != ConnectivityResult.wifi) {
    throw NoInternetConnection();
  }
}