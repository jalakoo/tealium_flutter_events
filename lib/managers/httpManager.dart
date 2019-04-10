import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:async' show Future;
import 'sourceDataMode.dart';

const String FILE_URL = "";
const String DEV_URL =
    "https://1eb197c8-f872-4f6e-8f00-ae0998e67efd.mock.pstmn.io";
const String PROD_URL = "";

class HttpManager {
  @required
  SourceDataMode mode = SourceDataMode.prod;

  String baseUrlFor(SourceDataMode mode) {
    if (mode == SourceDataMode.dev) {
      return DEV_URL;
    }
    return PROD_URL;
  }

  Future<String> get(url) async {
    final response = await http.Client().get(url);
    return response.body;
  }

  // TODO: Post

}
