import 'dart:io';

import 'package:http/http.dart' as http;

class Database {
  Map<String, String> header = {
    'X-APITOKEN': '23de3ffa-409f-9532-881a-e24a42970ffa',
    'Content-Type': 'application/json'
  };
  //Fetch data for users from the passioneurs api
  Future<void> fetchWelcome() async {
    final url = Uri.parse("https://api.passioneurs.net/welcome");
    final header = {
      HttpHeaders.authorizationHeader: "23de3ffa-409f-9532-881a-e24a42970ffa"
    };
    http.Response response = await http.get(url, headers: header);
    // final responseJson = jsonDecode(response.body);
    // print('Decoded: $responseJson');
    print('Status code: ${response.statusCode}');
    print('Headers: ${response.headers}');
    print('Body: ${response.body}');
  }
}
