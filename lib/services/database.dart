import 'package:http/http.dart' as http;

class Database {
  //Fetch data for users from the passioneurs api
  Future<String> fetchWelcome() async {
    final response = await http.get(
      Uri.parse(
          'https://api.passioneurs.net/validate-token?token=23de3ffa-409f-9532-881a-e24a42970ffa'),
    );

    print(
        'The response obtained: ${response.body} and the status code: ${response.statusCode} ');
    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Failed to get data');
    }
  }
}