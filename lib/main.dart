import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

void main() {
  runApp(const CyberLogApp());
}

class CyberLogApp extends StatelessWidget {
  const CyberLogApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CyberLog',
      home: const PermissionDemo(),
    );
  }
}

class PermissionDemo extends StatefulWidget {
  const PermissionDemo({super.key});

  @override
  State<PermissionDemo> createState() => _PermissionDemoState();
}

class _PermissionDemoState extends State<PermissionDemo> {
  File? _image;

  Future<void> requestCamera() async {
    final status = await Permission.camera.request();
    if (status.isGranted) {
      pickFromCamera();
    }
  }

  Future<void> requestStorage() async {
    final status = await Permission.storage.request();
    if (status.isGranted) {
      pickFromGallery();
    }
  }

  Future<void> pickFromCamera() async {
    final picker = ImagePicker();
    final picked = await picker.pickImage(source: ImageSource.camera);
    if (picked != null) {
      setState(() {
        _image = File(picked.path);
      });
    }
  }

  Future<void> pickFromGallery() async {
    final picker = ImagePicker();
    final picked = await picker.pickImage(source: ImageSource.gallery);
    if (picked != null) {
      setState(() {
        _image = File(picked.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('CyberLog Permissions')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: requestCamera,
              child: const Text('Open Camera (Permission Based)'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: requestStorage,
              child: const Text('Open Gallery (Permission Based)'),
            ),
            const SizedBox(height: 20),
            _image != null
                ? Image.file(_image!, height: 250)
                : const Text('No image selected'),
          ],
        ),
      ),
    );
  }
}
