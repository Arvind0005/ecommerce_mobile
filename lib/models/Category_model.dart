import 'dart:convert';

List<String> CategoryModelfromJson(String str) {
  return List<String>.from(json.decode(str).map((x) {
    return x.toString();
  }));
}
