abstract class Storage {
  Future<void> insert(String key, String value);
  Future<String?> get(String key);
}
