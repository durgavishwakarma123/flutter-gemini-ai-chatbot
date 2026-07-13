import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/message_model.dart';

class ChatController {
  // Using 'gemini-flash-latest' as it's the most stable alias available in this environment
  final String _url = "https://generativelanguage.googleapis.com/v1beta/models/gemini-flash-latest:generateContent";
  final String _apiKey = "AIzaSyAmIFErerAUFV3JXlYgpRVAVJ-YTmXHQxc";

  List<MessageModel> messages = [];
  bool isLoading = false;

  Future<String?> sendMessage(String msg) async {
    messages.add(MessageModel(text: msg, isUser: true, timestamp: DateTime.now()));
    isLoading = true;

    try {
      final contents = messages.map((m) => {
        "role": m.isUser ? "user" : "model",
        "parts": [{"text": m.text}]
      }).toList();

      final response = await http.post(
        Uri.parse("$_url?key=$_apiKey"),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({"contents": contents}),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        String answer = data['candidates'][0]['content']['parts'][0]['text'];
        messages.add(MessageModel(text: answer, isUser: false, timestamp: DateTime.now()));
        return null;
      } else {
        final errorData = jsonDecode(response.body);
        String errorMsg = errorData['error']['message'] ?? "Unknown Error";
        
        if (response.statusCode == 429) {
          return "Quota Exceeded: Please check your Google AI Studio limits or try again later.";
        }
        
        print("GOOGLE API ERROR: ${response.statusCode} - $errorMsg");
        return "Server Error (${response.statusCode}): $errorMsg";
      }
    } catch (e) {
      print("CONNECTION ERROR: $e");
      return "Network Error: Please check your internet connection";
    } finally {
      isLoading = false;
    }
  }
}
