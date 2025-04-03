import 'package:promise_with_me_flutter/domain/entity/chat/chat_entity.dart';

class ChatsEntity {
  List<ChatEntity> chats;

  ChatsEntity({required this.chats});

  List<ChatEntity> addChat({required ChatEntity chat}) {
    chats.add(chat);
    return chats;
  }

  factory ChatsEntity.fromJson(Map<String, dynamic> json) {
    return ChatsEntity(
      chats:
          json['chats'].map<ChatEntity>((e) => ChatEntity.fromJson(e)).toList(),
    );
  }
}
