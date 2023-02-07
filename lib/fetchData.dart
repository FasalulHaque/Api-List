import 'dart:convert';

import 'package:api_test3/model.dart';
import 'package:http/http.dart' as http;

Future<TestCase> fetchData() async {
  final rasponse = await http.get(Uri.parse('https://reqres.in/api/users'));
  if (rasponse.statusCode == 200) {
    final data1 = jsonDecode(rasponse.body) as Map<String, dynamic>;
    final data2 = TestCase.fromJson(data1);
    for (Datum datum in data2.data) {}
    return data2;
  } else {
    throw Exception('Failed to load data');
  }
}
