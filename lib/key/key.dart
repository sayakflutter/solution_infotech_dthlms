import 'dart:io';

import 'package:encrypt/encrypt.dart' as encrypt;
import 'package:flutter/foundation.dart';

class MyEncrypt {
  // static final myiv = encrypt.IV.fromUtf8('sayakmishra123');
  static final myiv = encrypt.IV.fromUtf8('#@1458%564soUn6');

  static final encrypter =
      encrypt.Encrypter(encrypt.AES(MyEncryptDecrypte.mykey));
}

class MyEncryptDecrypte {
  static final mykey = encrypt.Key.fromLength(32);
  static final myiv = encrypt.IV.fromLength(16);
  static final encrypter = encrypt.Encrypter(encrypt.AES(mykey));
}

encrypte(bodyBytes) async {
  if (kDebugMode) {
    print('encrypting file......');
  }
  final encrypted =
      MyEncrypt.encrypter.encryptBytes(bodyBytes, iv: MyEncrypt.myiv);
  // print(encrypted.bytes);
  return encrypted.bytes;
}

decrypteData(encdata) async {
  if (kDebugMode) {
    print('file decryption in progress .......');
  }
  encrypt.Encrypted en = encrypt.Encrypted(encdata);
  var decrypted = MyEncrypt.encrypter.decryptBytes(en, iv: MyEncrypt.myiv);
  // print(decrypted);
  return Uint8List.fromList(decrypted);
}

Future<dynamic> writedata(List<int> encResult, String s) async {
  if (kDebugMode) {
    print('Writting data');
  }
  File f = File(s);
  await f.writeAsBytes(encResult);
  return f.absolute.toString();
}

Future<Uint8List> readData(planstring) async {
  if (kDebugMode) {
    print('reading encrypted file data.......');
  }
  File f = File(planstring);
  return await f.readAsBytes();
}
