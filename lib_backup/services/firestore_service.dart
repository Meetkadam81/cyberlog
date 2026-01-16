import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'storage_service.dart';

class FirestoreService implements StorageService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final User user;

  FirestoreService(this.user);

  CollectionReference get _notes =>
      _db.collection('users').doc(user.uid).collection('notes');

  @override
  Future<List<String>> loadNotes() async {
    final snapshot =
    await _notes.orderBy('createdAt', descending: true).get();

    return snapshot.docs
        .map((doc) => doc['text'] as String)
        .toList();
  }

  @override
  Future<void> addNote(String text) async {
    await _notes.add({
      'text': text,
      'createdAt': Timestamp.now(),
    });
  }

  @override
  Future<void> deleteNote(String id) async {
    await _notes.doc(id).delete();
  }
}
