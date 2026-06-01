// TODO Implement this library.
import 'dart:convert';
import 'package:api_learning/ApiModels/MoonModal.dart';
import 'package:api_learning/Constants/apiconstants.dart';
import 'package:http/http.dart' as http;

class ApiService {
  Future<MoonModal?> createUser(String firstName, int age) async {
    try {
      final response = await http.post(
        Uri.parse(ApiConstants.createUser),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({"firstName": firstName, "age": age}),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = jsonDecode(response.body);
        print("url>>>>>>>>>>>>>${ApiConstants.createUser}");
        print(
          "params >>>>>>>>>>>> ${jsonEncode({"firstName": firstName, "age": age})}",
        );
        print("Response => $data");

        return MoonModal.fromJson(data);
      } else {
        print("Failed => ${response.statusCode}");
      }
    } catch (e) {
      print("Error => $e");
    }

    return null;
  }
}
