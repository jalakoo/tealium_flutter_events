// Means for getting content
// file = Local file source (ie users.json)
// random = Random info returned for all content requests
// dev = From remote dev or mock server
// prod = From production server

enum SourceDataMode { file, random, dev, prod }

SourceDataMode sourceDataModeFrom(String string) {
  if (string.toLowerCase() == "file") {
    return SourceDataMode.file;
  }
  if (string.toLowerCase() == "random") {
    return SourceDataMode.random;
  }
  if (string.toLowerCase() == "dev") {
    return SourceDataMode.dev;
  }
  return SourceDataMode.prod;
}

String stringFromSourceDataMode(SourceDataMode mode) {
  if (mode == SourceDataMode.file) {
    return "file";
  }
  if (mode == SourceDataMode.random) {
    return "random";
  }
  if (mode == SourceDataMode.dev) {
    return "dev";
  }
  return "prod";
}
