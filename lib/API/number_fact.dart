import 'package:http/http.dart' as http;

Future<String> fetchNumberFact(String type, String number) async {
  final apiUrl = 'http://numbersapi.com/$number/$type';
  final response = await http.get(Uri.parse(apiUrl));

  if (response.statusCode == 200) {
    return response.body;
  } else {
    throw Exception('Failed to load number fact');
  }
}



