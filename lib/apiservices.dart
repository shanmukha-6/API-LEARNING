import 'package:http/http.dart' as http;
import 'package:api_learning/apiconstants/apiconstants.dart';

class Apiservices {
  Future<dynamic> flutter() async {
    try {
      final response = await http.get(Uri.parse(ApiConstants.HITTED));
      if (response.statusCode == 200) {
        print("response${response.body}");
        return response.body;
      } else {
        print("Error.${response.statusCode}");
      }
    } catch (e) {
      print("Exception.$e");
    }
  }
}
