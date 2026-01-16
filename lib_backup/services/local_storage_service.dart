import 'package:shared_preferences/shared_preferences.dart';
import 'storage_service.dart';

class LocalStorageService implements StorageService {
  static const _notesKey = 'notes';

  @override
  Future<List<String>> loadNotes() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(_notesKey) ?? [];
  }

  @override
  Future<void> addNote(String text) async {
    final prefs = await SharedPreferences.getInstance();
    final notes = prefs.getStringList(_notesKey) ?? [];
    notes.add(text);
    await prefs.setStringList(_notesKey, notes);
  }

  @override
  Future<void> deleteNote(String id) async {
    final prefs = await SharedPreferences.getInstance();
    final notes = prefs.getStringList(_notesKey) ?? [];
    notes.remove(id);
    await prefs.setStringList(_notesKey, notes);
  }
}
