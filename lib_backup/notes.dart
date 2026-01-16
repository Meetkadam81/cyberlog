import 'package:flutter/material.dart';
import '../services/auth_service.dart';
import '../services/firestore_service.dart';
import '../services/local_storage_service.dart';
import '../services/storage_service.dart';

class NotesPage extends StatefulWidget {
  const NotesPage({super.key});

  @override
  State<NotesPage> createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  final AuthService _authService = AuthService();
  late StorageService _storage;

  final noteController = TextEditingController();
  List<String> notes = [];

  @override
  void initState() {
    super.initState();
    _initStorage();
  }

  Future<void> _initStorage() async {
    final user = _authService.currentUser;

    _storage = user == null
        ? LocalStorageService()
        : FirestoreService(user);

    notes = await _storage.loadNotes();
    setState(() {});
  }

  Future<void> addNote() async {
    if (noteController.text.isEmpty) return;
    await _storage.addNote(noteController.text);
    noteController.clear();
    await _initStorage();
  }

  Future<void> deleteNote(String note) async {
    await _storage.deleteNote(note);
    await _initStorage();
  }

  Future<void> toggleLogin() async {
    if (_authService.isLoggedIn) {
      await _authService.signOut();
    } else {
      await _authService.signInAnonymously();
    }
    await _initStorage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Notes'),
        actions: [
          IconButton(
            icon: Icon(
              _authService.isLoggedIn ? Icons.logout : Icons.login,
            ),
            onPressed: toggleLogin,
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: noteController,
                    decoration:
                    const InputDecoration(hintText: 'Enter note'),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: addNote,
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: notes.length,
              itemBuilder: (_, index) => ListTile(
                title: Text(notes[index]),
                trailing: IconButton(
                  icon: const Icon(Icons.delete, color: Colors.red),
                  onPressed: () => deleteNote(notes[index]),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
