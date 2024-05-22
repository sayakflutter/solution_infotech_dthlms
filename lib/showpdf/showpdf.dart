// import 'dart:io';

import 'dart:io';
import 'dart:typed_data';

import 'package:dthlms/key/key.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;

// import 'package:permission_handler/permission_handler.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:pspdfkit_flutter/pspdfkit.dart';

class PdfEdit extends StatefulWidget {
  const PdfEdit({super.key});

  @override
  State<PdfEdit> createState() => _PdfEditState();
}

class _PdfEditState extends State<PdfEdit> {
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

  String url = "https://pspdfkit.com/downloads/pspdfkit-web-demo.pdf";
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

    // if (check == true) {
    //   print('Data downloading......');
    //   var res = await http.get(Uri.parse(url));
    //   List<int> encResult = await encryptPdf(res.bodyBytes);
    //   String p = await writedata(encResult, "${d.path}/$filename.aes");
    //   print('file encryption successfully $p');
    // } else {
    //   final File file = File(url);
    //   final List<int> bytes = await file.readAsBytes();
    //   final List<int> encryptedBytes = await encrypte(bytes);
    //   // final File encryptedFile = File();
    //   String p = await writedata(encryptedBytes, "${d.path}/$filename.aes");
    //   print('File encrypted successfully: $p');
    // }
    // Navigator.pop(context);
    // print('${d.path}/$filename.aes');

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
    // Uint8List encdata = await readData("${d.path}/$filename.aes");
    // decryptedPdfData = await decrypteData(encdata);
    // String p = await _writeData(plaindata, "${d.path}/$filename");

    print('file decrypted successfully.......$decryptedPdfData ');
    setState(() {});
    Navigator.pop(context);
    setState(() {
      x = true;
    });
    // Get.to(() => HomePage(decryptedPdfData));
  }

  bool x = false;
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      permission();
    });
    super.initState();
  }

  getpath() async {
    Directory filelocationpath = await getExternalvisibledir;
    downloadcrete(url, filelocationpath, filename, true)
        .whenComplete(() => convertdecryptfile(filelocationpath, filename));
  }

  permission() async {
    // PermissionStatus status;
    // if (Platform.isAndroid) {
    //   final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
    //   final AndroidDeviceInfo info = await deviceInfoPlugin.androidInfo;
    //   if ((info.version.sdkInt) >= 33) {
    //     status = await Permission.manageExternalStorage.request();
    //   } else {
    //     status = await Permission.storage.request();
    //   }
    // } else {
    //   status = await Permission.storage.request();
    // }

    getpath();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        body: x
            ? PspdfkitWidget(
                documentPath: '$decryptedPdfData',

                // configuration: PdfConfiguration(
                //   spreadFitting: PspdfkitSpreadFitting.fit,
                //   // Common options:
                //   enableAnnotationEditing: true, // Annotation item on the main toolbar.
                //   toolbarTitle: file.path.split('/').last.toLowerCase(),

                //   androidShowBookmarksAction: true,
                //   // iOSAllowToolbarTitleChange: false,
                //   invertColors: true,
                //   enableMagnifier: true,
                //   startPage: 1,
                //   showPageLabels: true,
                //   showThumbnailBar: PspdfkitThumbnailBarMode.scrollable,
                //   inlineSearch: true,
                //   scrollDirection: PspdfkitScrollDirection.vertical,

                //   // appearanceMode: PspdfkitAppearanceMode.sepia,

                //   // iOS-specific options:
                //   // iOSRightBarButtonItems: [
                //   //   // List of buttons to show on the right side of the main toolbar.
                //   //   'thumbnailsButtonItem',
                //   //   'activityButtonItem',
                //   //   'annotationButtonItem',
                //   //   'searchButtonItem'
                //   // ],
                //   // iOSLeftBarButtonItems: [
                //   //   // List of buttons to show on the left side of the main toolbar. (Only one item supported.)
                //   //   'settingsButtonItem'
                //   // ],

                //   // Android-specific options:
                //   androidShowSearchAction: true, // Search action on the main toolbar.
                //   androidShowThumbnailGridAction:
                //       true, // Document editor action on the main toolbar.
                //   androidShowShareAction: false, // Share action on the main toolbar.
                //   androidShowPrintAction:
                //       true, // Print item on the main toolbar and inside the sharing sheet.
                //   androidEnableDocumentEditor:
                //       true, // Enable document editing in thumbnail view.
                // ));
              ) // SfPdfViewer.memory(
            //     initialPageNumber: 0,
            //     onFormFieldFocusChange: (details) => TextFormField(),
            //     decryptedPdfData!,
            //     controller: _pdfViewerController,
            //     initialScrollOffset: Offset.zero,
            //     enableTextSelection: true,
            //     otherSearchTextHighlightColor: Colors.red,
            //     interactionMode: PdfInteractionMode.pan,
            //     onPageChanged: (details) {
            //       print(details.newPageNumber);
            //     },
            //   )

            : CircularProgressIndicator.adaptive(),
      ),
    );
  }
}
