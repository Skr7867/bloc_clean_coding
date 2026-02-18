import 'package:bloc_clean_coding/config/apiUrls/api_urls.dart';
import 'package:bloc_clean_coding/config/data/network/network_services_api.dart';
import 'package:bloc_clean_coding/model/user/user_model.dart';
import 'package:bloc_clean_coding/repository/auth/login_repository.dart';

class LoginHttpApiRepository implements LoginRepository {
  final api = NetworkApiServices();
  @override
  Future<UserModel> loginApi(dynamic data) async {
    final response = await api.postApi(data, ApiUrls.loginApi);

    return UserModel.fromJson(response);
  }
}
