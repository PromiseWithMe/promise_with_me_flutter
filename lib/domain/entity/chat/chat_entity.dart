class ChatEntity {
  final int id;
  final int role;
  final String content;

  ChatEntity({required this.id, required this.role, required this.content});

  factory ChatEntity.fromJson(Map<String, dynamic> json) {
    return ChatEntity(
      id: json['id'],
      role: json['role'],
      content: json['content'],
    );
  }

  ChatEntity copyWith({int? id, int? role, String? content}) {
    return ChatEntity(
      id: id ?? this.id,
      role: role ?? this.role,
      content: content ?? this.content,
    );
  }
}
