import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class HomePage extends StatefulWidget {
  final String title;

  HomePage({Key key, this.title}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  File foto;

  @override
  Widget build(BuildContext context) {
    print("build");
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            _mostrarFoto(),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            child: Icon(Icons.file_upload),
            onPressed: () {
              _cargarFotog("upload", ImageSource.gallery);
            },
          ),
          SizedBox(width: 10),
          FloatingActionButton(
            child: Icon(Icons.camera_alt),
            onPressed: () {
              _cargarFotog("camara", ImageSource.camera);
            },
          ),
        ],
      ),
    );
  }

  _cargarFotog(String tipoSelect, ImageSource tipo) async {
    final _picker = ImagePicker();
    PickedFile pickedFile;
    switch (tipoSelect) {
      case "upload":
        pickedFile = await _picker.getImage(
          source: tipo,
        );
        break;
      case "camara":
        pickedFile = await _picker.getImage(
          source: tipo,
        );
        break;
      default:
    }
    if (pickedFile == null) {
      this.foto = null;
    } else {
      foto = File(pickedFile.path);
    }
    setState(() {});
  }

  Widget _mostrarFoto() {
    if (foto == null) {
      return Image(
        image: AssetImage("assets/nofoto.png"),
        height: 300.0,
        width: double.infinity,
        fit: BoxFit.cover,
      );
    }
    return Image.file(
      foto,
      height: 300.0,
      width: double.infinity,
      fit: BoxFit.cover,
    );
  }
}
