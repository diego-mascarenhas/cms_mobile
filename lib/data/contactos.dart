import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:cms_mobile/models/contacto_model.dart';

import 'package:http/http.dart' as http;

Future<List<Contacto>> fetchItems(http.Client client) async {
  final response = await http.get(
    Uri.parse('https://api.revisionalpha.es/mailer/suscriptores/'),
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
List<Contacto> parseItems(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<Contacto>((json) => Contacto.fromJson(json)).toList();
}
