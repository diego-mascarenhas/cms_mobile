import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:cms_mobile/models/factura_model.dart';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

Future<List<Factura>> fetchItems(http.Client client) async {
  var prefs = await SharedPreferences.getInstance();
  String? token = prefs.getString('login');

  final response = await http.get(
    Uri.parse('https://api.revisionalpha.es/administracion/facturas/'),
    // Send authorization headers to the backend.
    headers: {
      HttpHeaders.authorizationHeader: 'Basic $token',
    },
  );

  // Use the compute function to run parsePhotos in a separate isolate.
  return compute(parseItems, response.body);
}

// A function that converts a response body into a List<Photo>.
List<Factura> parseItems(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<Factura>((json) => Factura.fromJson(json)).toList();
}
