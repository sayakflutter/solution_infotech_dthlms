import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:dthlms/getx/getxcontroller.dart';
import 'package:dthlms/key/key.dart';
import 'package:dthlms/pdfview/pdfview.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_platform_alert/flutter_platform_alert.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import '../../color/color.dart';
import '../../font/font_family.dart';
import '../../widget/drawerWidget.dart';
import '../utctime.dart';
import 'package:http/http.dart' as http;

class StudyMaterialPdf extends StatefulWidget {
  String name;
  StudyMaterialPdf(this.name, {super.key});

  @override
  State<StudyMaterialPdf> createState() => _StudyMaterialPdfState();
}

class _StudyMaterialPdfState extends State<StudyMaterialPdf> {
  UtcTime time = UtcTime();
  Getx getx = Get.put(Getx());

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        backgroundColor: ColorPage.bgcolor,
        appBar: AppBar(
          actions: [
            Text(
              time.utctime(),
              style: FontFamily.font2,
            )
          ],
          backgroundColor: ColorPage.appbarcolor,
          title: Text(
            widget.name,
            style: FontFamily.font2,
            textScaler: TextScaler.linear(1.5),
          ),
        ),
        body: Row(
          children: [
            const DrawerWidget(),
            Container(
              width: 700,
              child: ListView.builder(itemBuilder: (context, index) {
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 50),
                  child: Card(
                    color: const Color.fromARGB(255, 245, 247, 248),
                    surfaceTintColor: const Color.fromARGB(255, 243, 245, 247),
                    elevation: 10,
                    child: ListTile(
                      onTap: () {
                        Get.to(() => const PdfView());
                      },
                      leading: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(80),
                        ),
                        padding: const EdgeInsets.all(10),
                        child: Image.asset(
                          'assets/pdf3.png',
                          width: 30,
                        ),
                      ),
                      title: Text(
                        'google-drive.pdf',
                        style: FontFamily.mobilefont,
                      ),
                      subtitle: Text(
                        '1.3 mb Expiry:25-05-14',
                        style: GoogleFonts.kadwa(
                            textStyle: TextStyle(color: Colors.grey)),
                      ),
                      trailing: IconButton(
                          onPressed: () async {
                            await FlutterPlatformAlert.playAlertSound();

                            final clickedButton =
                                await FlutterPlatformAlert.showAlert(
                                    windowTitle: 'Download',
                                    text: 'You want to download the pdf file',
                                    alertStyle: AlertButtonStyle.yesNoCancel,
                                    iconStyle: IconStyle.information,
                                    options: PlatformAlertOptions());
                            if (clickedButton == AlertButton.yesButton) {
                              filelocationpath = await getExternalvisibledir;
                              downloadcrete(
                                      url, filelocationpath, filename, true)
                                  .whenComplete(() => convertdecryptfile(
                                      filelocationpath, filename));
                            }
                          },
                          icon: const Icon(Icons.download)),
                    ),
                  ),
                );
              }),
            ),
            Obx(
              () => Expanded(
                  child: getx.pdfview.value
                      ? Container(
                          color: Colors.black,
                        )
                      : SingleChildScrollView(
                          child: Column(
                            children: [
                              Container(
                                  // width: MediaQuery.sizeOf(context).width,
                                  // height: MediaQuery.sizeOf(context).height,
                                  child: SfPdfViewer.memory(
                                decryptedPdfData!,
                              )),
                            ],
                          ),
                        )),
            )
          ],
        ),
      ),
    );
  }

  // Future pdfdownload() async {
  //   showDialog(
  //       context: context,
  //       builder: (context) {
  //         return CircularProgressIndicator.adaptive();
  //       });

  //   getx.pdfview.value = false;
  // }

  String filename = "encrypt.pdf";
  late Directory appDocDir;
  Future<Directory> get getExternalvisibledir async {
    if (Platform.isAndroid) {
      if (await Directory('/storage/emulated/0/MyMishra').exists()) {
        final externalDir = Directory('/storage/emulated/0/MyMishra');
        return externalDir;
      } else {
        await Directory('/storage/emulated/0/MyMishra').create(recursive: true);
        final externalDir = Directory('/storage/emulated/0/MyMishra');
        return externalDir;
      }
    } else {
      final Directory _appDocDir = await getApplicationDocumentsDirectory();
      //App Document Directory + folder name
      final Directory _appDocDirFolder =
          Directory('${_appDocDir.path}/MyMishra');

      if (await _appDocDirFolder.exists()) {
        //if folder already exists return path
        return _appDocDirFolder;
      } else {
        //if folder not exists create folder and then return its path
        final Directory _appDocDirNewFolder =
            await _appDocDirFolder.create(recursive: true);
        return _appDocDirNewFolder;
      }
    }
  }

  String url = "https://icseindia.org/document/sample.pdf";
  Future downloadcrete(url, Directory d, filename, bool check) async {
    showDialog(
        context: context,
        builder: (context) {
          return const Material(
            child: Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Text('Pdf Downloading..')],
                )
              ],
            )),
          );
        });

    if (check == true) {
      print('Data downloading......');
      var res = await http.get(Uri.parse(url));
      List<int> encResult = await encrypte(res.bodyBytes);
      String p = await writedata(encResult, "${d.path}/$filename.aes");
      print('file encryption successfully $p');
    } else {
      final File file = File(url);
      final List<int> bytes = await file.readAsBytes();
      final List<int> encryptedBytes = await encrypte(bytes);
      // final File encryptedFile = File();
      String p = await writedata(encryptedBytes, "${d.path}/$filename.aes");
      print('File encrypted successfully: $p');
    }
    Navigator.pop(context);
    print('${d.path}/$filename.aes');

    // await Get.defaultDialog(
    //   barrierDismissible: false,
    //   title: 'PDF file',
    //   content: const Text(
    //     'Pdf file encryption successfull',
    //   ),
    //   onConfirm: () {
    //     Get.back();
    //   },
    // );
    // OpenFile.open("${d.path}/$filename.aes");
  }

  Uint8List? decryptedPdfData;
  convertdecryptfile(Directory d, filename) async {
    showDialog(
        context: context,
        builder: (context) {
          return const Center(child: CircularProgressIndicator());
        });
    Uint8List encdata = await readData("${d.path}/$filename.aes");
    decryptedPdfData = await decrypteData(encdata);
    // String p = await _writeData(plaindata, "${d.path}/$filename");

    print('file decrypted successfully.......$decryptedPdfData ');
    setState(() {});
    Navigator.pop(context);
    getx.pdfview.value = false;
  }

  bool x = false;
  final GlobalKey<SfPdfViewerState> _pdfViewerKey = GlobalKey();
  final PdfViewerController _pdfViewerController = PdfViewerController();
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      permission();
    });
    super.initState();
  }

  late Directory filelocationpath;
//

  permission() async {
    PermissionStatus status;
    if (Platform.isAndroid) {
      final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
      final AndroidDeviceInfo info = await deviceInfoPlugin.androidInfo;
      if ((info.version.sdkInt) >= 33) {
        status = await Permission.manageExternalStorage.request();
      } else {
        status = await Permission.storage.request();
      }
    } else {
      status = await Permission.storage.request();
    }
  }
}
