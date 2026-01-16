import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:local_auth/local_auth.dart';

// 🔥 Firebase
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

// Screens
import 'screens/settings_page.dart';
import 'notes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const CyberLogApp());
}

class CyberLogApp extends StatelessWidget {
  const CyberLogApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CyberLog',
      theme: ThemeData(useMaterial3: true),
      home: const PermissionGate(),
    );
  }
}

class PermissionGate extends StatefulWidget {
  const PermissionGate({super.key});

  @override
  State<PermissionGate> createState() => _PermissionGateState();
}

class _PermissionGateState extends State<PermissionGate> {
  File? _image;
  final LocalAuthentication _auth = LocalAuthentication();

  bool _isAuthenticated = false;
  bool _authChecked = false;

  @override
  void initState() {
    super.initState();
    _authenticateUser();
  }

  // 🔐 DEVICE / BIOMETRIC AUTH
  Future<void> _authenticateUser() async {
    try {
      final bool canAuth =
          await _auth.isDeviceSupported() &&
              await _auth.canCheckBiometrics;

      if (!canAuth) {
        _isAuthenticated = true;
      } else {
        _isAuthenticated = await _auth.authenticate(
          localizedReason: 'Authenticate to access CyberLog',
          options: const AuthenticationOptions(
            biometricOnly: false,
            stickyAuth: true,
          ),
        );
      }
    } catch (_) {
      _isAuthenticated = false;
    }

    setState(() {
      _authChecked = true;
    });
  }

  Future<void> requestCamera() async {
    final status = await Permission.camera.request();
    if (status.isGranted) pickFromCamera();
  }

  Future<void> requestStorage() async {
    final status = await Permission.storage.request();
    if (status.isGranted) pickFromGallery();
  }

  Future<void> pickFromCamera() async {
    final picker = ImagePicker();
    final picked = await picker.pickImage(source: ImageSource.camera);
    if (picked != null) {
      setState(() => _image = File(picked.path));
    }
  }

  Future<void> pickFromGallery() async {
    final picker = ImagePicker();
    final picked = await picker.pickImage(source: ImageSource.gallery);
    if (picked != null) {
      setState(() => _image = File(picked.path));
    }
  }

  @override
  Widget build(BuildContext context) {
    // ⏳ WAIT FOR AUTH CHECK
    if (!_authChecked) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    // ⛔ AUTH FAILED
    if (!_isAuthenticated) {
      return const Scaffold(
        body: Center(
          child: Text(
            'Authentication Required',
            style: TextStyle(fontSize: 18),
          ),
        ),
      );
    }

    // ✅ MAIN APP UI
    return Scaffold(
      appBar: AppBar(
        title: const Text('CyberLog'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const SettingsPage(),
                ),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: requestCamera,
              child: const Text('Open Camera'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: requestStorage,
              child: const Text('Open Gallery'),
            ),
            const SizedBox(height: 20),
            _image != null
                ? Image.file(_image!, height: 200)
                : const Text('No image selected'),
            const SizedBox(height: 30),

            // 🔐 SECURE NOTES (NO FAKE LOGIN)
            ElevatedButton.icon(
              icon: const Icon(Icons.lock),
              label: const Text('Open Secure Notes'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const NotesPage(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
