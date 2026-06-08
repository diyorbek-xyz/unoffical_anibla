class CacheEntry<T> {
  final T data;
  final DateTime createdAt;

  CacheEntry(this.data) : createdAt = DateTime.now();

  bool get isExpired => DateTime.now().difference(createdAt).inMinutes > 10;
}
