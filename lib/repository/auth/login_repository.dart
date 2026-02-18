// import 'package:bloc_clean_coding/config/apiUrls/api_urls.dart';
// import 'package:bloc_clean_coding/config/data/network/network_services_api.dart';
// import 'package:bloc_clean_coding/model/user/user_model.dart';

// class LoginRepository {
//   final api = NetworkApiServices();
//   Future<UserModel> loginApi(dynamic data) async {
//     final response = await api.postApi(data, ApiUrls.loginApi);
//     return UserModel.fromJson(response);
//   }
// }

import 'package:bloc_clean_coding/model/user/user_model.dart';

abstract class LoginRepository {
  Future<UserModel> loginApi(dynamic data);
}
