import '../models/user_model.dart';
import '../services/api_service.dart';

class AuthRepository {
  final ApiService _api = ApiService();

  Future<bool> register(User user, String password) async {
    final body = {
      "username": user.username,
      "email": user.email,
      "password": password,
      "role": user.role,
      "phone_number": user.phoneNumber,
      "fullName": user.fullName ?? "",
      "storeName": user.storeName ?? "",
    };

    try {
      final response = await _api.post("register", body);
      return response["success"] == true || response["status"] == "ok";
    } catch (e) {
      rethrow;
    }
  }
}