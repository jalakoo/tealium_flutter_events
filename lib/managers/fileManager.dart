import 'dart:io';
import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;
import 'package:path_provider/path_provider.dart';

class FileManager {
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

  // Write data to file as a string
  Future<File> write(String object, String filename) async {
    try {
      final file = await _localFile(filename);
      return file.writeAsString(object);
    } catch (e) {
      throw e;
    }
  }

  // Load file object as JSON string
  Future<String> read(String filename) async {
    try {
      final file = await _localFile(filename);
      String contents = await file.readAsString();
      return contents;
    } catch (e) {
      throw e;
    }
  }

  Future<String> readFromBundle(String filename) async {
    return await rootBundle.loadString('assets/$filename');
  }
}
