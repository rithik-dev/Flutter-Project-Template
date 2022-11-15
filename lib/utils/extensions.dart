extension MapExtension<K, V> on Map<K, V> {
  Map<M, V> mapKeys<M>(M Function(K key) fn) {
    return map((key, value) => MapEntry(fn(key), value));
  }

  Map<K, M> mapValues<M>(M Function(V value) fn) {
    return map((key, value) => MapEntry(key, fn(value)));
  }
}
