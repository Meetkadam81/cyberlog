abstract class StorageService {
  Future<List<String>> loadNotes();
  Future<void> addNote(String text);
  Future<void> deleteNote(String id);
}
