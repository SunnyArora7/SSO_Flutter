import 'package:http/http.dart' as http;
import 'api_endpoints.dart';
import 'http_client.dart';

class CommonApiService {
  CommonApiService._privateConstructor();

  static final CommonApiService _apiServiceInstance =
      CommonApiService._privateConstructor();

  factory CommonApiService() {
    return _apiServiceInstance;
  }

  final HttpClient _httpClient = HttpClient();

  Future<http.Response> login(Map<dynamic, dynamic> loginReqBody) async {
    return _httpClient.postRequest(ApiEndpoints.login, body: loginReqBody);
  }

  Future<http.Response> googleLogin(Map<dynamic, dynamic> loginReqBody) async {
    return _httpClient.postRequest(ApiEndpoints.google, body: loginReqBody);
  }

  Future<http.Response> microsoftLogin(
      Map<dynamic, dynamic> loginReqBody) async {
    return _httpClient.postRequest(ApiEndpoints.microsoft, body: loginReqBody);
  }

  Future<http.Response> getHomeData() async {
    return _httpClient.getRequest(
      ApiEndpoints.homeData
    );
  }
}
