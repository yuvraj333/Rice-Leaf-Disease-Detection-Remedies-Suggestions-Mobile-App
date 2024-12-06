import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:webview_flutter/webview_flutter.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late File _image = File(''); // Initialize with an empty file path
  final picker = ImagePicker();

  Future getImageFromCamera() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path ?? '');
      });
    }
  }

  Future getImageFromGallery() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path ?? '');
      });
    }
  }

  Future predictImage() async {
    if (_image == null || !_image.existsSync()) {
      return;
    }

    var request = http.MultipartRequest('POST', Uri.parse('http://192.168.43.11:5000/predict'));
    request.files.add(await http.MultipartFile.fromPath('image', _image.path));

    var response = await request.send();
    if (response.statusCode == 200) {
      var responseBody = await response.stream.bytesToString();
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PredictionResultPage(responseBody),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rice Leaf Disease Detection App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _image != null && _image.existsSync()
                ? Image.file(
              _image,
              height: 200,
            )
                : Text('No image selected'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: getImageFromCamera,
              child: Text('Take Photo'),
            ),
            ElevatedButton(
              onPressed: getImageFromGallery,
              child: Text('Choose from Gallery'),
            ),
            ElevatedButton(
              onPressed: predictImage,
              child: Text('Predict'),
            ),
          ],
        ),
      ),
    );
  }
}

class PredictionResultPage extends StatelessWidget {
  final String htmlData;

  PredictionResultPage(this.htmlData);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Prediction Result'),
      ),
      body: WebView(
        initialUrl: Uri.dataFromString(
          htmlData,
          mimeType: 'text/html',
          encoding: Encoding.getByName('utf-8'),
        ).toString(),
        javascriptMode: JavascriptMode.unrestricted,
        navigationDelegate: (NavigationRequest request) {
          if (request.url.startsWith('data:text/html')) {
            return NavigationDecision.navigate;
          } else {
            // Prevent loading other URLs
            return NavigationDecision.prevent;
          }
        },
      ),
    );
  }
}
