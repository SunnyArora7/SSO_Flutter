import 'dart:convert';
import 'dart:io';
import 'package:logger/logger.dart';
import 'package:flutter/services.dart';

Logger log = Logger();

void prettyPrintJson(String input) {
  const JsonDecoder decoder = JsonDecoder();
  const JsonEncoder encoder = JsonEncoder.withIndent('  ');
  final dynamic object = decoder.convert(input);
  final dynamic prettyString = encoder.convert(object);
  prettyString.split('\n').forEach((dynamic element) => print(element));
}

void prettyPrintMap(Map<dynamic, dynamic>? inputMap) {
  var encodedJson = jsonEncode(inputMap);
  const JsonDecoder decoder = JsonDecoder();
  const JsonEncoder encoder = JsonEncoder.withIndent('  ');
  final dynamic object = decoder.convert(encodedJson);
  final dynamic prettyString = encoder.convert(object);
  prettyString.split('\n').forEach((dynamic element) => print(element));
}

String getBase64FormatImage(String path) {
  File file = File(path);
  List<int> fileInByte = file.readAsBytesSync();
  String fileInBase64 = base64Encode(fileInByte);
  return 'data:image/jpg;base64,$fileInBase64';
}

String getBase64FormatFile(String path) {
  File file = File(path);
  List<int> fileInByte = file.readAsBytesSync();
  String fileInBase64 = base64Encode(fileInByte);
  return '$fileInBase64';
}

String getBase64FormatBytes(Uint8List? uploadFile) {
  String fileInBase64 = base64Encode(uploadFile!);
  return fileInBase64;
}

double getFileSize(File? file) {
  if (file == null) return 0.0;
  var sizeInBytes = file.lengthSync();
  var sizeInMb = sizeInBytes / (1024 * 1024);
  return sizeInMb;
}

int getIdByNameInObjectList(
    {required dynamic objectList, required String searchTerm}) {
  try {
    // Find the ObjectList object with the keyName
    dynamic objectStatus =
        objectList.firstWhere((object) => object.name == searchTerm);
    log.d('Object ID:  ${objectStatus.id}', error: objectStatus);
    // Return the id of the found ObjectList object
    return objectStatus.id;
  } catch (e) {
    // Handle the case where there is no status with the searchTerm
    log.e(
        'The searchTerm you are using for getIdByNameInObjectList function, does not exist. Returning 0');
    return 0;
  }
}

String getCarrierFromNumber({required String number}) {
  final carriers = {
    '+9379': 'Roshan',
    '+9378': 'Etisalat',
    '+9377': 'MTN',
    '+9376': 'MTN',
    '+93750': 'Wasel',
    '+9375': 'Cdma',
    '+9374': 'Salaam',
    '+9373': 'Etisalat',
    '+9372': 'Roshan',
    '+9371': 'AWCC',
    '+9370': 'AWCC',
  };

  for (var prefix in carriers.keys) {
    if (number.startsWith(prefix)) {
      return carriers[prefix]!;
    }
  }

  return 'Unknown Carrier';
}

int getCarrierIdFromNumber({required String number}) {
  final carriers = {
    '+9379': 2,
    '+9378': 1,
    '+9377': 4,
    '+9376': 4,
    '+93750': 6,
    '+9375': 7,
    '+9374': 3,
    '+9373': 1,
    '+9372': 2,
    '+9371': 5,
    '+9370': 5,
  };

  for (var prefix in carriers.keys) {
    if (number.startsWith(prefix)) {
      return carriers[prefix]!;
    }
  }

  return 0;
}

bool isCarrierAvailable(int? carrier) {
  // Return true only if the carrier is "Roshan" or "Etisalat"
  if (carrier == 1 || carrier == 2) {
    return true;
  }
  return false;
}
