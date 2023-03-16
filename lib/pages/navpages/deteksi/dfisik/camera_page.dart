import 'dart:convert';
import 'dart:ffi';
import 'dart:io';
import 'dart:ui';
import 'package:image/image.dart' as img;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sapi_pmk/pages/home.dart';
import 'package:sapi_pmk/pages/navpages/deteksi/dnfisik/quiz.dart';
import 'package:sapi_pmk/widgets/app_large_text.dart';
import 'package:sapi_pmk/widgets/app_text.dart';
import 'classifier.dart';
import 'classifier_float.dart';
import 'package:logger/logger.dart';
import 'package:tflite_flutter_helper/tflite_flutter_helper.dart';
import 'package:http/http.dart' as http;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class CameraPage extends StatefulWidget {
  @override
  _CameraPageState createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  int _counter = 0;
  bool _loading = false;
  bool cameraOff = false;
  late Classifier _classifier;
  final Connectivity _connectivity = Connectivity();

  @override
  void initState() {
    _connectivity.onConnectivityChanged.listen((event) {
      if (event == ConnectivityResult.none) {
        setState(() {
          cameraOff = true;
        });
      } else {
        setState(() {
          cameraOff = false;
        });
      }
    });

    super.initState();

    _loading = true;
    _classifier = ClassifierFloat();
  }

  var logger = Logger();

  File? _image;
  String? message = "";
  final picker = ImagePicker();

  Image? _imageWidget;

  img.Image? fox;

  Category? category;
  String? predictionLabel;
  double? predictionConf;
  String link = "https://5d14-103-26-102-3.ap.ngrok.io/predict";
  // bool isData = false;

  Future uploadImage() async {
    final pickedImage =
        await ImagePicker().getImage(source: ImageSource.gallery);
    _image = File(pickedImage!.path);

    showDialog(
      context: context,
      builder: (context) {
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
    // isData = true;
    final request = http.MultipartRequest("POST", Uri.parse(link));

    final headers = {"Content-type": "multipart/form-data"};
    request.files.add(http.MultipartFile(
        'file', _image!.readAsBytes().asStream(), _image!.lengthSync(),
        filename: _image!.path.split("/").last));
    request.headers.addAll(headers);
    final response = await request.send();
    http.Response res = await http.Response.fromStream(response);
    if (res.statusCode == 200) {
      final resJson = jsonDecode(res.body);
      print(resJson);
      predictionLabel = resJson['prediction'][0][0];
      predictionConf = resJson['prediction'][1][0];
      setState(() {
        print('berhasil');
      });
    } else {
      print('error. \nRespon Code : ${res.statusCode}');
    }

    // print(response.statusCode);
    Navigator.of(context).pop();
  }

  Future uploadImageCam() async {
    final pickedImage =
        await ImagePicker().getImage(source: ImageSource.camera);
    _image = File(pickedImage!.path);

    showDialog(
      context: context,
      builder: (context) {
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
    // isData = true;
    final request = http.MultipartRequest("POST", Uri.parse(link));

    final headers = {"Content-type": "multipart/form-data"};
    request.files.add(http.MultipartFile(
        'file', _image!.readAsBytes().asStream(), _image!.lengthSync(),
        filename: _image!.path.split("/").last));
    request.headers.addAll(headers);
    final response = await request.send();
    http.Response res = await http.Response.fromStream(response);
    if (res.statusCode == 200) {
      final resJson = jsonDecode(res.body);
      print(resJson);
      predictionLabel = resJson['prediction'][0][0];
      predictionConf = resJson['prediction'][1][0];
      setState(() {
        print('berhasil');
      });
    } else {
      print('error. \nRespon Code : ${res.statusCode}');
    }

    // print(response.statusCode);
    Navigator.of(context).pop();
  }

  File _resizeImage(String filePath) {
    final image = img.decodeImage(File(filePath).readAsBytesSync());

    if (image == null) return File(filePath);
    if (image.width > 50) {
      final rezizedImage = img.copyResize(image, width: 300, height: 400);
      File(filePath).writeAsBytesSync(img.encodeJpg(rezizedImage));
    }
    return File(filePath);
  }

  Future getImage() async {
    var pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      _image = _resizeImage(pickedFile!.path);
      _imageWidget = Image.file(_image!);
      _predict();
    });
    Navigator.of(context).pop();
  }

  Future getCamera() async {
    var pickedFile = await picker.getImage(source: ImageSource.camera);

    setState(() {
      _image = _resizeImage(pickedFile!.path);
      _imageWidget = Image.file(_image!);
      _predict();
    });
    Navigator.of(context).pop();
  }

  void _predict() async {
    img.Image imageInput = img.decodeImage(_image!.readAsBytesSync())!;
    var pred = _classifier.predict(imageInput);

    setState(() {
      this.category =
          pred; // D:\Bahan Belajar Web\Mobile\pmk\sapi_pmk\assets\LabelVer1.txt
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: cameraOff
          ? Container(
              //body offline
              width: double.maxFinite,
              height: double.maxFinite,
              child: Stack(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height,
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("img/rumput.jpg"),
                          fit: BoxFit.cover),
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 40,
                        ),
                        //banner deteksi
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => Home()));
                                    },
                                    icon: Icon(Icons.arrow_back),
                                    iconSize:
                                        MediaQuery.of(context).size.height / 25,
                                    color: Colors.white,
                                  ),
                                  Container(
                                    child: AppLargeText(
                                      text: "Deteksi Gejala Fisik PMK",
                                      size: MediaQuery.of(context).size.height /
                                          32,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 20,
                              ),
                              Row(
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(7),
                                    decoration: BoxDecoration(
                                        color: Color(0xFFff0d01),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                  ),
                                  SizedBox(
                                    width: 2,
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(right: 10),
                                    color: Colors.black45,
                                    child: AppText(
                                      text: "Offline",
                                      color: Colors.white,
                                      size: MediaQuery.of(context).size.height /
                                          40,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                            alignment: Alignment.center,
                            margin: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 50,
                            ),
                            width: MediaQuery.of(context).size.width * 0.89,
                            height: MediaQuery.of(context).size.height / 3.5,
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                color: Colors.white,
                                width: 5,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: _image == null
                                ? Container(
                                    width: MediaQuery.of(context).size.width,
                                    child: Column(
                                      children: [
                                        Image.asset(
                                          'img/noimage.jpg',
                                          width: 230,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              4.7,
                                          fit: BoxFit.cover,
                                        )
                                      ],
                                    ),
                                  )
                                : Container(
                                    child: Column(
                                      children: [
                                        Container(
                                          width: 300,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              4.7,
                                          child: Image.file(_image!),
                                        )
                                      ],
                                    ),
                                  ))
                      ],
                    ),
                  ),
                  Positioned(
                    top: MediaQuery.of(context).size.height / 1.7,
                    child: SingleChildScrollView(
                      child: Container(
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(40.0),
                                topLeft: Radius.circular(40.0)),
                            color: Colors.white),
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 30,
                            ),
                            const Text(
                              '--_ HASIL _--',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height:
                                      MediaQuery.of(context).size.height / 5,
                                  width:
                                      MediaQuery.of(context).size.width / 1.05,
                                  child: SingleChildScrollView(
                                    child: Column(
                                      children: [
                                        Container(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              13,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              1.3,
                                          padding: EdgeInsets.all(5),
                                          margin: EdgeInsets.all(5),
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                color: Color(0xFF47BEC4),
                                                width: 2,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          child: Text(
                                            category != null
                                                ? category!.label
                                                : '',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                        Text(
                                          category != null
                                              ? 'Confidence: ${category!.score.toStringAsFixed(3)}'
                                              : '',
                                          style: TextStyle(fontSize: 16),
                                        ),
                                        SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              200,
                                        ),
                                        Container(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              13,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              1.3,
                                          child: TextButton.icon(
                                            style: ButtonStyle(
                                              backgroundColor:
                                                  MaterialStateProperty.all(
                                                      Color(0xFF016CA3)),
                                            ),
                                            onPressed: _selectPhotoOffline,
                                            icon: Icon(
                                              Icons.upload_file,
                                              color: Colors.white,
                                            ),
                                            label: Text(
                                              "Upload Gambar",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
//===============================================body online==========================================================
          : Container(
              width: double.maxFinite,
              height: double.maxFinite,
              child: Stack(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height,
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("img/rumput.jpg"),
                          fit: BoxFit.cover),
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 40,
                        ),
                        //banner deteksi
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => Home()));
                                    },
                                    icon: Icon(Icons.arrow_back),
                                    iconSize:
                                        MediaQuery.of(context).size.height / 25,
                                    color: Colors.white,
                                  ),
                                  Container(
                                    child: Text(
                                      "Deteksi Gejala Fisik PMK",
                                      style: TextStyle(
                                        fontSize:
                                            MediaQuery.of(context).size.height /
                                                32,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 20,
                              ),
                              Row(
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(7),
                                    decoration: BoxDecoration(
                                        color: Color(0xFF6eff57),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                  ),
                                  SizedBox(
                                    width: 2,
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(right: 10),
                                    color: Colors.black45,
                                    child: AppText(
                                      text: "Online",
                                      color: Colors.white,
                                      size: MediaQuery.of(context).size.height /
                                          40,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                            margin: const EdgeInsets.all(20),
                            width: MediaQuery.of(context).size.height,
                            height: MediaQuery.of(context).size.height / 3.5,
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                color: Colors.white,
                                width: 5,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: _image == null
                                ? Container(
                                    width: 100,
                                    child: Column(
                                      children: [
                                        Image.asset(
                                          'img/noimage.jpg',
                                          width: 230,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              4.8,
                                        )
                                      ],
                                    ),
                                  )
                                : Container(
                                    child: Column(
                                      children: [
                                        Container(
                                          width: 300,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              4.7,
                                          child: Image.file(_image!),
                                        )
                                      ],
                                    ),
                                  ))
                      ],
                    ),
                  ),
                  Positioned(
                    top: MediaQuery.of(context).size.height / 1.7,
                    child: SingleChildScrollView(
                      child: Container(
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(40.0),
                                topLeft: Radius.circular(40.0)),
                            color: Colors.white),
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 30,
                            ),
                            const Text(
                              '--_ HASIL _--',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Container(
                                  height:
                                      MediaQuery.of(context).size.height / 5,
                                  width:
                                      MediaQuery.of(context).size.width / 1.05,
                                  child: SingleChildScrollView(
                                      child: Column(
                                    children: [
                                      Container(
                                        height:
                                            MediaQuery.of(context).size.height /
                                                13,
                                        width:
                                            MediaQuery.of(context).size.width /
                                                1.3,
                                        padding: EdgeInsets.all(5),
                                        margin: EdgeInsets.all(5),
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                              color: Color(0xFF47BEC4),
                                              width: 2,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: Text(
                                          predictionLabel != null
                                              ? '$predictionLabel'
                                              : '',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      Text(
                                        predictionLabel != null
                                            ? 'Confidence : $predictionConf'
                                            : '',
                                        style: TextStyle(fontSize: 16),
                                      ),
                                      SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height /
                                                200,
                                      ),
                                      Container(
                                        height:
                                            MediaQuery.of(context).size.height /
                                                13,
                                        width:
                                            MediaQuery.of(context).size.width /
                                                1.3,
                                        child: TextButton.icon(
                                          style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateProperty.all(
                                                    Color(0xFF016CA3)),
                                          ),
                                          onPressed: _selectPhotoOnline,
                                          icon: Icon(
                                            Icons.upload_file,
                                            color: Colors.white,
                                          ),
                                          label: Text(
                                            "Upload Gambar",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  )),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
      floatingActionButton: SizedBox(
        width: MediaQuery.of(context).size.width / 1.4,
        height: MediaQuery.of(context).size.height / 14,
        child: FloatingActionButton.extended(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => QuizPage()));
          },
          label: const Text('Lanjut deteksi non-fisik'),
          backgroundColor: Color(0xFF01ACC7),
          icon: const Icon(FontAwesomeIcons.question),
        ),
      ),
    );
  }

  Future _selectPhotoOffline() async {
    await showModalBottomSheet(
      context: context,
      builder: (context) => BottomSheet(
        builder: (context) => Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: Icon(FontAwesomeIcons.camera),
              title: Text(
                'Camera',
                style: TextStyle(color: Colors.black),
              ),
              iconColor: Colors.black,
              onTap: getCamera,
            ),
            ListTile(
              leading: Icon(Icons.filter),
              title: Text('Gallery', style: TextStyle(color: Colors.black)),
              iconColor: Colors.black,
              onTap: getImage,
            ),
          ],
        ),
        onClosing: () {},
      ),
    );
  }

  Future _selectPhotoOnline() async {
    await showModalBottomSheet(
      context: context,
      builder: (context) => BottomSheet(
        builder: (context) => Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: Icon(FontAwesomeIcons.camera),
              title: Text(
                'Camera',
                style: TextStyle(color: Colors.black),
              ),
              iconColor: Colors.black,
              onTap: uploadImageCam,
            ),
            ListTile(
              leading: Icon(Icons.filter),
              title: Text('Gallery', style: TextStyle(color: Colors.black)),
              iconColor: Colors.black,
              onTap: uploadImage,
            ),
          ],
        ),
        onClosing: () {},
      ),
    );
  }
}
