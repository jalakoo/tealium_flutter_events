import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:path_provider/path_provider.dart';

class SecureFileManager {
  final storage = new FlutterSecureStorage();

  // Find the path to the documents directory for storage
  Future<String> get getlocalPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  // Create a reference to the file's locaion
  Future<File> getlocalFile(String filename) async {
    try {
      final path = await getlocalPath;
      final filepath = File('$path/$filename');
      print('fileManager.dart: _localFile: $filepath');
      return filepath;
    } catch (e) {
      throw e;
    }
  }

  // load JSON from file
  Future<String> loadJSON(String filename) async {
    return await rootBundle.loadString('assets/$filename');
  }

  // serialize JSON, then write to storage
  Future writeData(String filename) async {
    final file = await getlocalFile(filename);
    String contents = await file.readAsString();
    final Map<String, dynamic> json = jsonDecode(contents);
    json.forEach((key, value) async => await storage.write(key: key, value: value));
  } 

  Future<Map<String, String>> readAllValues() async {
    return await storage.readAll();
  }

  Future<String> readValue(String key) async {
    return await storage.read(key: key);
  }

}