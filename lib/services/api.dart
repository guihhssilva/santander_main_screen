import 'package:santander_main_screen/models/user_model/user_model.dart';
import 'package:http/http.dart' as http;

class ApiApp {
  static Future<UserModel> fetchUser(int id) async {
    var result = await http.get(Uri.parse(
        "https://digitalinnovationone.github.io/santander-dev-week-2023-api/mocks/find_one.json"));
    return UserModel.fromJson(result.body);
  }
}
