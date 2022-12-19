import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import '../models/smtpModel.dart';

import 'package:http/http.dart' as http;

Future<List<Smtp>> fetchItems(http.Client client) async {
  final response = await http.get(
    Uri.parse('https://api.revisionalpha.es/sys/smtps/'),
    // Send authorization headers to the backend.
    headers: {
      HttpHeaders.authorizationHeader:
          'Basic dGVzdGVyOmU1M2FkNTc5YzI5MThiNDIyNTQxMWIyYjc3NWJmZjQx',
    },
  );

  // Use the compute function to run parsePhotos in a separate isolate.
  return compute(parseItems, response.body);
}

// A function that converts a response body into a List<Photo>.
List<Smtp> parseItems(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<Smtp>((json) => Smtp.fromJson(json)).toList();
}
