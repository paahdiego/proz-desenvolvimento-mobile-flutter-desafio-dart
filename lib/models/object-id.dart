abstract class ObjectId {
  final String id;
  final DateTime createdAt;
  ObjectId({
    required this.id,
    required this.createdAt,
  });

  @override
  String toString() => 'ObjectId(id: $id, createdAt: $createdAt)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ObjectId && other.id == id && other.createdAt == createdAt;
  }

  @override
  int get hashCode => id.hashCode ^ createdAt.hashCode;
}
