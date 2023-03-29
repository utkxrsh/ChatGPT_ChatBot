import 'dart:convert';
import 'package:http/http.dart' as http;

class ChatGPTApi {
  final String _apiKey = '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';
  final String _apiEndpoint =
      'https://api.openai.com/v1/engines/davinci-codex/completions';

  Future<String> generateResponse(String prompt) async {
    final response = await http.post(
      Uri.parse(_apiEndpoint),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $_apiKey'
      },
      body: jsonEncode({
        'prompt': prompt,
        'max tokens': 50,
        'n': 1,
        'stop': null,
      }),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data['choices'][0]['text'].trim();
    } else {
      throw Exception('Failed to generate response From ChatGPT');
    }
  }
}
