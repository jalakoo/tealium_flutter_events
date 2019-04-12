import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:path_provider/path_provider.dart';

class SecureFileManager {
  final storage = new FlutterSecureStorage();

  // Find the path to the documents directory for storage
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  // Create a reference to the file's locaion
  Future<File> _localFile(String filename) async {
    try {
      final path = await _localPath;
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
  Future write(String filename) async {
    final file = await _localFile(filename);
    String contents = await file.readAsString();
    final Map<String, dynamic> json = jsonDecode(contents);
    json.forEach((key, value) async => await storage.write(key: key, value: value));
  } 

  Future<Map<String, String>> read() async {
    return await storage.readAll();
  }

  Future<String> readValue(String key) async {
    return await storage.read(key: key);
  }

  Future<FileSystemEntity> delete(String filename) async {
    try {
      final file = await _localFile(filename);
      return file.delete();
    } catch (e) {
      throw e;
    }
  }

}